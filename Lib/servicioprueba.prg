#INCLUDE foxpro.h

SET PROCEDURE TO ServicioPrueba ADDITIVE

DEFINE CLASS Documento AS Custom
    Solicitud = .NULL.
    DocumentoEquivalente = .NULL.

    PROCEDURE Init
        THIS.DocumentoEquivalente = CREATEOBJECT("EMPTY")
    ENDPROC

    PROCEDURE setParams
        LPARAMETERS objeto
        THIS.Solicitud = CREATEOBJECT("EMPTY")
        ADDPROPERTY(THIS.Solicitud, "Nonce", objeto.nonce)
        ADDPROPERTY(THIS.Solicitud, "Suscriptor", objeto.suscriptor)
    ENDPROC
    
    PROCEDURE addDocumentoEquivalente
        LPARAMETERS oClave, objeto
        ADDPROPERTY(THIS.DocumentoEquivalente, oClave, objeto)
    ENDPROC
ENDDEFINE

DEFINE CLASS ServicioPrueba AS Custom
    loSer = .NULL.

    FUNCTION Init
        DO wwJsonSerializer
        Do ReplaceString
        OPEN DATABASE bdmaster
        SET DATE DMY
        THIS.loSer = CREATEOBJECT("wwJsonSerializer")
	ENDFUNC

    FUNCTION PeriodoFactura
        LPARAMETERS objeto
        oPeriodoFactura = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oPeriodoFactura, "DoepFechaInicial", objeto.doepfechainicial)
        ADDPROPERTY(oPeriodoFactura, "DoepFechaFinal", objeto.doepfechafinal)
        RETURN oPeriodoFactura
    ENDFUNC

    FUNCTION PagosFactura
        LPARAMETERS objeto    
        PagosFactura = CREATEOBJECT("EMPTY")
        ADDPROPERTY(PagosFactura, "ForpCodigo", objeto.forpcodigo)
        ADDPROPERTY(PagosFactura, "DoepFechaVencimiento", objeto.doepfechavencimiento)
        
        aMedios = CREATEOBJECT("Collection")
        cMedio = CREATEOBJECT("EMPTY")
        ADDPROPERTY(cMedio, "DempCodigo", objeto.dempcodigo)
        ADDPROPERTY(cMedio, "DempDescripcion", objeto.dempdescripcion)
        aMedios.Add(cMedio)
        
        ADDPROPERTY(PagosFactura, "Medios", aMedios)
        RETURN PagosFactura
    ENDFUNC	

    FUNCTION Cabecera
        LPARAMETERS objeto
        Cabecera = CREATEOBJECT("EMPTY")
        ADDPROPERTY(Cabecera, "DoceManejaPeriodos", objeto.docemanejaperiodos)
        ADDPROPERTY(Cabecera, "DoceConsecutivo", objeto.doceconsecutivo)
        ADDPROPERTY(Cabecera, "DocePrefijo", objeto.doceprefijo)
        ADDPROPERTY(Cabecera, "DoceFecha", objeto.docefecha)
        ADDPROPERTY(Cabecera, "DoceCantidadItems", objeto.docecantidaditems)
        ADDPROPERTY(Cabecera, "DoceLineasWhatsApp", objeto.docelineaswhatsapp)
        ADDPROPERTY(Cabecera, "AmbdCodigo", objeto.ambdcodigo)
        ADDPROPERTY(Cabecera, "TipoCodigo", objeto.tipocodigo)
        ADDPROPERTY(Cabecera, "DoetCodigo", objeto.doetcodigo)
        ADDPROPERTY(Cabecera, "MoneCodigo", objeto.monecodigo)
        ADDPROPERTY(Cabecera, "RefvNumero", objeto.refvnumero)
        ADDPROPERTY(Cabecera, "DoceReferenciaPago", objeto.docereferenciapago)
        ADDPROPERTY(Cabecera, "EnviarSetPruebas", objeto.enviarsetpruebas)
        RETURN Cabecera
    ENDFUNC	

    FUNCTION Adquiriente 
        LPARAMETERS objeto 
        Adquiriente = CREATEOBJECT("EMPTY") 
        ADDPROPERTY(Adquiriente,"CalcularDv", objeto.calculardv)
        ADDPROPERTY(Adquiriente,"DoeaEsResponsable", objeto.doeaesresponsable)
        ADDPROPERTY(Adquiriente,"DoeaEsnacional", objeto.doeaesnacional)
        ADDPROPERTY(Adquiriente,"DoeaDocumento", objeto.doeadocumento)
        ADDPROPERTY(Adquiriente,"DoeaDiv", objeto.doeadiv)
        ADDPROPERTY(Adquiriente,"DoeaRazonSocial", objeto.doearazonsocial)
        ADDPROPERTY(Adquiriente,"DoeaNombreCiudad", objeto.doeanombreciudad)
        ADDPROPERTY(Adquiriente,"DoeaNombreDepartamento", objeto.doeanombredepartamento)
        ADDPROPERTY(Adquiriente,"DoeaPais", objeto.doeapais)
        ADDPROPERTY(Adquiriente,"DoeaDireccion", objeto.doeadireccion)
        ADDPROPERTY(Adquiriente,"DoeaObligaciones", objeto.doeaobligaciones)
        ADDPROPERTY(Adquiriente,"DoeaNombres", objeto.doeanombres)
        ADDPROPERTY(Adquiriente,"DoeaApellidos", objeto.doeaapellidos)
        ADDPROPERTY(Adquiriente,"DoeaOtrosNombres", objeto.doeaotrosnombres)
        ADDPROPERTY(Adquiriente,"DoeaCorreo", objeto.doeacorreo)
        ADDPROPERTY(Adquiriente,"DoeaTelefono", objeto.doeatelefono)
        ADDPROPERTY(Adquiriente,"TiotCodigo", objeto.tiotcodigo)
        ADDPROPERTY(Adquiriente,"CopcCodigo", objeto.copccodigo)
        ADDPROPERTY(Adquiriente,"RegCodigo", objeto.regcodigo)
        ADDPROPERTY(Adquiriente,"TidtCodigo", objeto.tidtcodigo)
        ADDPROPERTY(Adquiriente,"DoeaManejoAdjuntos", objeto.doeamanejoadjuntos)
        ADDPROPERTY(Adquiriente,"DoeaProcedencia", objeto.doeaprocedencia)
        RETURN Adquiriente
    ENDFUNC

    FUNCTION AdquirienteContacto
        LPARAMETERS objeto 
        AdquirienteContacto = CREATEOBJECT("EMPTY") 
        ADDPROPERTY(AdquirienteContacto,"DeacNombre", objeto.deacnombre)
        ADDPROPERTY(AdquirienteContacto,"DeacTelefono", objeto.deactelefono)
        ADDPROPERTY(AdquirienteContacto,"DeacCorreo", objeto.deaccorreo)
        ADDPROPERTY(AdquirienteContacto,"DeacCodigo", objeto.deaccodigo)
        RETURN AdquirienteContacto
    ENDFUNC

    FUNCTION ItemImpuesto
        LPARAMETERS oItem

        oDetalle = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oDetalle, "DediBase",oItem.dedibase) 
        ADDPROPERTY(oDetalle, "DediValor",oItem.dedivalor) 
        ADDPROPERTY(oDetalle, "DediFactor",oItem.dedifactor) 
        ADDPROPERTY(oDetalle, "UnimCodigo",oItem.unimcodigo) 

        cImpuesto = CREATEOBJECT("EMPTY")
        ADDPROPERTY(cImpuesto, "DoeiTotal", oItem.doeitotal)
        ADDPROPERTY(cImpuesto, "DoeiEsPorcentual", oItem.doeiesporcentual)
        ADDPROPERTY(cImpuesto, "ImpuCodigo", oItem.impucodigo)
        ADDPROPERTY(cImpuesto, "Detalle", oDetalle)
        
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
                oImpuestoLinea.Add(THIS.ItemImpuesto(oImpuestos.Item(j)))
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
        LPARAMETERS objeto
        oResumen = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oResumen, "DeriTotalIva", objeto.deritotaliva)
        ADDPROPERTY(oResumen, "DeriTotalConsumo", objeto.deritotalconsumo)
        ADDPROPERTY(oResumen, "DeriTotalIca", objeto.deritotalica)
        RETURN oResumen
    ENDFUNC

    FUNCTION TotalesFactura
        LPARAMETERS objeto
        oTotales = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oTotales, "DoetSubtotal", objeto.doetsubtotal)
        ADDPROPERTY(oTotales, "DoetBase", objeto.doetbase)
        ADDPROPERTY(oTotales, "DoetTotalImpuestos", objeto.doettotalimpuestos)
        ADDPROPERTY(oTotales, "DoetSubtotalMasImpuestos", objeto.doetsubtotalmasimpuestos)
        ADDPROPERTY(oTotales, "DoetTotalDescuentos", objeto.doettotaldescuentos)
        ADDPROPERTY(oTotales, "DoetTotalcargos", objeto.doettotalcargos)
        ADDPROPERTY(oTotales, "DoetTotalAnticipos", objeto.doettotalanticipos)
        ADDPROPERTY(oTotales, "DoetAjusteAlPeso", objeto.doetajustealpeso)
        ADDPROPERTY(oTotales, "DoetTotalDocumento", objeto.doettotaldocumento)
        RETURN oTotales
    ENDFUNC

    FUNCTION Extensiones
        LPARAMETERS objeto
        oFabricanteSoftware = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oFabricanteSoftware, "NombreApellido", objeto.nombreapellido)
        ADDPROPERTY(oFabricanteSoftware, "RazonSocial", objeto.razonsocial)
        ADDPROPERTY(oFabricanteSoftware, "NombreSoftware", objeto.nombresoftware)
        ADDPROPERTY(oFabricanteSoftware, "NIT", objeto.nit)

        oBeneficiosComprador = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oBeneficiosComprador, "Codigo", objeto.codigo)
        ADDPROPERTY(oBeneficiosComprador, "NombresApellidos", objeto.nombresapellidos)
        ADDPROPERTY(oBeneficiosComprador, "Puntos", objeto.puntos)

        oInformacionCajaVenta = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oInformacionCajaVenta, "PlacaCaja", objeto.placacaja)
        ADDPROPERTY(oInformacionCajaVenta, "UbicacionCaja", objeto.ubicacioncaja)
        ADDPROPERTY(oInformacionCajaVenta, "Cajero", objeto.cajero)
        ADDPROPERTY(oInformacionCajaVenta, "TipoCaja", objeto.tipocaja)
        ADDPROPERTY(oInformacionCajaVenta, "CodigoVenta", objeto.codigoventa)
        ADDPROPERTY(oInformacionCajaVenta, "Subtotal", objeto.subtotal)

        oExtensionesPOS = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oExtensionesPOS, "FabricanteSoftware", oFabricanteSoftware)
        ADDPROPERTY(oExtensionesPOS, "BeneficiosComprador", oBeneficiosComprador)
        ADDPROPERTY(oExtensionesPOS, "InformacionCajaVenta", oInformacionCajaVenta)

        oExtension = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oExtension, "ExtensionesPOS", oExtensionesPOS)
        ADDPROPERTY(oExtension, "EstensionesDocumentoExtracto", .NULL.)
        ADDPROPERTY(oExtension, "EstensionesBolsaValores", .NULL.)
        ADDPROPERTY(oExtension, "ExtensionesBoletaCine", .NULL.)
        RETURN oExtension
    ENDFUNC

    FUNCTION QueryStatus()
        LOCAL strJson, objJson 
        
        SELECT ;
        '' AS nonce, ;
        '' AS suscriptor, ;
        '' AS nombreapellido, ;
        '' AS razonsocial, ;
        '' AS nombresoftware, ;
        '' AS nit, ;
        '' AS codigo, ;
        '' AS nombresapellidos, ;
        '' AS puntos, ;
        '' AS placacaja, ;
        '' AS ubicacioncaja, ;
        '' AS cajero, ;
        '' AS tipocaja, ;
        '' AS codigoventa, ;
        '' AS subtotal ;
        FROM status ;
        WHERE id=1 ; 
        INTO CURSOR cStatus
        
        strJson = THIS.loSer.Serialize("cursor:cStatus")
        objJson = THIS.loSer.Deserialize(strJson)
        USE IN cStatus
        RETURN objJson.rows[1]
    ENDFUNC

    FUNCTION QueryVentas(marca, numero)
        LOCAL strJson, objJson

        *CREATE TABLE fventas (marca N(2),numero N(10),factura N(10),fecha C(8), hora C(10),tipo C(2), vence C(8),cliente C(20),;
        *items N(3),valor N(10),valor2 N(10),efectivo2 N(10),efectivo N(10),credito N(10),cheque N(10),tarjeta N(10),;
        *bono N(10),saldo N(10),codtar C(2),codban C(8),vendedor N(3),nota C(100),separado N(1),bolsas N(2),iconsumo N(6),;
        *estado C(1),dc_marca N(2),dc_numero N(10),pagado N(10),cambio N(10),banco C(15),numres C(20),valida C(1))

        *!*	 INSERT INTO fventas ;
        *!*	 (marca,numero,factura,fecha,hora,tipo,vence,cliente,items,valor,valor2,efectivo2,efectivo,credito,cheque,tarjeta,bono,saldo,codtar,codban,vendedor,nota,separado,bolsas,iconsumo,estado,dc_marca,dc_numero,pagado,cambio,banco,numres,valida);
        *!*	 VALUES(6, 2897, 1,'13/05/2024','12:12:00','V','13/05/2024','222222222222', 1, 50000, 50000, 120000, 120000, 0, 0, 0, 0, 0,'','',1,'VENTA 1', 0, 0, 0, 'A', 0, 0, 1, 20000, '', '', '1')

        SELECT ;
            '' AS docemanejaperiodos, ;
            '' AS doceconsecutivo, ;
            'FES' As doceprefijo, ;
            fecha As docefecha, ;
            '' AS docecantidaditems, ;
            '' AS docelineaswhatsapp, ;
            '' AS ambdcodigo, ;
            '' AS tipocodigo, ;
            '' AS doetcodigo, ;
            '' AS monecodigo, ;
            '' AS refvnumero, ;
            '' AS docereferenciapago, ;
            '' AS enviarsetpruebas, ;
            '' AS forpcodigo, ;
            '' AS doepfechavencimiento, ;
            '' AS doempcodigo, ;
            '' AS dempdescripcion, ;
            '' AS codigo, ;
            '' AS nombreapellidos, ;
            '' AS puntos, ;
            '' AS subtotal, ;
            '' AS doepfechainicial, ;
            '' AS doepfechafinal, ;
            '' AS dempcodigo, ;
            '' AS doetsubtotal, ;
            '' AS doetbase, ;
            '' AS doettotalimpuestos, ;
            '' AS doetsubtotalmasimpuestos, ;
            '' AS doettotaldescuentos, ; 
            '' AS doettotalcargos, ; 
            '' AS doettotalanticipos, ;
            '' AS doetajustealpeso, ;
            '' AS doettotaldocumento , ; 
            cliente ;
        FROM fventas WHERE marca=?marca AND numero=?numero INTO CURSOR cVentas
        
        strJson = THIS.loSer.Serialize("cursor:cVentas")
        objJson = THIS.loSer.Deserialize(strJson)
        USE IN cVentas
        RETURN objJson.rows[1]
    ENDFUNC

    FUNCTION QueryCliente(cliente)
        LOCAL strJson, objJson 
        SELECT  ;
            '' AS calculardv, ;
            '' AS doeaesresponsable, ;
            '' AS doeaesnacional, ;
            '' AS doeadocumento, ;
            '' AS doeadiv, ;
            '' AS doearazonsocial, ;
            '' AS doeanombreciudad, ;
            '' AS doeanombredepartamento, ;
            '' AS doeapais, ;
            '' AS doeadireccion, ;
            '' AS doeaobligaciones, ;
            '' AS doeanombres, ;
            '' AS doeaapellidos, ;
            '' AS doeaotrosnombres, ;
            '' AS doeacorreo, ;
            '' AS doeatelefono, ;
            '' AS tiotcodigo, ;
            '' AS copccodigo, ;
            '' AS regcodigo, ;
            '' AS tidtcodigo, ;
            '' AS doeamanejoadjuntos, ;
            '' AS doeaprocedencia, ;
            '' AS deacnombre, ;
            '' AS deactelefono, ;
            '' AS deaccorreo, ;
            '' AS deaccodigo ;
        FROM clientes WHERE nit=?cliente INTO CURSOR cCliente
        strJson = THIS.loSer.Serialize("cursor:cCliente")
        objJson = THIS.loSer.Deserialize(strJson)
        USE IN cCliente
        RETURN objJson.rows[1]
    ENDFUNC

    FUNCTION QueryDetalle(marca, numero)
        LOCAL strJson, objJson 
        
        SELECT ; 
        '' AS doeiitem, ;
        '' AS doeicodigo, ;
        '' AS doeidescripcion, ;
        '' AS doeimarca, ;
        '' AS doeimodelo, ;
        '' AS doeiobservacion, ;
        '' AS doeidatosvendedor, ;
        '' AS doeicantidad, ;
        '' AS doeicantidadempaque, ;
        '' AS doeiesobsequio, ;
        '' AS doeipreciounitario, ;
        '' AS doeiprecioreferencia, ;
        '' AS doeivalor, ;
        '' AS doeitotaldescuentos, ;
        '' AS doeitotalcargos, ;
        '' AS doeitotalimpuestos, ;
        '' AS doeibase, ;
        '' AS doeisubtotal, ;
        '' AS ticpcodigo, ;
        '' AS unimcodigo, ;
        '' AS ctprcodigo, ;
        '' AS doeinumeroradicadoremesa, ;
        '' AS doeinumeroconsecutivoremesa, ;
        '' AS doeivalorfleteremesa, ;
        '' AS doeicantidadfleteremesa, ;
        '' AS doeiunimcodigoremesa ; 
        FROM fventas WHERE marca=?marca AND numero=?numero INTO CURSOR cDetalles

        strJson = THIS.loSer.Serialize("cursor:cDetalles")
        objJson = THIS.loSer.Deserialize(strJson)
        USE IN cDetalles
        RETURN objJson.rows
    ENDFUNC

    FUNCTION QueryImpuestos(marca, numero)
        LOCAL strJson, objJson

        SELECT ;
        '' AS deritotaliva, ;
        '' AS deritotalconsumo, ;
        '' AS deritotalica, ;
        '' AS doeitotal, ;
        '' AS doeiesporcentual, ;
        '' AS impucodigo, ;
        '' AS detalle, ;
        '' AS dedibase, ;
        '' AS dedivalor, ;
        '' AS dedifactor, ;
        '' AS unimcodigo ;
        FROM fventas ; 
        WHERE marca=?marca AND numero=?numero; 
        INTO CURSOR cImpuestos 
        
        strJson = THIS.loSer.Serialize("cursor:cImpuestos")
        objJson = THIS.loSer.Deserialize(strJson)
        USE IN cImpuestos
        RETURN objJson.rows
    ENDFUNC

    FUNCTION GeneraFile(sFieldValue)
        _file = FCREATE("test.txt")
        FWRITE(_file, sFieldValue)
        FCLOSE(_file)
    ENDFUNC

    FUNCTION ReplaceStr(strJson)
        LOCAL sFieldValue
        replaceStr = CREATEOBJECT('ReplaceString')
        sFieldValue = replaceStr.Remplazar(strJson)
        ? sFieldValue
        RETURN sFieldValue
    ENDFUNC

    FUNCTION Principal(marca, numero)
        LOCAL oDocumento, oCabecera, oPeriodoFactura, oExtensiones, oResumenImpuestosFactura, oDetalleFactura, oPagosFactura, oAdquiriente, oTotalesFactura, oAdquirienteContacto, oFactura
        
        mStatus = THIS.QueryStatus() 
        mVenta = THIS.QueryVentas(marca, numero)
        mCliente = THIS.QueryCliente(mVenta.cliente)
        mDetalle = THIS.QueryDetalle(marca, numero)
        mImpuestos = THIS.QueryImpuestos(marca, numero)

        oDocumento = CREATEOBJECT('Documento')
        oDocumento.setParams(mStatus)
        
        oCabecera = THIS.Cabecera(mVenta)
        oDocumento.AddDocumentoEquivalente("Cabecera", oCabecera)

        oPeriodoFactura = THIS.PeriodoFactura(mVenta)
        oDocumento.AddDocumentoEquivalente("PeriodoFactura", oPeriodoFactura)

        oExtensiones = THIS.Extensiones(mStatus)
        oDocumento.AddDocumentoEquivalente("Extensiones", oExtensiones)
        
        oResumenImpuestosFactura = THIS.ResumenImpuestosFactura(mImpuestos[1])
        oDocumento.AddDocumentoEquivalente("ResumenImpuestosFactura", oResumenImpuestosFactura)
        
        oDetalleFactura = THIS.DetallesFactura(mDetalle, mImpuestos)
        oDocumento.AddDocumentoEquivalente("DetalleFactura", oDetalleFactura)

        oPagosFactura = THIS.PagosFactura(mVenta)
        oDocumento.AddDocumentoEquivalente("PagosFactura", oPagosFactura)

        oAdquiriente = THIS.Adquiriente(mCliente)
        oDocumento.AddDocumentoEquivalente("AdquirienteFactura", oAdquiriente)

        oAdquirienteContacto = THIS.AdquirienteContacto(mCliente)
        oDocumento.AddDocumentoEquivalente("adquirienteContacto", oAdquirienteContacto)

        oTotalesFactura = THIS.TotalesFactura(mVenta)
        oDocumento.AddDocumentoEquivalente("TotalesFactura", oTotalesFactura)
        
        oFactura = THIS.Factura(oDocumento)
        sFieldValue = This.ReplaceStr(THIS.loSer.Serialize(oFactura))
        THIS.GeneraFile(sFieldValue)
        RETURN .T.
    ENDFUNC

ENDDEFINE