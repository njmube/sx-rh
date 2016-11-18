package com.luxsoft.sw4.cfdi

import java.security.PrivateKey;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.xmlbeans.XmlCursor;
import org.apache.xmlbeans.XmlDateTime;






import com.luxsoft.sw4.Direccion;
import com.luxsoft.sw4.Empresa;
import com.luxsoft.sw4.rh.Empleado;

import mx.gob.sat.cfd.x3.ComprobanteDocument;
import mx.gob.sat.cfd.x3.ComprobanteDocument.Comprobante.Emisor.RegimenFiscal;
import mx.gob.sat.cfd.x3.TUbicacion;
import mx.gob.sat.cfd.x3.TUbicacionFiscal;
import mx.gob.sat.cfd.x3.ComprobanteDocument.Comprobante;
import mx.gob.sat.cfd.x3.ComprobanteDocument.Comprobante.Emisor;
import mx.gob.sat.cfd.x3.ComprobanteDocument.Comprobante.Receptor;

import javax.xml.namespace.QName;


class CFDIUtils {
	
	static Calendar toISO8601(Date fecha) {
		Calendar c=Calendar.getInstance();
		c.setTime(fecha)
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss")
		XmlDateTime xmlDateTime = XmlDateTime.Factory.newInstance()
		xmlDateTime.setStringValue(df.format(c.getTime()))
		return xmlDateTime
	}

	static XmlDateTime toXmlDate(Date fecha){
		Calendar c=Calendar.getInstance();
		c.setTime(fecha)
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss")
		XmlDateTime xmlDateTime = XmlDateTime.Factory.newInstance()
		xmlDateTime.setStringValue(df.format(c.getTime()))
		return xmlDateTime
	}
	
	static TUbicacionFiscal generarUbicacionFiscal(final Direccion direccion,final TUbicacionFiscal domicilio){
		assert direccion.validate()," La direccion es incorrecta"
		domicilio.setCalle(direccion.calle)
		domicilio.setCodigoPostal(direccion.codigoPostal)
		domicilio.setColonia(direccion.colonia)
		domicilio.setEstado(direccion.estado)
		domicilio.setMunicipio(direccion.municipio)
		domicilio.setNoExterior(direccion.numeroExterior)
		domicilio.setNoInterior(direccion.numeroInterior?:'_')
		domicilio.setPais(direccion.pais)
		return domicilio
	}
	
	static TUbicacion generarUbicacion(Direccion direccion,TUbicacion ubicacion){
		ubicacion.setCalle(direccion.calle)
		ubicacion.setCodigoPostal(direccion.codigoPostal)
		ubicacion.setColonia(direccion.colonia)
		ubicacion.setEstado(direccion.estado)
		ubicacion.setMunicipio(direccion.municipio)
		ubicacion.setNoExterior(direccion.numeroExterior)
		ubicacion.setNoInterior(direccion.numeroInterior?:'_')
		ubicacion.setPais(direccion.pais)
		return ubicacion
	}
	
	/*
	static  depurar(ComprobanteDocument document){
		XmlCursor cursor=document.newCursor()
		if(cursor.toFirstChild()){
			QName qname=new QName("http://www.w3.org/2001/XMLSchema-instance","schemaLocation","xsi")
			cursor.setAttributeText(qname,"http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd" )
			cursor.toNextToken()
			cursor.insertNamespace("cfdi", "http://www.sat.gob.mx/cfd/3")
		}
	}
	*/
	
	static  depurar(ComprobanteDocument document){
		XmlCursor cursor=document.newCursor()
		if(cursor.toFirstChild()){
			QName qname=new QName("http://www.w3.org/2001/XMLSchema-instance","schemaLocation","xsi")
			cursor.setAttributeText(new QName("http://www.w3.org/2001/XMLSchema-instance","schemaLocation","xsi")
				,"http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd http://www.sat.gob.mx/nomina  http://www.sat.gob.mx/sitio_internet/cfd/nomina/nomina11.xsd" )
			cursor.toNextToken()
			cursor.insertNamespace("cfdi", "http://www.sat.gob.mx/cfd/3")
			cursor.toNextToken()
			cursor.insertNamespace("nomina", "http://www.sat.gob.mx/nomina")
		}
	}
	
	static Emisor registrarEmisor(Comprobante comprobante,Empresa empresa){
		Emisor emisor=comprobante.addNewEmisor()
		emisor.setNombre(empresa.nombre)
		emisor.setRfc(empresa.rfc)
		String regimen=empresa.regimen
		String[] regs=StringUtils.split(regimen, ';')
		for(String r:regs){
			RegimenFiscal rf=emisor.addNewRegimenFiscal()
			rf.setRegimen(r)
		}
		TUbicacionFiscal domicilioFiscal=emisor.addNewDomicilioFiscal()
		CFDIUtils.generarUbicacionFiscal(empresa.direccion, domicilioFiscal)
		comprobante.setLugarExpedicion(empresa.direccion.pais)
		return emisor
	}
	
	static Receptor registrarReceptor(Comprobante cfd,Empleado empleado){
		Receptor receptor=cfd.addNewReceptor()
		receptor.setNombre(empleado.toString())
		receptor.setRfc(empleado.rfc)
		/*
		if(empleado?.datosPersonales?.direccion) {
			Direccion direccion=empleado.datosPersonales.direccion
			TUbicacion ubicacion=receptor.addNewDomicilio()
			if(empleado.rfc!='')
				CFDIUtils.generarUbicacion(direccion,ubicacion)
		}*/
		
		return receptor
	}
	
	/*
	static leerCertificado(Empresa empresa){
		File certificado=new File("web-app/cfd/00001000000202323568.cer")
		assert certificado.exists(),"No existe el ceertificado de prueba: "+certificado.path
		byte[] data=certificado.getBytes()
		assert data
		empresa.certificadoDigital=data
		return empresa.certificado
	}
	static leerLlavePrivada(Empresa empresa){
		File pk=new File("web-app/cfd/impap2012.key")
		assert pk.exists()
		assert pk.getBytes()
		empresa.llavePrivada=pk.readBytes()
		return empresa.privateKey
	}
	*/
	
}
