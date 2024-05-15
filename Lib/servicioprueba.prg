#INCLUDE foxpro.h

DEFINE CLASS Documento AS Custom
    Solicitud = .NULL.
    DocumentoEquivalente = .NULL.

    PROCEDURE Init
        THIS.Solicitud = CREATEOBJECT("EMPTY")
        THIS.DocumentoEquivalente = CREATEOBJECT("EMPTY")
    ENDPROC

    PROCEDURE setNonceSolicitud
        LPARAMETERS valor
        ADDPROPERTY(THIS.Solicitud, "Nonce", valor)
    ENDPROC
    
    PROCEDURE setSuscriptorSolicitud
        LPARAMETERS suscriptor
        ADDPROPERTY(THIS.Solicitud, "Suscriptor", suscriptor)
    ENDPROC

    PROCEDURE addDocumentoEquivalente
        LPARAMETERS oClave, objeto
        ADDPROPERTY(THIS.DocumentoEquivalente, oClave, objeto)
    ENDPROC
ENDDEFINE

FUNCTION PeriodoFactura
    LPARAMETERS _cursor
    oPeriodoFactura = CREATEOBJECT("EMPTY")
    ADDPROPERTY(oPeriodoFactura, "DoepFechaInicial", _cursor.doepfechainicial)
    ADDPROPERTY(oPeriodoFactura, "DoepFechaFinal", _cursor.doepfechafinal)
    RETURN oPeriodoFactura
ENDFUNC

FUNCTION PagosFactura
    LPARAMETERS _cursor    
    PagosFactura = CREATEOBJECT("EMPTY")
    ADDPROPERTY(PagosFactura, "ForpCodigo", _cursor.forpcodigo)
    ADDPROPERTY(PagosFactura, "DoepFechaVencimiento", _cursor.doepfechavencimiento)
    
    aMedios = CREATEOBJECT("Collection")
    cMedio = CREATEOBJECT("EMPTY")
    ADDPROPERTY(cMedio, "DempCodigo", _cursor.dempcodigo)
    ADDPROPERTY(cMedio, "DempDescripcion", _cursor.dempdescripcion)
    aMedios.Add(cMedio)
    
    ADDPROPERTY(PagosFactura, "Medios", aMedios)
    RETURN PagosFactura
ENDFUNC	

FUNCTION Cabecera
    LPARAMETERS _cursor
    Cabecera = CREATEOBJECT("EMPTY")
    ADDPROPERTY(Cabecera, "DoceManejaPeriodos", _cursor.docemanejaperiodos)
    ADDPROPERTY(Cabecera, "DoceConsecutivo", _cursor.doceconsecutivo)
    ADDPROPERTY(Cabecera, "DocePrefijo", _cursor.doceprefijo)
    ADDPROPERTY(Cabecera, "DoceFecha", _cursor.docefecha)
    ADDPROPERTY(Cabecera, "DoceCantidadItems", _cursor.docecantidaditems)
    ADDPROPERTY(Cabecera, "DoceLineasWhatsApp", _cursor.docelineaswhatsapp)
    ADDPROPERTY(Cabecera, "AmbdCodigo", _cursor.ambdcodigo)
    ADDPROPERTY(Cabecera, "TipoCodigo", _cursor.tipocodigo)
    ADDPROPERTY(Cabecera, "DoetCodigo", _cursor.doetcodigo)
    ADDPROPERTY(Cabecera, "MoneCodigo", _cursor.monecodigo)
    ADDPROPERTY(Cabecera, "RefvNumero", _cursor.refvnumero)
    ADDPROPERTY(Cabecera, "DoceReferenciaPago", _cursor.docereferenciapago)
    ADDPROPERTY(Cabecera, "EnviarSetPruebas", _cursor.enviarsetpruebas)
    RETURN Cabecera
ENDFUNC	

