<%@page expressionCodec="none" %>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Solicitud de incidencia</h3>
	</div>
	<div class="panel-body">	
	
		<g:form action="save" role="form" class="form-horizontal" >
			<div class="row">
				
				<div class="col-md-8">
					<fieldset>
						<f:with bean="incidenciaInstance">
							<f:field property="empleado" input-class="form-control" />
							<f:field property="fechaInicial" input-class="form-control" />
							<f:field property="fechaFinal" input-class="form-control" />
							<f:field property="tipo" input-class="form-control" />
							<f:field property="pagado" input-class="form-control" label="Con goce"/>
							<f:field property="comentario" input-class="form-control" />
						</f:with>
					</fieldset>
					<div class="form-group">
		    			<div class="col-sm-offset-9 col-sm-2">
		      				<button type="submit" class="btn btn-default">
		      					<span class="glyphicon glyphicon-floppy-save"></span> Salvar
		      				</button>
		    			</div>
		  			</div>
		  		</div><!-- End .col-md-8 -->
		  		
		  		
		  	</div><!-- End .row -->
		</g:form>
	</div>
	<div class="panel-footer"></div>
</div>