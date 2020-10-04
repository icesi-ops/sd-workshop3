# sd-workshop3


2. Al analizar las dos imagenes, una con los RUN puestos juntos, vemos que el resultado en peso es el mismo, obteniendo 13.4MB en ambas, luego de indargar un poco, me di cuenta que este resultado no manifiesta diferencias debido a la pequeña cantidad de RUN que hay, pero normalmente deberian existir amplias diferencias, debido a que cada RUN agrega una nueva "Layer" o capa a nuestra imagen, lo que a la larga se traduce en una gran diferencia de pesos 

(Fuente https://phoenixnap.com/kb/docker-image-size)

3. El comando CMD se encarga de pasar valores por defecto a el contenedor, incluyendo ejecutables, la principal caracteristica de este comando es que este se ejecuta una vez inicializado el contenedor, es decir, cuando se corre la imagen y se entra al contenedor, se puede observar las instrucciones enviadas a partir del CMD corriendo en el contenedor

Por otro lado, el comando EntryPoint se ejecuta cuando inicia el contenedor, como el CMD, pero se usa cuando se quiere usar el contenedor como un ejecutable, de ahì viene su nombre, funciona como un punto de entrada a los ejecutables que se quieren correr en el contenedor
