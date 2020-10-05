# sd-workshop3
Repor for workshop3

**2.** Luego de analizar las dos imagenes de docker, se puede concluir que con los RUN juntados con los símbolos "&&", se puede apreciar que los pesos son los mismos. Aunque, si se dimensionara en grande la cantidad de  veces que se escribe la instrucción RUN, entonces si se vería un aumento en el peso de las imagenes. Esto es debido a que la intrucción RUN hace parte de las instrucciones que agregar "capas" en la configuración de la imagen, así como también "ADD" y "COPY".

**3.** 	_I)_ La diferencia entre estas instrucciones es que CMD es una que _pasa valores por defecto a un contenedor_. Estos valores pueden contener ejecutables u omitirlos.
	_II)_ ENTRYPOINT es una instrucción que corre un ejecutable cuando un contenedor está arrancando. Diferente de CMD que ejecuta líneas cuando el contenedor ya está ha arrancado y está corriendo. La instrucción se usa cuando se quiere correr un servidor web por ejemplo, u otro servicio.
 
