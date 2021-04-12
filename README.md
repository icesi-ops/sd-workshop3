# 1. Imagen Docker
Está disponible en: docker pull schasqui/ws3_angular
# 2. Diferencia entre CMD y ENTRYPOINT
El **CMD** define el comando que siempre se va a ejecutar por default al iniciar un contenedor Docker, se le pueden pasar parámetros por la command-line y sobreescribe el parámetro que tenga en la isntrucción CMD. El**ENTRYPOINT** declara un comando que siempre se va a ejecutar cuando el contenedor se inicie pero la diferencia es que el entrypoint no se puede sobreescribir pasandole un parámetro por la command-line, sino que agrega el parámetro al final.
# 3. Estudio de multiples runs vs un run
En el estudio pude evidenciar que añadiéndole algunas instrucciones como echos o separando el update del cacher, el tamaño no cambiaba (se mantenía en 109 MB), sin embargo, cuando ya se descargaba e instalaba un paquete como nodejs, el peso de la imagen cambió a 171 MB.

Con este se entiende que instalar paquetes innecesarios puede impactar en gran medida el peso de la imagen de docker, por lo que hay que cuidarse de instalar lo necesario. Según internet, también se puede optimizar uniendo comandos cuando sea posible con e &&.
