# sd-workshop3
Repor for workshop3


Imagen:
docker push sereme98/angular:tagname

Respuestas a preguntas:
CMD : Ejecuta los comandos o instrucciones por defecto que se ejecutan cuando corremos los contenedores sin pasarle ningun parametro. Cuando se le pasa un parametro o argumento, esto cambia y se ejecutan los parametros o argumentos que se ingresaron en el CMD.

ENTRYPOINT: Es parecido al CMD pero su diferencia radica en que las instrucciones que ejecuta el ENTRYPOINT no van a cambiar asi se le pase parametros a la funcion ENTRYPOINT.


Pesos:
Al realizar la prueba de agregarle mas RUN al dockerfile de la aplicacion , en un principio no vi ninguna diferencia entre el peso inicial de la imagen y el peso con la adicion de mas RUN. Con esto puedo concluir que el agregar n RUN al dockerfile no influira en el peso de la imagen creada.
