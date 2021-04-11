# Workshop-3

## Diferencia entre CMD y ENTRYPOINT

**Si bien es cierto que los dos sirven para ejecutar comandos por defecto al correr el contenedor, CMD ofrece mas versatilidad ya que podemos agregarle argumentos y podemos sobreescribirlo, mientras que ENTRYPOINT se utiliza mas como un ejecutable**

## Diferencia entre Dockerfile y DockerfileCorto

**Para la siguiente demostración se crearon dos dockerfile, los dos montaran un servidor en localhost mediante ubuntu, la unica diferencia de estos dockefile es que en el Dockerfile se pondran RUN siempre, mientras que en DockerfileCorto nos ahorraremos un par de RUN metiendo todo en un RUN utilizando &&. Despues de hacer esto comprobamos que la diferencia de pesos fue de 1MB siendo Dockerfile mas pesado**
