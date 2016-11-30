<table id="" class="grid table table-striped table-bordered table-condensed asistenciaTable">
	<thead>
		<tr>
			<th>Orden</th>
			<th>Clave</th>
			<g:sortableColumn property="empleado" title="Empleado"/>
			<g:sortableColumn property="empleado.perfil.ubicacion.clave" title="Sucursal"/>
			
			<g:sortableColumn property="empleado.perfil.numeroDeTrabajador" title="No"/>
			<g:sortableColumn property="periodo.fechaInicial" title="Fecha Ini"/>
			<g:sortableColumn property="periodo.fechaFinal" title="Fecha Fin"/>
			<g:sortableColumn property="faltas" title="Faltas"/>
			<g:sortableColumn property="incapacidades" title="Incapacidades"/>
			<th></th>
			
		</tr>
	</thead>
	<tbody>
		<g:each in="${partidasList}" var="row">
			<tr>
				<td>
					<g:link action="show" id="${row.id}" >
						${fieldValue(bean:row,field:"orden")}
					</g:link>
				</td>
				<td>
					<g:link action="show" id="${row.id}" >
						${fieldValue(bean:row,field:"empleado.clave")}
					</g:link>
				</td>
				<td>
					<g:link action="show" id="${row.id}" >
						${fieldValue(bean:row,field:"empleado.nombre")}
					</g:link>
				</td>
				<td>${fieldValue(bean:row,field:"empleado.perfil.ubicacion.clave")}</td>
				<td>${fieldValue(bean:row,field:"empleado.perfil.numeroDeTrabajador")}</td>
				<td><g:formatDate date="${row.periodo.fechaInicial}" format="dd/MMM/yyyy"/></td>
				<td><g:formatDate date="${row.periodo.fechaFinal}" format="dd/MMM/yyyy"/></td>
				<td><g:formatNumber number="${row.faltas }" format="###"/></td>
				<td><g:formatNumber number="${row.incapacidades }" format="###"/></td>
				
				<td>
					<g:link action="delete" id="${row.id}"
						onclick="return confirm('Eliminar asistencia para ${row.empleado.getNombre()} ?');">
						<span class="glyphicon glyphicon-trash"></span>
					</g:link>
				</td>
				
			</tr>
		</g:each>
	</tbody>
</table>
<g:jasperReport jasper="AsistenciaRH" format="PDF" name="Asistencia RH">
	<g:hiddenField name="CALENDARIO_ID" 
			value="${calendarioDet.id}" />
	<g:if test="${partidasList!=null}">
		<g:hiddenField name="UBICACION_ID" 
			value="${partidasList[0].empleado?.perfil?.ubicacion?.id}" />
	</g:if>
								
</g:jasperReport>
