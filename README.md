# CiberRosario
Proyecto UTN Java

Link documento proyecto : https://docs.google.com/document/d/1GN4Sj4ZSWXC9UEjRwcvyGoUat__PC3ZnQfoWKtnp5OI/edit?usp=sharing

#### Checklist

##### Regularidad

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC simple|1 x integ|1 x integ|Modificacion precio / descuento|
|ABMC dependiente|1|2|Alta computadora / usuario / reserva|
|CU NO-ABMC|1|2|Realizar reserva online|
|Listado simple|1|3(*)||
|Listado complejo|0|1(*)|Sin detalle|



##### Aprobación Directa

|Requerimiento|cant. mín.<br>1 o 2 integ|cant. máx.<br>3 o 4 integ|Detalle/Listado de casos incluidos|
|:-|-:|-:|:-|
|ABMC|todos|todos|Computadora/Reserva/Usuario/Descuento/Precios|
|CU "Complejo"(nivel resumen)|1|2|Confirmar reserva|
|Listado complejo|1|2|Detalle de computadora con su cantidad disponible / Detalle de reserva por usuario|
|Nivel de acceso|2|2|Invitado / User / Admin|
|Manejo de errores|obligatorio|obligatorio|no requiere detalle|
|requerimiento extra obligatorio (**)|0|1|Envio de mails/Custom exceptions|
|publicar el sitio|olbigatorio|obligatorio|no requiere detalle|


###### Requerimientos extra - AD
|Requerimiento |Detalle/Listado de casos incluidos|
|:-|:-|
|Manejo de archivos|No Implementado|
|Custom exceptions|Validar campos/Error de autenticacion|
|Log de errores|No Implementado|
|Envio de emails|Mail con codigo de reserva mas detalle|
