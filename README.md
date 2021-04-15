# sd-workshop 3

## Docker image information
### - image: zeronetdev/todo
### - tag: 0.0.1
### - port: 80

## Diferencia entre CMD y ENTRYPOINT  

### - [CMD](https://docs.docker.com/engine/reference/builder/#cmd): El principal proposito de CMD es para prover el punto de inicio por defecto de el contenedor, puede ser usado para pasar los parametros por defecto, pero en este caso se debe especificar el ejecutable en el ENTRYPOINT

### - [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint): El ENTRYPOINT permite configurar el ejecutable que ejecutara el contenedor, lo puesto en el CMD sera pasado por argumento al ENTRYPOINT

## Causa el numero de instrucciones RUN alguna diferencia en el tamaño

Las instrucciones run **si** tienen un impacto en el tamaño de una imagen, sin embargo este es pequeños, esto debido a que cada instruccion RUN tiene un cahe de las modificaciones que dejan en el filesystem