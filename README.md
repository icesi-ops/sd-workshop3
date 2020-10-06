# sd-workshop3
Repor for workshop3

2.Despues de crear y probar los archivos Dockerfile (uno con la catidad de RUN hechos en clase 
y uno Optimizado con solo 2 RUN) se ve que el peso de ambos es el mismo

REPOSITORY                             TAG                 IMAGE ID            CREATED             SIZE
bryanmv/workshop3conalpineoptimizado   0.0.2               bbb9ee94b733        2 minutes ago       13.4MB
bryanmv/workshop3conalpine             0.0.1               2ff2e9438a36        20 minutes ago      13.4MB


Para este caso no se logra apreciar un cambio en los tamaños de los archivos, pero en un caso donde 
la cantidad de comandos RUN fuera mucho mas grande se podria observar un cambio entre los pesos.


3.La diferencia mas significativa entre CMD y ENTRYPOINT es: 
ENTRYPOINT especifica un comando que se ejecutara al iniciar el contenedor
CMD se encarga de especificar los argumentos predeterminados, por ejemplo 
el servicio donde se ejecutaran los comandos
