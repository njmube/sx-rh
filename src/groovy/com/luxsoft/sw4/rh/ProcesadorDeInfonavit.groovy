package com.luxsoft.sw4.rh

import java.math.RoundingMode;

import org.apache.commons.logging.LogFactory

import com.luxsoft.sw4.rh.imss.*

class ProcesadorDeInfonavit {
	
	def conceptoClave='D006'
	
	def concepto
	
	private static final log=LogFactory.getLog(this)
	
	def procesar(NominaPorEmpleado ne) {
		
		if(!concepto) {
			concepto=ConceptoDeNomina.findByClave(conceptoClave)
			assert concepto,"Se debe de dar de alta el concepto de nomina: $conceptoClave"
		}
		
		//Buscando un prestamo vigente
		def infonavit=buscarPrestamo(ne)
		if(infonavit) {
			log.info "Aplicando decucccon para INFONAVIT: ${infonavit.empleado} ${infonavit.tipo} ${infonavit.cuotaFija}"			
			
			def neDet=new NominaPorEmpleadoDet(concepto:concepto,importeGravado:0.0,importeExcento:0.0,comentario:'PENDIENTE')
			
			
			def importeExcento=0.0
			
			switch (infonavit.tipo){
				case 'CUOTA_FIJA':
				case 'VSM':
				case'PORCENTAJE':
				default:
					importeExcento=infonavit.cuotaDiaria*(ne.diasDelPeriodo-ne.faltas-ne.incapacidades)
					if(ne.asistencia.diasTrabajados>0){
						importeExcento=infonavit.cuotaDiaria*(ne.asistencia.diasTrabajados+ne.asistencia.vacaciones-ne.asistencia.faltasManuales)
					}
			}
			
			if(importeExcento>0){
				log.info "Deduccion calculada de: ${importeExcento}"
				neDet.importeGravado=0
				neDet.importeExcento=importeExcento
				ne.addToConceptos(neDet)
				ne.actualizar()
			}
		}
		
		
	}
	
	private Infonavit buscarPrestamo(NominaPorEmpleado ne) {
		def prestamos=Infonavit.findAll("from Infonavit i where i.empleado=? and i.activo=true order by i.id desc"
			,[ne.empleado],[max:1])
		return prestamos?prestamos[0]:null
	}
	
	
	
	def getModel(NominaPorEmpleadoDet det) {
		def ne=det.parent
		def model=[:]
		def infonavit=buscarPrestamo(ne)
		model.infonavit=infonavit
		model.importeExcento=det.importeExcento
		model.importeGravado=det.importeGravado
		return model
	}
	
	def getTemplate() {
		return "/nominaPorEmpleado/conceptoInfo/deduccionInfonavitPersonal"
	}
	
	String toString() {
		"Procesador de Prestamo INFONAVIT "
	}

}
