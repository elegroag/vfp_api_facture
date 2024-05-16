#INCLUDE foxpro.h

SET PROCEDURE TO ReplaceString ADDITIVE

DEFINE CLASS ReplaceString AS Custom
    loSer = .NULL.

    FUNCTION Init
        DO wwJsonSerializer
        THIS.loSer = CREATEOBJECT("wwJsonSerializer")
	ENDFUNC

    FUNCTION Remplazar(strJson)
        LOCAL paramsReplace

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
            '{"name":"doepfechainicial", "value":"DoepFechaInicial"},'+ ;
            '{"name":"doepfechafinal", "value":"DoepFechaFinal"},'+ ;
            '{"name":"deacnombre", "value":"DeacNombre"},'+ ;
            '{"name":"deactelefono", "value":"DeacTelefono"},'+ ;
            '{"name":"deaccorreo", "value":"DeacCorreo"},'+ ;
            '{"name":"deaccodigo", "value":"DeacCodigo"},'+ ;
            '{"name":"doeitotal", "value":"DoeiTotal"},'+ ;
            '{"name":"doeiesporcentual", "value":"DoeiEsPorcentual"},'+ ;
            '{"name":"impucodigo", "value":"ImpuCodigo"},'+ ;
            '{"name":"detalle", "value":"Detalle"},'+ ;
            '{"name":"dedibase", "value":"DediBase"},'+ ;
            '{"name":"dedivalor", "value":"DediValor"},'+ ;
            '{"name":"dedifactor", "value":"DediFactor"},'+ ;
            '{"name":"unimcodigo", "value":"UnimCodigo"},'+ ;
            '{"name":"doeiitem", "value": "DoeiItem"},'+;
            '{"name":"doeicodigo", "value": "DoeiCodigo"},'+;
            '{"name":"doeidescripcion", "value": "DoeiDescripcion"},'+;
            '{"name":"doeimarca", "value": "DoeiMarca"},'+;
            '{"name":"doeimodelo", "value": "DoeiModelo"},'+;
            '{"name":"doeiobservacion", "value": "DoeiObservacion"},'+;
            '{"name":"doeidatosvendedor", "value": "DoeiDatosVendedor"},'+;
            '{"name":"doeicantidad", "value": "DoeiCantidad"},'+;
            '{"name":"doeicantidadempaque", "value": "DoeiCantidadEmpaque"},'+;
            '{"name":"doeiesobsequio", "value": "DoeiEsObsequio"},'+;
            '{"name":"doeipreciounitario", "value": "DoeiPrecioUnitario"},'+;
            '{"name":"doeiprecioreferencia", "value": "DoeiPrecioReferencia"},'+;
            '{"name":"doeivalor", "value": "DoeiValor"},'+;
            '{"name":"doeitotaldescuentos", "value": "DoeiTotalDescuentos"},'+;
            '{"name":"doeitotalcargos", "value": "DoeiTotalCargos"},'+;
            '{"name":"doeitotalimpuestos", "value": "DoeiTotalImpuestos"},'+;
            '{"name":"doeibase", "value": "DoeiBase"},'+;
            '{"name":"doeisubtotal", "value": "DoeiSubtotal"},'+;
            '{"name":"ticpcodigo", "value": "TicpCodigo"},'+;
            '{"name":"unimcodigo", "value": "UnimCodigo"},'+;
            '{"name":"ctprcodigo", "value": "CtprCodigo"},'+;
            '{"name":"doeinumeroradicadoremesa", "value": "DoeiNumeroRadicadoRemesa"},'+;
            '{"name":"doeinumeroconsecutivoremesa", "value": "DoeiNumeroConsecutivoRemesa"},'+;
            '{"name":"doeivalorfleteremesa", "value": "DoeiValorFleteRemesa"},'+;
            '{"name":"doeicantidadfleteremesa", "value": "DoeiCantidadFleteRemesa"},'+;
            '{"name":"doeiunimcodigoremesa", "value": "DoeiUnimCodigoRemesa"},'+;
            '{"name":"deritotaliva", "value": "DeriTotalIva"},'+;
            '{"name":"deritotalconsumo", "value": "DeriTotalConsumo"},'+;
            '{"name":"deritotalica", "value": "DeriTotalIca"},'+;
            '{"name":"doetsubtotal", "value": "DoetSubtotal"},'+;
            '{"name":"doetbase", "value": "DoetBase"},'+;
            '{"name":"doettotalimpuestos", "value": "DoetTotalImpuestos"},'+;
            '{"name":"doetsubtotalmasimpuestos", "value": "DoetSubtotalMasImpuestos"},'+;
            '{"name":"doettotaldescuentos", "value": "DoetTotalDescuentos"},'+;
            '{"name":"doettotalcargos", "value": "DoetTotalcargos"},'+;
            '{"name":"doettotalanticipos", "value": "DoetTotalAnticipos"},'+;
            '{"name":"doetajustealpeso", "value": "DoetAjusteAlPeso"},'+;
            '{"name":"doettotaldocumento", "value": "DoetTotalDocumento"},'+;
            '{"name":"nombreapellido", "value": "NombreApellido"},'+;
            '{"name":"razonsocial", "value": "RazonSocial"},'+;
            '{"name":"nombresoftware", "value": "NombreSoftware"},'+;
            '{"name":"nit", "value": "NIT"},'+;
            '{"name":"codigo", "value": "Codigo"},'+;
            '{"name":"nombresapellidos", "value": "NombresApellidos"},'+;
            '{"name":"puntos", "value": "Puntos"},'+;
            '{"name":"placacaja", "value": "PlacaCaja"},'+;
            '{"name":"ubicacioncaja", "value": "UbicacionCaja"},'+;
            '{"name":"cajero", "value": "Cajero"},'+;
            '{"name":"tipocaja", "value": "TipoCaja"},'+;
            '{"name":"codigoventa", "value": "CodigoVenta"},'+;
            '{"name":"subtotal", "value": "Subtotal"},'+;
            '{"name":"fabricantesoftware", "value": "FabricanteSoftware"},'+;
            '{"name":"beneficioscomprador", "value": "BeneficiosComprador"},'+;
            '{"name":"informacioncajaventa", "value": "InformacionCajaVenta"},'+;
            '{"name":"extensiones", "value": "Extensiones"},'+;
            '{"name":"extensionespos", "value": "ExtensionesPOS"},'+;
            '{"name":"estensionesdocumentoextracto", "value": "EstensionesDocumentoExtracto"},'+;
            '{"name":"estensionesbolsavalores", "value": "EstensionesBolsaValores"},'+;
            '{"name":"extensionesboletacine", "value": "ExtensionesBoletaCine"},'+;
            '{"name":"resumenimpuestosfactura", "value": "ResumenImpuestosFactura"},'+;
            '{"name":"detallefactura", "value": "DetalleFactura"},'+;
            '{"name":"adquirientefactura", "value": "AdquirienteFactura"},'+;
            '{"name":"totalesfactura", "value": "TotalesFactura"},'+;
            '{"name":"adquirientecontacto", "value": "adquirienteContacto"},'+;
            '{"name":"nonce","value": "Nonce"},'+;
            '{"name":"suscriptor","value": "Suscriptor"},'+;
            '{"name":"doeadiv","value": "DoeaDiv"},'+;
            '{"name":"impuestoslinea","value": "ImpuestosLinea"}'+;            
            ']'

        objJson = THIS.loSer.Deserialize(paramsReplace)
        FOR i = 1 TO objJson.Count
            oItem = objJson.Item(i)
            strJson = STRTRAN(strJson, oItem.name, oItem.value)
        ENDFOR
        paramsReplace = .NULL.
        RETURN strJson
    ENDFUNC

ENDDEFINE