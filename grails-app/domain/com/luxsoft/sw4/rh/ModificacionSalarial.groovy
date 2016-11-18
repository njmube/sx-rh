package com.luxsoft.sw4.rh

import groovy.transform.ToString
import org.grails.databinding.BindingFormat

@ToString(includes='empleado,tipo,salarioAnterior,salarioNuevo',includeNames=true,includePackage=false)
class ModificacionSalarial {

	Empleado empleado

	@BindingFormat('dd/MM/yyyy')
	Date fecha

	String tipo 

	Integer bimestre

	BigDecimal salarioAnterior

	BigDecimal salarioNuevo

	BigDecimal sdiAnterior

	BigDecimal sdiNuevo
	
	CalculoSdi calculoSdi
	
	String comentario

	Date dateCreated
	Date lastUpdated

    static constraints = {
    	empleado unique:['fecha','tipo']
    	tipo inList:['CALCULO_SDI','AUMENTO','ALTA']
    	comentario nullable:true
    	bimestre nullable:true
		calculoSdi nullable:true
    }

    static mapping = {
    	fecha type:'date'
    }
}