FUNCTION Adquiriente 
    LPARAMETERS _cursor 
    Adquiriente = CREATEOBJECT("EMPTY") 
    ADDPROPERTY(Adquiriente,"CalcularDv", _cursor.calculardv)
    ADDPROPERTY(Adquiriente,"DoeaEsResponsable", _cursor.doeaesresponsable)
    ADDPROPERTY(Adquiriente,"DoeaEsnacional", _cursor.doeaesnacional)
    ADDPROPERTY(Adquiriente,"DoeaDocumento", _cursor.doeadocumento)
    ADDPROPERTY(Adquiriente,"DoeaDiv", _cursor.doeadiv)
    ADDPROPERTY(Adquiriente,"DoeaRazonSocial", _cursor.doearazonsocial)
    ADDPROPERTY(Adquiriente,"DoeaNombreCiudad", _cursor.doeanombreciudad)
    ADDPROPERTY(Adquiriente,"DoeaNombreDepartamento", _cursor.doeanombredepartamento)
    ADDPROPERTY(Adquiriente,"DoeaPais", _cursor.doeapais)
    ADDPROPERTY(Adquiriente,"DoeaDireccion", _cursor.doeadireccion)
    ADDPROPERTY(Adquiriente,"DoeaObligaciones", _cursor.doeaobligaciones)
    ADDPROPERTY(Adquiriente,"DoeaNombres", _cursor.doeanombres)
    ADDPROPERTY(Adquiriente,"DoeaApellidos", _cursor.doeaapellidos)
    ADDPROPERTY(Adquiriente,"DoeaOtrosNombres", _cursor.doeaotrosnombres)
    ADDPROPERTY(Adquiriente,"DoeaCorreo", _cursor.doeacorreo)
    ADDPROPERTY(Adquiriente,"DoeaTelefono", _cursor.doeatelefono)
    ADDPROPERTY(Adquiriente,"TiotCodigo", _cursor.tiotcodigo)
    ADDPROPERTY(Adquiriente,"CopcCodigo", _cursor.copccodigo)
    ADDPROPERTY(Adquiriente,"RegCodigo", _cursor.regcodigo)
    ADDPROPERTY(Adquiriente,"TidtCodigo", _cursor.tidtcodigo)
    ADDPROPERTY(Adquiriente,"DoeaManejoAdjuntos", _cursor.doeamanejoadjuntos)
    ADDPROPERTY(Adquiriente,"DoeaProcedencia", _cursor.doeaprocedencia)
    RETURN Adquiriente
ENDFUNC

FUNCTION AdquirienteContacto
    LPARAMETERS _cursor 
    AdquirienteContacto = CREATEOBJECT("EMPTY") 
    ADDPROPERTY(AdquirienteContacto,"DeacNombre", _cursor.deacnombre)
    ADDPROPERTY(AdquirienteContacto,"DeacTelefono", _cursor.deactelefono)
    ADDPROPERTY(AdquirienteContacto,"DeacCorreo", _cursor.deaccorreo)
    ADDPROPERTY(AdquirienteContacto,"DeacCodigo", _cursor.deaccodigo)
    RETURN AdquirienteContacto
ENDFUNC

FUNCTION ItemImpuesto
    LPARAMETERS oItem
    cImpuesto = CREATEOBJECT("EMPTY")
    ADDPROPERTY(cImpuesto, "DoeiTotal", oItem.doeitotal)
    ADDPROPERTY(cImpuesto, "DoeiEsPorcentual", oItem.doeiesporcentual)
    ADDPROPERTY(cImpuesto, "ImpuCodigo", oItem.impucodigo)
    ADDPROPERTY(cImpuesto, "Detalle", '{"DediBase":'+oItem.dedibase+',"DediValor":'+oItem.dedivalor+',"DediFactor":'+ oItem.dedifactor+',"UnimCodigo":'+oItem.unimcodigo+'}')
    RETURN cImpuesto
ENDFUNC

FUNCTION CreateImpuestosFactura
    LPARAMETERS oImpuestos
    ImpuestosFactura = CREATEOBJECT("Collection")
    FOR i = 1 TO oImpuestos.Count
        ImpuestosFactura.Add(ItemImpuesto(oImpuestos.Item(i)))
    ENDFOR
    RETURN ImpuestosFactura
