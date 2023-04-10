package main

import (
	"database/sql"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	_ "github.com/lib/pq"
)

type Files struct {
	ID int
	Username string
	File1_path string
    File2_path string
}

const (
	host     = "localhost"
	port     = 5432
	user     = "postgres"
	password = "password"
	dbname   = "testdb"
)

var db *sql.DB

func init() {
	var err error
	db, err = sql.Open("postgres", "postgres://usuario:contraseña@localhost/nombre_bd?sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	if err = db.Ping(); err != nil {
		log.Fatal(err)
	}
}

func main() {
	defer db.Close()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		tmpl, err := template.ParseFiles("templates/index.html")
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		err = tmpl.Execute(w, nil)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
	})

	http.HandleFunc("/upload", uploadHandler)

	log.Println("Servidor iniciado en http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func uploadHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" {
		http.Error(w, "Método no permitido", http.StatusMethodNotAllowed)
		return
	}

	username := r.FormValue("username")
	if username == "" {
		http.Error(w, "El nombre de usuario no puede estar vacío", http.StatusBadRequest)
		return
	}

	file1, file1Header, err := r.FormFile("file1")
	if err != nil {
		http.Error(w, "Error al leer el archivo 1", http.StatusBadRequest)
		return
	}
	defer file1.Close()

	file2, file2Header, err := r.FormFile("file2")
	if err != nil {
		http.Error(w, "Error al leer el archivo 2", http.StatusBadRequest)
		return
	}
	defer file2.Close()

	if file1Header.Header.Get("Content-Type") != "text/html" || !strings.HasSuffix(file1Header.Filename, ".html") {
		http.Error(w, "El archivo 1 debe ser un archivo HTML", http.StatusBadRequest)
		return
	}

	if file2Header.Header.Get("Content-Type") != "text/plain" || !strings.HasSuffix(file2Header.Filename, ".txt") {
		http.Error(w, "El archivo 2 debe ser un archivo de texto", http.StatusBadRequest)
		return
	}

	ruta := filepath.Join("/mnt", username)

	if _, err := os.Stat(ruta); os.IsNotExist(err) {
		if err := os.Mkdir(ruta, 0777); err != nil {
			http.Error(w, "Error al crear el directorio del usuario", http.StatusInternalServerError)
			return
		}
	}

    file1Path := filepath.Join(ruta, file1Header.Filename)
	if err := guardarArchivo(file1, file1Path); err != nil {
		http.Error(w, "Error al guardar el archivo 1", http.StatusInternalServerError)
		return
	}

	file2Path := filepath.Join(ruta, file2Header.Filename)
	if err := guardarArchivo(file2, file2Path); err != nil {
		http.Error(w, "Error al guardar el archivo 2", http.StatusInternalServerError)
		return
	}

	if err := guardarEnBaseDatos(username, file1Path, file2Path); err != nil {
		http.Error(w, "Error al guardar la información en la base de datos", http.StatusInternalServerError)
		return
	}

	fmt.Fprintf(w, "Archivos cargados exitosamente")
}

func guardarArchivo(file io.Reader, ruta string) error {
	f, err := os.Create(ruta)
	if err != nil {
		return err
	}
	defer f.Close()

	_, err = io.Copy(f, file)
	if err != nil {
		return err
	}

	fmt.Printf("Archivo guardado en: %s\n", ruta)

	return nil
}

func guardarEnBaseDatos(username string, file1Path string, file2Path string) error {

    dbinfo := fmt.Sprintf("host=%s port=%d user=%s "+
    "password=%s dbname=%s sslmode=disable",
    host, port, user, password, dbname)
db, err := sql.Open("postgres", dbinfo)
  //  db, err := sql.Open("postgres", "user=postgres password=postgres dbname=postgres host=localhost port=5432 sslmode=disable")
    if err != nil {
        return err
    }
    defer db.Close()

    var id int
    err = db.QueryRow("INSERT INTO files(username, file1_path, file2_path) VALUES($1, $2, $3) returning id", username, file1Path, file2Path).Scan(&id)
    if err != nil {
        return err
    }
    fmt.Printf("Registro insertado con ID: %v\n", id)

    fmt.Printf("Archivo guardado en la base de datos con ID %d\n", id)
    return nil
}


