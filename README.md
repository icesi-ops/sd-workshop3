# sd-workshop3
Imagen: paovn/workshop3

**Investigación:**

**¿Cuál es la diferencia entre CMD Y ENTRYPOINT?**
CMD es el comando que se ejecuta un servidor web y sus parametros se pueden sobreescribir, y estos son principalmente utilizado para montar servicios. 
ENTRY POINT sirve para correr o ejecutar un contenedor, sin embargo en este caso no se sobreescribe ese parametro, funcionando como un ejecutable.

**Tamaños de imagenes**
¿El numero de instrucciones run causa un cambio en el tamaño?

Segun la documentación de docker para las buenas practicas al implementar un docker file, lo ideal es hacer las instrucciones en un run debido a que se puede incrementar el tamaño, sin embargo, aunque hace esta recomendación, el aumento de instrucciones run en pequeña escala no hace cambios significativos en el tamaño.