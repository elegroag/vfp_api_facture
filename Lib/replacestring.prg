
FUNCTION ReplaceString
    LPARAMETERS strJson
    DO wwJsonSerializer
    loSer = CREATEOBJECT("wwJsonSerializer")
    
    paramsReplace = '[' +;
	    '{"name":"documentoequivalente","value":"DocumentoEquivalente"},'+ ;
	    '{"name":"solicitud", "value":"Solicitud"},'+ ;
	    '{"name":"cabecera", "value":"Cabecera"},'+ ;
	    '{"name":"pagosfactura", "value":"PagosFactura"},'+ ;
	    '{"name":"docemanejaperiodos", "value":"DoceManejaPeriodos"},'+ ;
	    '{"name":"doceprefijo", "value":"DocePrefijo"},'+ ;
	    '{"name":"doceconsecutivo", "value":"DoceConsecutivo"},'+ ;
	    '{"name":"docefecha", "value":"DoceFecha"},'+ ;
	    '{"name":"docefecha", "value":"DoceFecha"},'+ ;
	    '{"name":"docecantidaditems", "value":"DoceCantidadItems"},'+ ;
	    '{"name":"docelineaswhatsapp", "value":"DoceLineasWhatsApp"},'+ ;
	    '{"name":"ambdcodigo", "value":"AmbdCodigo"},'+ ;
	    '{"name":"tipocodigo", "value":"TipoCodigo"},'+ ;
	    '{"name":"doetcodigo", "value":"DoetCodigo"},'+ ;
	    '{"name":"monecodigo", "value":"MoneCodigo"},'+ ;
	    '{"name":"refvnumero", "value":"RefvNumero"},'+ ;
	    '{"name":"docereferenciapago", "value":"DoceReferenciaPago"},'+ ;
	    '{"name":"enviarsetpruebas", "value":"EnviarSetPruebas"},'+ ;
	    '{"name":"forpcodigo", "value":"ForpCodigo"},'+ ;
	    '{"name":"doepfechavencimiento", "value":"DoepFechaVencimiento"},'+ ;
	    '{"name":"dempcodigo", "value":"DempCodigo"},'+ ;
	    '{"name":"dempdescripcion", "value":"DempDescripcion"},'+ ;
	  	'{"name":"medios", "value":"Medios"},'+ ;
        '{"name":"adquirientefactura", "value":"AdquirienteFactura"},'+ ;
        '{"name":"calculardv", "value":"CalcularDv"},'+ ;
        '{"name":"doeaesresponsable", "value":"DoeaEsResponsable"},'+ ;
        '{"name":"doeaesnacional", "value":"DoeaEsnacional"},'+ ;
        '{"name":"doeadocumento", "value":"DoeaDocumento"},'+ ;
        '{"name":"doearazonsocial", "value":"DoeaRazonSocial"},'+ ;
        '{"name":"doeanombreciudad", "value":"DoeaNombreCiudad"},'+ ;
        '{"name":"doeanombredepartamento", "value":"DoeaNombreDepartamento"},'+ ;
        '{"name":"doeapais", "value":"DoeaPais"},'+ ;
        '{"name":"doeadireccion", "value":"DoeaDireccion"},'+ ;
        '{"name":"doeaobligaciones", "value":"DoeaObligaciones"},'+ ;
        '{"name":"doeanombres", "value":"DoeaNombres"},'+ ;
        '{"name":"doeaapellidos", "value":"DoeaApellidos"},'+ ;
        '{"name":"doeaotrosnombres", "value":"DoeaOtrosNombres"},'+ ;
        '{"name":"doeacorreo", "value":"DoeaCorreo"},'+ ;
        '{"name":"doeatelefono", "value":"DoeaTelefono"},'+ ;
        '{"name":"tiotcodigo", "value":"TiotCodigo"},'+ ;
        '{"name":"copccodigo", "value":"CopcCodigo"},'+ ;
        '{"name":"regcodigo", "value":"RegCodigo"},'+ ;
        '{"name":"tidtcodigo", "value":"TidtCodigo"},'+ ;
        '{"name":"doeamanejoadjuntos", "value":"DoeaManejoAdjuntos"},'+ ;
        '{"name":"doeaprocedencia", "value":"DoeaProcedencia"},'+ ;
        '{"name":"periodofactura", "value":"PeriodoFactura"},'+ ;
	    ']'

    objJson = loSer.Deserialize(paramsReplace)

    FOR i = 1 TO objJson.Count
    	oItem = objJson.Item(i)
        strJson = STRTRAN(strJson, oItem.name, oItem.value)
    ENDFOR
    
    RETURN strJson
ENDFUNC
