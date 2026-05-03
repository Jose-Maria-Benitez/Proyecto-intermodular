Los datos aquí representados tienen que ver con los contenidos de la base de datos creada para este proyecto. Este trabajo versa sobre la nueva adquisición de un crucero pequeño por parte de una empresa de viajes por el Mediterráneo.
Entre los datos, constan los puertos visitados, la tripulación, los pasajeros del barco, los eventos organizados, incidencias y solicitudes de los clientes.
Además, se guardan los registros almacenados en la base de datos, como son nombres, DNI, apellidos, zonas del barco, etc.

Para validar el con el dtd, vamos a esta web https://www.freeformatter.com/xml-validator-xsd.html, introducimos el XML en la parte de arriba de la página (pegando el código o diréctamente introduciendo el archivo) y el dtd en la parte de abajo (mismas condiciones que el xml). Tras esto, le damos al botón de validar y en función de cómo esté el xml nos devolverá un mensaje validando o no el documento.
Esto se importaría en la base de datos para validar los datos que se vayan subiendo a la misma.

Para ver la transformación a HTML, teniendo en la misma carpeta el xml, el css y el xsl, ejecutamos desde el navegador el xml. La línea <?xml-stylesheet type="text/xsl" href="Transformación.xsl"?> debería ejecurarse e iniciar la transformación.
