<html>
<head>
	<meta charset="UTF-8">
	<title>Calendario ${calendarioInstance.id}</title>
</head>
<body>
	<div class="container">
	
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a href=" link_1" class="list-group-item active">Operaciones</a>
					<g:link action="index" class="list-group-item">
						<span class="glyphicon glyphicon-list"></span> Calendarios
					</g:link>
					<a href=" link_3" class="list-group-item" id="saveLink">
						<span class="glyphicon glyphicon-floppy-save"></span> Salvar
					</a>
					<g:link action="delete" id="${calendarioInstance.id}" class="list-group-item" onclick="return confirm('¿ Elminar todo el calendario de operaciones?');">
						<span class="glyphicon glyphicon-trash"></span> Eliminar
					</g:link>
					<g:if test="${!calendarioInstance.periodos}">
						<g:link action="generarPeriodos" id="${calendarioInstance.id}" class="list-group-item" onclick="return confirm('¿ Generar periodos del trabajo para el calendario ?');">
							<span class="glyphicon glyphicon-cog"></span> Generar Periodos
						</g:link>
					</g:if>
					
					
					<a href="#" class="list-group-item" id="addPartida" data-toggle="modal" data-target="#periodoModalForm">
						<span class="glyphicon glyphicon-floppy-plus"></span> Agregar
					</a>
					
					
				</div>
			</div>
			<div class="col-md-10">			
				<g:render template="editForm"/>
			</div>
		</div><!-- End .row 1 -->
		
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#periodos" data-toggle="tab">Periodos</a></li>
  				
			</ul>
			
			<div class="tab-content">
  				<div class="tab-pane active" id="periodos"><g:render template="periodosGrid"></g:render></div>
  				
			</div>
		</div>
		
	</div> <!-- End .container -->
	
	
	<!-- Modal para el alta de periodos -->
	<div class="modal fade" id="periodoModalForm" tabindex="-1" >
		<div class="modal-dialog">
			<div class="modal-content">
				<g:render template="agregarPeriodoform"/>
			</div> <!-- moda-content -->
		</div> <!-- modal-dialog -->
	</div> <!-- .modal  -->
	
</body>
</html>