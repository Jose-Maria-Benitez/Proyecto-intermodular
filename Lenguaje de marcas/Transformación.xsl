<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="/">

<html>
<head>
<title>Crucero</title>
<link rel="stylesheet" href="estilos.css"/>
</head>

<body>

<h1>Información del Crucero</h1>

<xsl:for-each select="cruceros/crucero">
<div class="card">

<h2>Crucero ID: <xsl:value-of select="id"/></h2>
<p><b>Capacidad:</b> <xsl:value-of select="capacidad"/></p>
<p><b>Zonas:</b> <xsl:value-of select="zonas"/></p>
<p><b>Itinerario:</b> <xsl:value-of select="itinerario"/></p>

<h3>Turistas</h3>
<table>
<tr><th>ID</th><th>Nombre</th><th>Categoría</th></tr>
<xsl:for-each select="turistas/turista">
<tr>
<td data-label="ID"><xsl:value-of select="id"/></td>
<td data-label="Nombre"><xsl:value-of select="nombre"/></td>
<td data-label="Categoría"><xsl:value-of select="categoria"/></td>
</tr>
</xsl:for-each>
</table>

</div>
</xsl:for-each>

</body>
</html>

</xsl:template>
</xsl:stylesheet>