ENDFUNC

FUNCTION DetallesFactura
    LPARAMETERS oDetalles, oImpuestos
    DetalleFactura = CREATEOBJECT("Collection")

    FOR i = 1 TO oDetalles.Count
    	oItem = oDetalles.Item(i)
        cDetalle = CREATEOBJECT("EMPTY")
        ADDPROPERTY(cDetalle, "DoeiItem",oItem.doeiitem) 
        ADDPROPERTY(cDetalle, "DoeiCodigo",oItem.doeicodigo) 
        ADDPROPERTY(cDetalle, "DoeiDescripcion",oItem.doeidescripcion) 
        ADDPROPERTY(cDetalle, "DoeiMarca",oItem.doeimarca) 
        ADDPROPERTY(cDetalle, "DoeiModelo",oItem.doeimodelo) 
        ADDPROPERTY(cDetalle, "DoeiObservacion",oItem.doeiobservacion) 
        ADDPROPERTY(cDetalle, "DoeiDatosVendedor",oItem.doeidatosvendedor) 
        ADDPROPERTY(cDetalle, "DoeiCantidad",oItem.doeicantidad) 
        ADDPROPERTY(cDetalle, "DoeiCantidadEmpaque",oItem.doeicantidadempaque) 
        ADDPROPERTY(cDetalle, "DoeiEsObsequio",oItem.doeiesobsequio) 
        ADDPROPERTY(cDetalle, "DoeiPrecioUnitario",oItem.doeipreciounitario) 
        ADDPROPERTY(cDetalle, "DoeiPrecioReferencia",oItem.doeiprecioreferencia) 
        ADDPROPERTY(cDetalle, "DoeiValor",oItem.doeivalor) 
        ADDPROPERTY(cDetalle, "DoeiTotalDescuentos",oItem.doeitotaldescuentos) 
        ADDPROPERTY(cDetalle, "DoeiTotalCargos",oItem.doeitotalcargos) 
        ADDPROPERTY(cDetalle, "DoeiTotalImpuestos",oItem.doeitotalimpuestos) 
        ADDPROPERTY(cDetalle, "DoeiBase",oItem.doeibase) 
        ADDPROPERTY(cDetalle, "DoeiSubtotal",oItem.doeisubtotal) 
        ADDPROPERTY(cDetalle, "TicpCodigo",oItem.ticpcodigo) 
        ADDPROPERTY(cDetalle, "UnimCodigo",oItem.unimcodigo) 
        ADDPROPERTY(cDetalle, "CtprCodigo",oItem.ctprcodigo) 
        ADDPROPERTY(cDetalle, "DoeiNumeroRadicadoRemesa",oItem.doeinumeroradicadoremesa) 
        ADDPROPERTY(cDetalle, "DoeiNumeroConsecutivoRemesa",oItem.doeinumeroconsecutivoremesa) 
        ADDPROPERTY(cDetalle, "DoeiValorFleteRemesa",oItem.doeivalorfleteremesa) 
        ADDPROPERTY(cDetalle, "DoeiCantidadFleteRemesa",oItem.doeicantidadfleteremesa) 
        ADDPROPERTY(cDetalle, "DoeiUnimCodigoRemesa",oItem.doeiunimcodigoremesa) 

        oImpuestoLinea = CREATEOBJECT("Collection")
        FOR j = 1 TO oImpuestos.Count
            oImpuestoLinea.Add(ItemImpuesto(oImpuestos.Item(j)))
        ENDFOR
        ADDPROPERTY(cDetalle, "ImpuestosLinea", oImpuestoLinea)
        
        DetalleFactura.Add(cDetalle)
    ENDFOR
    RETURN DetalleFactura
ENDFUNC

FUNCTION Factura
    LPARAMETERS oDocumento    
    Factura = CREATEOBJECT("EMPTY")
    ADDPROPERTY(Factura, "Solicitud", oDocumento.Solicitud)
    ADDPROPERTY(Factura, "DocumentoEquivalente", oDocumento.DocumentoEquivalente)
    RETURN Factura
