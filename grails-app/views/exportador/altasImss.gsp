<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="exportadores"/>
<title>Aviso de Altas IMSS</title>
</head>
<body>

	<content tag="reporteTitle">
		Aviso de Altas Imss
	</content>
	<content tag="reportForm">
		<g:hasErrors bean="${reportCommand}">
            <div class="alert alert-danger">
                <g:renderErrors bean="${reportCommand}" as="list" />
            </div>
        </g:hasErrors>
		<div class="col-sm-6">
			<g:form action="generarAltasImss" class="form-horizontal">
				<fieldset>
					<legend> Parámetros</legend>
					<f:with bean="${reportCommand}">
						<f:field property="fechaInicial" />
						<f:field property="fechaFinal" />
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