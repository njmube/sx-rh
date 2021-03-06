<div class="modal fade" id="cambiarEmpleadoDialog" tabindex="-1" >
	<div class="modal-dialog">
		<div class="modal-content">
		<g:form action="show" class="form-horizontal numeric-form" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Seleccion de empleado</h4>
			</div>
	
			<div class="modal-body">
				<g:hiddenField id="target" name="id"/>
				<div class="form-group ui-front">
					<label class="col-sm-2 control-label"> Empleado</label>
					<div class="col-sm-10">
						
						<input id="empleadoField" type="text" name="empleado" class="form-control" 
							autocomplete="off" autofocus/>
					</div>
					
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				<g:submitButton class="btn btn-primary" name="Buscar"
							value="aceptar" />
			</div>
	
		</g:form>	
		</div> <!-- moda-content -->
	</div> <!-- modal-dialog -->
</div> <!-- .modal  -->



<script type="text/javascript">
	$(function(){
		$("#empleadoField").autocomplete({
			source:'<g:createLink action="getEmpleadosDeAsistencia" id="${asistenciaInstance.calendarioDet.id }"/>',
			minLength:3,
			select:function(e,ui){
				console.log('Valor seleccionado: '+ui.item.id);
				$("#target").val(ui.item.id);
			}
		});
	});
</script>
