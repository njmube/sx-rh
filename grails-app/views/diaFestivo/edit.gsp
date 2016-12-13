<html>
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="editForm"/>
	<title>Día festivo ${diaFestivoInstance.fecha.text()}</title>
	<g:set var="entity" value="${diaFestivoInstance}" scope="request" />
	<g:set var="imprimible" value="${false}" scope="request" />
</head>
<body>

<content tag="header">
	Día festivo ${diaFestivoInstance.fecha.text()} 
</content>

<content tag="formFields">
	<f:with bean="diaFestivoInstance">
		<f:field property="ejercicio" widget-class="form-control"/>
		<f:field property="fecha"  />
		<f:field property="descripcion" widget-class="form-control" />
		<f:field property="parcial" widget-class="form-control" />
		<f:field property="salida" widget-class="form-control" />
	</f:with>
</content>
	
</body>
</html>


