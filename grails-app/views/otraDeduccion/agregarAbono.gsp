<html>
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="operacionesForm"/>
	<title>Abono otra deduccion</title>
</head>
<body>

	<content tag="header">
		<h3>Abono para otra deduccion: ${otraDeduccionInstance.id} a nombre de: ${otraDeduccionInstance.empleado}</h3>
	</content>
	
	<content tag="operaciones">
		<ul class="nav nav-pills nav-stacked">
  			<li><g:link action="edit" id="${otraDeduccionInstance.id}">
  					<span class="glyphicon glyphicon-arrow-left"></span> Regresar
  			    </g:link>
  			</li>
		</ul>
	</content>
	
	<content tag="formTitle">Registro de abono</content>
	
	<content tag="form">
		
		<g:hasErrors bean="${otraDeduccionAbonoInstance}">
            <div class="alert alert-danger">
                <g:renderErrors bean="${otraDeduccionAbonoInstance}" as="list" />
            </div>
        </g:hasErrors>
		
		<g:form action="salvarAbono"  class="form-horizontal" >
			<div class="modal-body">
			<g:hiddenField name="otraDeduccionId" value="${otraDeduccionInstance.id}"/>
			<f:with bean="${otraDeduccionAbonoInstance}">
				<f:field property="fecha" input-class="form-control"/>
				<f:field property="importe" input-class="form-control" input-type="text"/>
				<f:field property="comentario" input-class="form-control"/>
			</f:with>
			</div>
			<div class="modal-footer">
				<g:submitButton class="btn btn-primary" name="update" value="Salvar"/>
			</div>
		</g:form>
		
	</content>
	
</body>
</html>