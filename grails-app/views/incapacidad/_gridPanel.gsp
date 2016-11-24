

<table id="grid" class=" grid table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<g:sortableColumn property="id" title="Folio"/>
			<g:sortableColumn property="empleado.apellidoPaterno" title="Empleado"/>
			<th>Ubicacion</th>
			<th>Periodicidad</th>
			<th>Tipo</th>
			<th>Inicio</th>
			<th>Fin</th>
			<th>Días</th>
			<th>Referencia (IMMSS)</th>
			
			%{-- <th>Comentario</th> --}%
		</tr>
	</thead>
	<tbody>
		<g:each in="${incapacidadesList}" var="row">
			<tr>
				<td>
					<g:link action="edit" id="${row.id}">
						<g:formatNumber number="${row.id}" format="####"/>
					</g:link>
				</td>
				<td>
					<g:link action="edit" id="${row.id}">
						<g:fieldValue bean="${row}" field="empleado"/>
					</g:link>
				</td>
				<td>${fieldValue(bean:row,field:"empleado.perfil.ubicacion.clave")}</td>
				<td><g:fieldValue bean="${row}" field="empleado.salario.periodicidad"/> </td>
				
				<td><g:fieldValue bean="${row}" field="tipo"/> </td>
				<td><g:formatDate date="${row.fechaInicial}" format="dd/MM/yyyy"/></td>
				<td><g:formatDate date="${row.fechaFinal}" format="dd/MM/yyyy"/></td>
				<td><g:formatNumber number="${row.dias}" format="###"/> </td>
				<td><g:fieldValue bean="${row}" field="referenciaImms"/> </td>
				
			</tr>
		</g:each>
	</tbody>
</table>
	
