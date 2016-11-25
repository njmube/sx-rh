<%@page expressionCodec="none" %>
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Clave</th>
			<th>Concepto</th>
			<th>Gravado</th>
			<th>Excento</th>
			<g:if test="${!nominaPorEmpleadoInstance.cfdi}">
			<th></th>
			<th></th>
			<th></th>
			</g:if>
		</tr>
	</thead>
	<tbody>
		
		<g:findAll in="${nominaPorEmpleadoInstance?.conceptos}" expr="it.concepto.tipo==param" >
			
			<tr>
				<td>
					${fieldValue(bean:it,field:"concepto.clave")}
				</td>
				<td>
					${fieldValue(bean:it,field:"concepto.descripcion")}
				</td>
				<td class="text-right"><g:formatNumber number="${it.importeGravado}" format="#,###,###.##" minFractionDigits="2"/></td>
				<td class="text-right"><g:formatNumber number="${it.importeExcento}" format="#,###,###.##" minFractionDigits="2"/></td>
				<g:if test="${!nominaPorEmpleadoInstance.cfdi}">
				<td>
					<a  
						data-container="body"
						data-toggle="popover"
						data-placement="right" 
						data-title="Resumen"
						data-url="${g.createLink(action:'informacionDeConcepto',id:it.id)}"
						>
  						 <span class="glyphicon glyphicon-info-sign"></span>
					</a>
				</td>
				<td class="text-center">
					<g:link class="disabled" action="modificarConcepto" id="${it.id}" data-toggle="tooltip"  title="Modificar concepto">
						<span class="glyphicon glyphicon-pencil"></span>
					</g:link>
					
				</td>
				<td class="text-center">
					<g:link action="eliminarConcepto" id="${it.id}" data-toggle="tooltip"  title="Eliminar concepto"
						onclick="return confirm('Eliminar concepto?')">
						<span class="glyphicon glyphicon-trash"></span>
					</g:link>
				</td>
				</g:if>
			</tr>
		</g:findAll>
	</tbody>
	<tfoot>
		<tr>
			<th></th>
			<th>Total</th>
			<th class="text-right"><g:formatNumber 
				number="${param=='PERCEPCION'?nominaPorEmpleadoInstance?.percepcionesGravadas:nominaPorEmpleadoInstance?.deduccionesGravadas}" format="#,###.##"/></th>
			<th class="text-right"><g:formatNumber 
				number="${param=='PERCEPCION'?nominaPorEmpleadoInstance?.percepcionesExcentas:nominaPorEmpleadoInstance?.deduccionesExcentas}" format="#,###.##"/></th>
			<g:if test="${!nominaPorEmpleadoInstance.cfdi}">
			<th></th>
			<th></th>
			<th></th>
			</g:if>
		</tr>
	</tfoot>
</table>

<script type="text/javascript">
	$(function(){
		var get_data_for_popover=function(){
			var element=$(this);
			var url=$(this).attr('data-url');
			console.log('URL: ' + url);
			return "DEMO DATA"
			/*
			if($(this).attr('data-popover-visible')==="true"){
				
				element.popover('hide');
				element.attr('data-popover-visible',"false");
				return;
			}
			$.ajax({
				type:'GET',
				url:url,
				dataType:'html',
				success:function(data){
					element.attr('data-content',data);
					element.attr('data-popover-visible',"true");
					element.popover('show');
				}
			});
			*/
		}
		
		$('[data-toggle="popover"]').popover({content:get_data_for_popover});
		$('[data-toggle="popover"]').click(get_data_for_popover);
		
		//$('[data-popover=true]').popover({"trigger":"manual","html":"true"});
		
	});
	
</script>


