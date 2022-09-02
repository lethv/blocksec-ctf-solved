Welcome to this smart contract CTF!
On the following challenges you're going to explore and exploit some of the most common vulnerabilities and flaws in Solidity smart contracts!
Hope you enjoy it!

1 - Hello world!
Este contrato solo quiere darte la bienvenida, pero para hacerlo tendrás que presentarte correctamente.

2 - Deposit
El contrato en el que se basa este desafío tiene como objetivo solucionar el problema de la confianza a la hora de hacer un intercambio. Quitandole lógica para mayor simplificada, este contrato básicamente funciona como un déposito. Una vez se ha instanciado y depositado divisa por parte de su propietario, este ya no puede realizar una retirada del dinero. 
El objetivo pues, es conseguir retirar el dinero siendo propietario.


3- Roulette
Este contrato actúa como el típico juego de azar de la ruleta. El usuario puede realizar una apuesta a uno de los dos colores disponibles y el contrato determinará si ha acertado o no. En caso de acierto el participante doblará la cantidad de divisa aportada. En caso de que no haya acertado, el contrato se quedará con la divisa.
El objetivo es conseguir predecir el color que saldrá en la ruta, a priori aleatorio.


4 - Exchange
En este caso, la solución implementada mediante contrato actua como un exchange de divisas. En este los usuarios pueden comprar EUR y USD mediante ethers. También tienen la posibilidad de intercambiar EUR y USD entre si.
El objetivo es pues, conseguir comprar divisa a un precio inferior del estipulado.

5 - Auction
Esta solución pretende actuar como lo haría una subasta real. Ofreciendo la posibilidad de pujar, y otorgando la subasta a la puja más alta. Es el propietario del contrato el organizador y quién decide cuando finaliza la subasta y la puja más alta resulta ganadora. Esta solución es una simplifación, para no vincular el desafío a un espacio temporal. Una vez finalizada la subasta, las pujas que no hayan ganado pueden ser retiradas. También el organizador podrá retirar la puja más alta.
El objetivo en este caso es alterar el funcionamiento correcto de la subasta para conseguir ganarla de forma arbitraria.

6 - TokenSale
En este caso se trata de un contrato que funciona ofreciendo un servicio de compra y venta de tokens. En el flujo normal de funcionamiento el precio de compra y venta de tokens es exactamente el mismo. 
El objetivo es conseguir un beneficio con la compra y venta de tokens. 

7 - Lottery
Este desafío esta compuesto por un contrato que permite comprar boletos de una rifa.
Una vez vendidos los boletos, el propietario puede acabar el sorteo para determinar el boleto ganador. 
Una vez más esta solución se adopta para no tener una dependencia temporal, en un entorno real el sorteo finalizaria automáticamente.
El objetivo es conseguir ganar la loteria más de una vez.


8 - Logic flaw II