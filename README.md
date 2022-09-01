Welcome to this smart contract CTF!
On the following challenges you're going to explore and exploit some of the most common vulnerabilities and flaws in Solidity smart contracts!
Hope you enjoy it!

1 - Hello world!


2 - Deposit
El contrato en el que se basa este desafío tiene como objetivo solucionar el problema de la confianza a la hora de hacer un intercambio.
Quitandole lógica para mayor simplificada, este contrato básicamente funciona como un deposito. Una vez se ha instanciado y depositado
divisa por parte de su propietario, este ya no puede realizar una retirada. En esta versión más sencilla, solo se valida que quién intenta
realizar la retirada no sea el propietario. 
El objetivo pues, es conseguir retirar el dinero siendo propietario.

3- Exchange
En este caso, la solución implementada mediante contratos es un exchange de divisas. En este los usuarios pueden comprar EUR y USD mediante ethers. También tienen la posibilidad de intercambiar divisas entre si.
El objetivo es pues, conseguir comprar divisa a un precio inferior del estipulado.

4 - Auction
En esta solución se pretende actuar como se haría en una subasta real. Siendo el propietario del contrato el organizador y quién puede decidir
cuando finaliza y se define el ganador. Una vez finalizada la subasta, las pujas que no hayan ganado pueden ser retiradas. También el organizador podrá retirar la puja más alta.
El objetivo en este caso es alterar el funcionamiento correcto de la subasta para conseguir ganarla.

5 - TokenSale
En este caso se trata de un contrato que funciona ofreciendo un servicio de compra y venta de tokens. En el flujo normal de funcionamiento el precio de compra y venta de tokens es exactamente el mismo.
El objetivo es conseguir un beneficio con la compra y venta de tokens. 

6 - Lottery
Este desafío esta compuesto por un contrato que permite comprar boletos de loteria y decidir el número ganador. 
Una vez vendidos los boletos, el propietario puede activar la funcionalidad para determinar el boleto ganador.


7 - 

8 -