ENDFUNC

FUNCTION ResumenImpuestosFactura
    LPARAMETERS _cursor
    oResumen = CREATEOBJECT("EMPTY")
    ADDPROPERTY(oResumen, "DeriTotalIva", _cursor.deritotaliva)
    ADDPROPERTY(oResumen, "DeriTotalConsumo", _cursor.deritotalconsumo)
    ADDPROPERTY(oResumen, "DeriTotalIca", _cursor.deritotalica)
    RETURN oResumen
ENDFUNC

FUNCTION TotalesFactura
    LPARAMETERS _cursor
    oTotales = CREATEOBJECT("EMPTY")
    ADDPROPERTY(oTotales, "DoetSubtotal", _cursor.doetsubtotal)
    ADDPROPERTY(oTotales, "DoetBase", _cursor.doetbase)
    ADDPROPERTY(oTotales, "DoetTotalImpuestos", _cursor.doettotalimpuestos)
    ADDPROPERTY(oTotales, "DoetSubtotalMasImpuestos", _cursor.DoetSubtotalMasImpuestos)
    ADDPROPERTY(oTotales, "DoetTotalDescuentos", _cursor.DoetTotalDescuentos)
    ADDPROPERTY(oTotales, "DoetTotalcargos", _cursor.DoetTotalcargos)
    ADDPROPERTY(oTotales, "DoetTotalAnticipos", _cursor.DoetTotalAnticipos)
    ADDPROPERTY(oTotales, "DoetAjusteAlPeso", _cursor.DoetAjusteAlPeso)
    ADDPROPERTY(oTotales, "DoetTotalDocumento", _cursor.DoetTotalDocumento)
    RETURN oTotales
ENDFUNC

FUNCTION Extensiones
    LPARAMETERS _cursor
    oFabricanteSoftware = CREATEOBJECT("EMPTY")
    ADDPROPERTY(oFabricanteSoftware, "NombreApellido", _cursor.nombreapellido)
    ADDPROPERTY(oFabricanteSoftware, "RazonSocial", _cursor.razonsocial)
    ADDPROPERTY(oFabricanteSoftware, "NombreSoftware", _cursor.nombresoftware)
    ADDPROPERTY(oFabricanteSoftware, "NIT", _cursor.NIT)

    oBeneficiosComprador = CREATEOBJECT("EMPTY")
    ADDPROPERTY(oBeneficiosComprador, "Codigo", _cursor.codigo)
    ADDPROPERTY(oBeneficiosComprador, "NombresApellidos", _cursor.nombresapellidos)
    ADDPROPERTY(oBeneficiosComprador, "Puntos", _cursor.puntos)

    oInformacionCajaVenta = CREATEOBJECT("EMPTY")
    ADDPROPERTY(oInformacionCajaVenta, "PlacaCaja", _cursor.placacaja)
    ADDPROPERTY(oInformacionCajaVenta, "UbicacionCaja", _cursor.ubicacioncaja)
    ADDPROPERTY(oInformacionCajaVenta, "Cajero", _cursor.cajero)
    ADDPROPERTY(oInformacionCajaVenta, "TipoCaja", _cursor.tipocaja)
    ADDPROPERTY(oInformacionCajaVenta, "CodigoVenta", _cursor.codigoventa)
    ADDPROPERTY(oInformacionCajaVenta, "Subtotal", _cursor.subtotal)

    oExtensionesPOS = CREATEOBJECT("EMPTY")
    ADDPROPERTY(oExtensionesPOS, "FabricanteSoftware", oFabricanteSoftware)
    ADDPROPERTY(oExtensionesPOS, "BeneficiosComprador", oBeneficiosComprador)
    ADDPROPERTY(oExtensionesPOS, "InformacionCajaVenta", oInformacionCajaVenta)

    oExtension = CREATEOBJECT("EMPTY")
    ADDPROPERTY(oExtension, "ExtensionesPOS", oExtensionesPOS)
    ADDPROPERTY(oExtension, "EstensionesDocumentoExtracto", NULL)
    ADDPROPERTY(oExtension, "EstensionesBolsaValores", NULL)
    ADDPROPERTY(oExtension, "ExtensionesBoletaCine", NULL)
    RETURN oExtension
