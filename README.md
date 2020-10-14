John Sebastian Urbano Lenis

Instrucciones del workshop

1- Desplegar servidor web scraping icesi usando una imagen de alpine como base
2- Analizar pesos(MB) de imagenes cuando: Tenemos varios RUN en el dockerfile y cuando tenemos un solo RUN en el dockerfile
3- Decir las diferencias entre CMD y ENTRYPOINT

Desarrollo

1- Se encuentra el dockerfile en la carpeta alpine

2- Entre usar un solo RUN y varios RUNs no hubo ninguna diferencia a nivel de MB, sin embargo, teoricamente existe diferencia que no impacta de manera significativa el peso de la imagen. 

3- ENTRYPOINT es usado para ejecutar un servicio en especifico cuando el sistema ya ha inicializado, mientras que el CMD es usado para ejecutar comandos mientras que el contenedor inicialice, también puede ser usado para pasar variables al contenedor.

