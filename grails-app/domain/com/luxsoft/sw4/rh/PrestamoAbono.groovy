package com.luxsoft.sw4.rh

import groovy.transform.EqualsAndHashCode


@EqualsAndHashCode(includes='nominaPorEmpleadoDet,fecha,importe')
class PrestamoAbono {

	Date fecha
	BigDecimal importe=0.0
	String comentario
	
	BigDecimal saldoAnterior=0.0
	
	NominaPorEmpleadoDet nominaPorEmpleadoDet
	
	BigDecimal saldo=0.0

	Date dateCreated
	Date lastUpdated

    static constraints = {
    	comentario nullable:true
		nominaPorEmpleadoDet nullable:true
		
    }

    static belongsTo = [prestamo: Prestamo]
}
