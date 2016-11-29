<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="reportes"/>
<title>Reportes</title>
</head>
<body>

	<content tag="reporteTitle">
		Vacaciones por empleado
	</content>
	
	<content tag="reportForm">
		<g:hasErrors bean="${reportCommand}">
            <div class="alert alert-danger">
                <g:renderErrors bean="${reportCommand}" as="list" />
            </div>
        </g:hasErrors>
		<div class="col-sm-8">
		
		<g:form action="reportePorEmpleadoEjercicio2" class="form-horizontal">
			<fieldset>
				<g:hiddenField name="reportName" value="VacacionesEmpleado"/>
				<legend> Parámetros</legend>
				<f:with bean="${reportCommand}">
					<f:field property="ejercicio" widget-class="form-control"/>
					<f:field property="empleado" />
				</f:with>
			</fieldset>
			<div class="form-group">
		    	<div class="col-sm-offset-2 col-sm-3">
		      		<button type="submit" class="btn btn-default">
		      			<span class="glyphicon glyphicon-cog"></span> Ejecutar
		      		</button>
		    	</div>
		  	</div>
		</g:form>
		</div>
	</content>
	
</body>

</html>