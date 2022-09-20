##### ES
¡Bienvenido a este CTF de contratos inteligentes! Este proyecto es el resultado de la realización del TFM: Desarollo de un CTF de Smart Contracts en Solidity.  
En los siguientes desafíos vas a descubrir y explotar algunas de las vulnerabilidades y fallos más habituales en smart contracts implementados en Solidity.  
Como este repositorio incluye las soluciones y versiones seguras, se incluye una breve explicación de cada desafío en este README.
¡Pásalo bien!


##### EN
Welcome to this smart contract CTF! This project is the result of the execution of the master's thesis: Development of a CTF on Smarts Contracts in Solidity.  
On the following challenges you're going to explore and exploit some of the most common vulnerabilities and flaws in Solidity smart contracts!  
Hope you enjoy it!

### 1 - Hello world!
Este contrato solo quiere darte la bienvenida, pero para hacerlo tendrás que presentarte correctamente. Introduce la respuesta correcta y habrás superado el desafío.

Explicación: basta con escribir Hello world!, la respuesta se encuentra en claro, pero encodeada en base64.

### 2 - Subscription
Este contrato permite realizar depósitos, pagar y consultar el saldo al usuario propietario. Permite también consultar el propietario del contrato de forma pública. La idea es sencilla, cuando toque hacer un pago, el propietario puede realizarlo de forma ágil introduciendo la dirección de destino. Esto se podría automatizar para realizar pagos automáticos de forma periódica.  
El objetivo en este caso consiste en realizar un pago sin ser el propietario, aprovechándose para retirar los fondos del contrato.

Explicación: comprobación mediante tx.origin, se solventa con un bypass. Se pueden transferir fondos desde la función receive.

### 3- Roulette
Este contrato actúa como el juego de azar de la ruleta. El usuario puede realizar una apuesta a uno de los dos colores disponibles y el contrato determinará si ha acertado o no. En caso de acierto, el participante doblará la cantidad de divisa aportada. En caso de que no haya acertado, el contrato se quedará con la divisa apostada.  
El objetivo es conseguir predecir el color que saldrá en la ruta, a priori aleatorio.

Explicación: a pesar de que el color ganador se decide tras finalizar las apuestas, este depende de la variable now. Utilizando esto puede jugarse a la ruleta y apostar en el mismo momento, anticipando el color que va a salir.

### 4 - Exchange
En este caso, la solución implementada con este contrato actúa como un exchange de divisas. En este los usuarios pueden comprar EUR y USD mediante ethers. También tienen la posibilidad de intercambiar EUR y USD entre si. Y, en última instancia, pueden vender sus EUR y USD por ethers, al mismo precio que los han adquirido.  
El objetivo es conseguir comprar divisa a un precio inferior del estipulado.

Explicación: generando un overflow que haga cumplir la condición de compra, se puede comprar una gran cantidad de divisa a un precio irrisorio. Esta puede ser vendida luego al precio estandar generando beneficio.

### 5 - Auction
Esta solución pretende actuar como lo haría una subasta real. Ofreciendo la posibilidad de pujar, otorgando la subasta a la puja más alta. Es el propietario del contrato, el organizador y quién decide cuando finaliza la subasta y por ende, cuando la puja más alta resulta ganadora. Esta solución es una simplificación, para no vincular el desafío a un espacio temporal. Una vez finalizada la subasta, las pujas que no hayan ganado pueden ser retiradas. También el organizador podrá retirar la puja más alta y ganadora.  
El objetivo en este caso es alterar el funcionamiento correcto de la subasta para conseguir ganarla de forma arbitraria.

Explicación: el contrato tiene configurada la función fallback, para acabar la subhasta en caso de error. Se puede forzar la ejecución de esta función siendo la puja máxima, ganando así la subaasta.


### 6 - TokenSale
En este caso se trata de un contrato que funciona ofreciendo un servicio de compra y venta de tokens. En el flujo normal de funcionamiento, el precio de compra y venta de tokens es exactamente el mismo.  
El objetivo es conseguir un beneficio con la compra y venta de tokens. 

Explicación: en este desafío hay que aprovecharse de la vulnerabilidad de reentrada. Tras comprar y vender tokens, se puede hacer que en el momento de recibirlos, se vuelva a realizar una venta. Esta se realizará previa actualización de las cantidades, provocando que se abone dos veces el valor vendido.

### 7 - Raffle
Este desafío está formado por un contrato que permite comprar boletos de una rifa. Una vez vendidos los boletos, el propietario puede acabar el sorteo para determinar el boleto ganador. También en este caso, se adopta esta última restricción para no tener una dependencia temporal, en un entorno real el sorteo finalizaría automáticamente.  
El objetivo es conseguir ganar la lotería más de una vez, teniendo en cuenta que solo se puede jugar una vez por contrato.

Explicación: para conseguir superar este desafío hay que combinar dos vulnerabilidades. Por una parte hay que precacular el número ganador de la rifa y forzar la ejecución de la función fallback. Al forzarla finalizará la rifa y se calculará el ganador. Por último hay un fallo en la lógica del contrato, ya que una vez otorgado el premio, este no comprueba si ya se ha entregado. Por tanto se puede reclamar el premio infinidad de veces.

### 8 - Splitcount
Este desafío se basa en un contrato que ofrece el servicio de dividir la cuenta en, por ejemplo, un restaurante. El contrato se crea por el negocio indicando la cantidad a pagar y el número de comensales. Una vez desplegado, los clientes deben indicar como quieren dividir la cuenta, si en modo libre (cualquiera puede aportar lo que quiera) o dividirla entre todos. En esta segunda modalidad, cada persona debe pagar, como mínimo, la parte equivalente a repartir la cuenta a partes iguales entre todos los comensales. 
Una vez se ha pagado el importe correcto, el contrato marcará la cuenta como pagada.

El objetivo es conseguir un descuento, pagando la cuenta a un precio inferior al estipulado.

Explicación: hay un fallo en la gestión del importe restante a pagar en la modalidad 2. Al poder pagar una persona más de lo que le tocaria (por ejemplo paga por 2), se recalcula mal la división. Se tiene en cuenta el importe correcto, pero se divide entre el total de comensales, reduciendo la factura restante más de la cuenta. Esto permite que con cada pago realizado, el importe mínimo que puede pagar el siguiente sea inferior. Una vez han pagado todos los comensales, la factura se da por pagada. 
Si la condición de pago mínimo estuviese bien implementada, no habría problema en comprobar el pago utilizando el número de personas que han pagado. No obstante, la solución ideal ese siempre mirar la diferencia entre el importa pagado y el importe a pagar.
