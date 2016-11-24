<g:set var="asistenciaControllers" 
    value="${['asistencia','vacaciones','vacacionesGrupo','asistenciaImss','tiempoExtra']}" />

<g:set var="vacacionesCtrl" value="${ (webRequest.controllerName == 'vacaciones') || (webRequest.controllerName == 'vacacionesGrupo') }"/>

<li class="${asistenciaControllers.contains(webRequest.controllerName)?'active':''}">
    <a href="#">
    	<i class="fa fa-check"></i> 
    	<span class="nav-label"> Control de asistencia</span>
    	<span class="fa arrow"></span>
    </a>
    <ul class="nav nav-second-level collapse">
        
        <li class="${webRequest.controllerName=='asistencia'?'active':''}">
            <g:link controller="asistencia">
                <span class="nav-label">Asistencias</span> 
                <span class="fa fa-angle-right pull-right"></span>
            </g:link>
            <span class="fa fa-angle-right pull-right"></span>
        </li>

        <li class="${vacacionesCtrl ? 'active':''}">
            <g:link controller="vacaciones">
                <span class="nav-label">Vacaciones</span> 
                <span class="fa fa-angle-right pull-right"></span>
            </g:link>
            <span class="fa fa-angle-right pull-right"></span>
        </li>
        <li class="${webRequest.controllerName=='asistenciaImss'?'active':''}">
            <g:link controller="asistenciaImss">
                <span class="nav-label">Asistenaic IMSS</span> 
                <span class="fa fa-angle-right pull-right"></span>
            </g:link>
            <span class="fa fa-angle-right pull-right"></span>
        </li>

        <li >
            <g:link controller="tiempoExtra">
                <span class="nav-label">Tiempo extra</span> 
                <span class="fa fa-angle-right pull-right"></span>
            </g:link>
            <span class="fa fa-angle-right pull-right"></span>
        </li>
        
    </ul>
</li>