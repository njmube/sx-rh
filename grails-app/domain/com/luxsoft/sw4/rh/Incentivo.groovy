package com.luxsoft.sw4.rh

import groovy.transform.EqualsAndHashCode
import org.grails.databinding.BindingFormat

@EqualsAndHashCode(includes='empleado')
class Incentivo {
	
	Empleado empleado
	
	Integer ejercicio
	
	String tipo

	BigDecimal tasaBono1=0.0
	
	BigDecimal tasaBono2=0.0
	
	Boolean otorgado=true
	
	Asistencia asistencia
	
	BigDecimal ingresoBase=0.0
	
	BigDecimal incentivo=0.0
	
	String status='PENDIENTE'
	
	String calificacion='BUENA'

	String mes

	@BindingFormat('dd/MM/yyyy')
	Date fechaInicial

	@BindingFormat('dd/MM/yyyy')
	Date fechaFinal

	NominaPorEmpleadoDet nominaPorEmpleadoDet
	
	String comentario	
	
	Integer checadasFaltantes=0
	Integer minutosNoLaborados=0
	Integer faltas=0
	
	Boolean manual
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		tipo inList:['SEMANAL','QUINCENAL','MENSUAL']
		status inList:['PENDIENTE','CERRADO']
		calificacion inList:['BUENA','REGULAR','MALA']
		comentario nullable:true
		nominaPorEmpleadoDet nullable:true
		mes nullable:true
		fechaInicial nullable:true
		asistencia nullable:true
		fechaFinal nullable:true
		tasaBono1 sacle:6
		tasaBono2 scale:6
		manual nullable:true
    }

    static mapping = {
    	fechaInicial type:'date'
    	fechaFinal type:'date'
    }
	
	String toString() {
		"${empleado} ${tipo} "
	}
}
