package com.luxsoft.sw4.cfdi

class CfdiException extends RuntimeException{
	
	String message
	Cfdi cfdi
	
	
	
	String toString(){
		return message
	}

}