ENDFUNC

FUNCTION QueryFactura
    LPARAMETERS loSer
    OPEN DATABASE dbfacturation

    SELECT * FROM cabeceras WHERE id=1 INTO CURSOR cCabecera
    strJson = loSer.Serialize("cursor:cCabecera")
    USE IN cCabecera
    objJson = loSer.Deserialize(strJson)
    RETURN objJson.rows[1]
ENDFUNC

FUNCTION QueryCliente
    LPARAMETERS loSer
    OPEN DATABASE dbfacturation

    SELECT * FROM clientes WHERE id=1 INTO CURSOR cCliente
    strJson = loSer.Serialize("cursor:cCliente")
    USE IN cCliente
    objJson = loSer.Deserialize(strJson)
    RETURN objJson.rows[1]
ENDFUNC

FUNCTION QueryDetalle
    LPARAMETERS loSer
    OPEN DATABASE dbfacturation

    SELECT * FROM ventas_i WHERE id=1 INTO CURSOR cDetalles
    strJson = loSer.Serialize("cursor:cDetalles")
    USE IN cDetalles
    objJson = loSer.Deserialize(strJson)
    RETURN objJson.rows
ENDFUNC

FUNCTION QueryImpuestos
    LPARAMETERS loSer
    OPEN DATABASE dbfacturation

    SELECT * FROM ventas_i WHERE id=1 INTO CURSOR cImpuestos
    strJson = loSer.Serialize("cursor:cImpuestos")
    USE IN cImpuestos
    objJson = loSer.Deserialize(strJson)
    RETURN objJson.rows
ENDFUNC

FUNCTION ServicioPrueba
	LOCAL loSer, mVentas, mCliente, mDetalle
    DO wwJsonSerializer

    loSer = CREATEOBJECT("wwJsonSerializer")
    oDocumento = CREATEOBJECT('Documento')
    
    oDocumento.setNonceSolicitud("XXXXX")
    oDocumento.setSuscriptorSolicitud("Sus EDWIN Cript")
    
    mVentas = QueryFactura(loSer)
    mDetalle = QueryDetalle(loSer)
    mCliente = QueryCliente(loSer)
    mImpuestos = QueryImpuestos(loSer)
        
	oCabecera = Cabecera(mVentas)
    oDocumento.AddDocumentoEquivalente("Cabecera", oCabecera)

    oPeriodoFactura = PeriodoFactura(mVentas)
    oDocumento.AddDocumentoEquivalente("PeriodoFactura", oPeriodoFactura)

    oExtensiones = Extensiones(mVentas)
    oDocumento.AddDocumentoEquivalente("Extensiones", oExtensiones)

    oResumenImpuestosFactura = ResumenImpuestosFactura(mImpuestos)
    oDocumento.AddDocumentoEquivalente("ResumenImpuestosFactura", oResumenImpuestosFactura)
    
    oDetalleFactura = DetallesFactura(mDetalle, mImpuestos)
    oDocumento.AddDocumentoEquivalente("DetalleFactura", oDetalleFactura)

    oPagosFactura = PagosFactura(mVentas)
    oDocumento.AddDocumentoEquivalente("PagosFactura", oPagosFactura)

    oAdquiriente = Adquiriente(mCliente)
    oDocumento.AddDocumentoEquivalente("AdquirienteFactura", oAdquiriente)

    oAdquirienteContacto = AdquirienteContacto(mCliente)
    oDocumento.AddDocumentoEquivalente("adquirienteContacto", oAdquirienteContacto)

    oTotalesFactura = TotalesFactura(mVentas)
    oDocumento.AddDocumentoEquivalente("TotalesFactura", oTotalesFactura)

    RETURN loSer.Serialize(Factura(oDocumento))
ENDFUNC