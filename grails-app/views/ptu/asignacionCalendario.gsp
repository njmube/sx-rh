<html>
<head>
	<meta charset="UTF-8">
	<title>PTU (${ptuInstance.ejercicio})</title>
	<r:require modules="forms,datatables"/>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="well well-sm">
					<g:link action="index">
						<h3>
							Asignación manual de calendario de pago para PTU del ejercicio ${ptuInstance.ejercicio} 
						</h3>
					</g:link>
					<g:if test="${flash.message}">
						<div class="message" role="status">
							<strong>${flash.message}</strong>
						</div>
					</g:if>
				</div>
			</div>
		</div><!-- end .row 1 -->
		
		
		<div class="row">
			<div class="col-md-12">
				<div class="">
					
					<div class="button-panel">
						<div class="btn-group col-md-4">
							<input type='text' id="nombreField" placeholder="Empleado" class="form-control" autofocus="autofocus" autocomplete="off">
						</div>
						<div class="btn-group">
							<input type='text' id="ubicacionField" placeholder="Ubicacion" class="form-control" autocomplete="off" >
						</div>
						<div class="btn-group">
							<button type="button" class="btn btn-primary">Operaciones</button>
							  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							    <span class="caret"></span>
							    <span class="sr-only">Toggle Dropdown</span>
							 </button>
							<ul class="dropdown-menu">
								<li>
									<g:link action="recalcularPagoDeBajas" class="" id="${ptuInstance.id}"
										onclick="return confirm('Recalcular PTU empleados con status BAJA?');">
										 Recalcular
									</g:link>
								</li>
								<li >
									<a href="#calendarioDialog" data-toggle="modal">Asignar calendario</a>
								</li>

							</ul>
						</div>
						
					</div>
					
					<g:render template="calendarioForm" model="['calendarios':calendarios]"/>
					<table id="grid" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>Nombre</th>
								<th>Periodicida</th>
								<th>Ubicación</th>
								<th>E</th>
								<th>Asig</th>
								<th>Neto</th>
								<th>Monto PTU</th>
								<th>Calendario</th>
								<th>Asignar</th>
								<th>Nomina</th>
							</tr>
						</thead>
						<tbody>
							<g:each 
								in="${partidas.sort({ a,b -> a.empleado.perfil.ubicacion.clave <=> b.empleado.perfil.ubicacion.clave?: a.empleado.apellidoPaterno<=>b.empleado.apellidoPaterno  }) }" var="row">
								<tr >
									<td nowrap="nowrap" class="details-control">
										${fieldValue(bean:row,field:"empleado")}
									</td>
									<td>${fieldValue(bean:row,field:'empleado.salario.periodicidad')}</td>
									<td>${fieldValue(bean:row,field:'empleado.perfil.ubicacion.clave')}</td>
									<td>${fieldValue(bean:row,field:'empleado.status')}</td>
									<td>
										<g:if test="${!row.noAsignado}">
											S
										</g:if>
										<g:else>
											N
										</g:else>
									</td>
									<td>${formatNumber(number:row.porPagarNeto, type:'currency')}</td>
									<td>${formatNumber(number:row.montoPtu, type:'currency')}</td>
									<td>
										${fieldValue(bean:row,field:"calendarioDet.calendario.tipo")}
										${fieldValue(bean:row,field:"calendarioDet.calendario.comentario")}
										${fieldValue(bean:row,field:"calendarioDet.folio")}
									</td>
									<td>
										<g:if test="${!row.nominaPorEmpleado}">
											<input class="seleccionMultiple" 
												type="checkbox" 
												name="calendario" 
												value="item1"
												data-ptu="${row.id}"> 
										</g:if>
									</td>
									<td>
										${fieldValue(bean:row,field:"nominaPorEmpleado.nomina.id")}
										
									</td>
								</tr>
								
							</g:each>
						</tbody>
					</table>

				</div>
			</div>
		</div>
		
	</div><!-- .container end -->
	
	<r:script>
		$(function(){

			 var table=$("#grid").dataTable({
			         "paging":   false,
			         "ordering": false,
			         "info":     false,
			         "dom":'t',
			         "columnDefs": [
			             {
			               "defaultContent": ''
			             }
			         ]
			 	});
			
			$("#nombreField").keyup(function(){
					table.DataTable().column(0).search( $(this).val() ).draw();
			});
			
			$("#ubicacionField").keyup(function(){
					table.DataTable().column(2).search( $(this).val() ).draw();
			});
			
		});
	</r:script>
</body>
</html>