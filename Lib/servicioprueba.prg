#INCLUDE foxpro.h
SET PROCEDURE TO ServicioPrueba ADDITIVE

DEFINE CLASS Documento AS Custom
    Solicitud = .NULL.
    DocumentoEquivalente = .NULL.

    PROCEDURE Init
        THIS.DocumentoEquivalente = CREATEOBJECT("EMPTY")
    ENDPROC

    PROCEDURE setParams(objeto) 
        THIS.Solicitud = CREATEOBJECT("EMPTY")
        ADDPROPERTY(THIS.Solicitud, "Nonce", objeto.nonce)
        ADDPROPERTY(THIS.Solicitud, "Suscriptor", objeto.suscriptor)
    ENDPROC
    
    PROCEDURE addDocumentoEquivalente(oClave, objeto)
        ADDPROPERTY(THIS.DocumentoEquivalente, oClave, objeto)
    ENDPROC
ENDDEFINE

DEFINE CLASS ServicioPrueba AS Custom
    loSer = .NULL.
    FUNCTION Init
        DO wwJsonSerializer
        Do ReplaceString
        THIS.loSer = CREATEOBJECT("wwJsonSerializer")
	ENDFUNC

    FUNCTION PeriodoFactura(objeto)
        LOCAL oPeriodoFactura
        oPeriodoFactura = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oPeriodoFactura, "DoepFechaInicial", objeto.doepfechainicial)
        ADDPROPERTY(oPeriodoFactura, "DoepFechaFinal", objeto.doepfechafinal)
        RETURN oPeriodoFactura
    ENDFUNC

    FUNCTION PagosFactura(objeto)    
        LOCAL oPagosFactura, aMedios, cMedio
        oPagosFactura = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oPagosFactura, "ForpCodigo", objeto.forpcodigo)
        ADDPROPERTY(oPagosFactura, "DoepFechaVencimiento", objeto.doepfechavencimiento)
        
        aMedios = CREATEOBJECT("Collection")
        cMedio = CREATEOBJECT("EMPTY")
        ADDPROPERTY(cMedio, "DempCodigo", objeto.dempcodigo)
        ADDPROPERTY(cMedio, "DempDescripcion", objeto.dempdescripcion)
        aMedios.Add(cMedio)
        
        ADDPROPERTY(oPagosFactura, "Medios", aMedios)
        RETURN oPagosFactura
    ENDFUNC	

    FUNCTION Cabecera(objeto)
        LOCAL oCabecera
        oCabecera = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oCabecera, "DoceManejaPeriodos", objeto.docemanejaperiodos)
        ADDPROPERTY(oCabecera, "DoceConsecutivo", objeto.doceconsecutivo)
        ADDPROPERTY(oCabecera, "DocePrefijo", objeto.doceprefijo)
        ADDPROPERTY(oCabecera, "DoceFecha", objeto.docefecha)
        ADDPROPERTY(oCabecera, "DoceCantidadItems", objeto.docecantidaditems)
        ADDPROPERTY(oCabecera, "DoceLineasWhatsApp", objeto.docelineaswhatsapp)
        ADDPROPERTY(oCabecera, "AmbdCodigo", objeto.ambdcodigo)
        ADDPROPERTY(oCabecera, "TipoCodigo", objeto.tipocodigo)
        ADDPROPERTY(oCabecera, "DoetCodigo", objeto.doetcodigo)
        ADDPROPERTY(oCabecera, "MoneCodigo", objeto.monecodigo)
        ADDPROPERTY(oCabecera, "RefvNumero", objeto.refvnumero)
        ADDPROPERTY(oCabecera, "DoceReferenciaPago", objeto.docereferenciapago)
        ADDPROPERTY(oCabecera, "EnviarSetPruebas", objeto.enviarsetpruebas)
        RETURN oCabecera
    ENDFUNC	

    FUNCTION Adquiriente(objeto) 
        LOCAL oAdquiriente
        oAdquiriente = CREATEOBJECT("EMPTY") 
        ADDPROPERTY(oAdquiriente,"CalcularDv", objeto.calculardv)
        ADDPROPERTY(oAdquiriente,"DoeaEsResponsable", objeto.doeaesresponsable)
        ADDPROPERTY(oAdquiriente,"DoeaEsnacional", objeto.doeaesnacional)
        ADDPROPERTY(oAdquiriente,"DoeaDocumento", objeto.doeadocumento)
        ADDPROPERTY(oAdquiriente,"DoeaDiv", objeto.doeadiv)
        ADDPROPERTY(oAdquiriente,"DoeaRazonSocial", objeto.doearazonsocial)
        ADDPROPERTY(oAdquiriente,"DoeaNombreCiudad", objeto.doeanombreciudad)
        ADDPROPERTY(oAdquiriente,"DoeaNombreDepartamento", objeto.doeanombredepartamento)
        ADDPROPERTY(oAdquiriente,"DoeaPais", objeto.doeapais)
        ADDPROPERTY(oAdquiriente,"DoeaDireccion", objeto.doeadireccion)
        ADDPROPERTY(oAdquiriente,"DoeaObligaciones", objeto.doeaobligaciones)
        ADDPROPERTY(oAdquiriente,"DoeaNombres", objeto.doeanombres)
        ADDPROPERTY(oAdquiriente,"DoeaApellidos", objeto.doeaapellidos)
        ADDPROPERTY(oAdquiriente,"DoeaOtrosNombres", objeto.doeaotrosnombres)
        ADDPROPERTY(oAdquiriente,"DoeaCorreo", objeto.doeacorreo)
        ADDPROPERTY(oAdquiriente,"DoeaTelefono", objeto.doeatelefono)
        ADDPROPERTY(oAdquiriente,"TiotCodigo", objeto.tiotcodigo)
        ADDPROPERTY(oAdquiriente,"CopcCodigo", objeto.copccodigo)
        ADDPROPERTY(oAdquiriente,"RegCodigo", objeto.regcodigo)
        ADDPROPERTY(oAdquiriente,"TidtCodigo", objeto.tidtcodigo)
        ADDPROPERTY(oAdquiriente,"DoeaManejoAdjuntos", objeto.doeamanejoadjuntos)
        ADDPROPERTY(oAdquiriente,"DoeaProcedencia", objeto.doeaprocedencia)
        RETURN oAdquiriente
    ENDFUNC

    FUNCTION AdquirienteContacto(objeto) 
        LOCAL oAdquirienteContacto 
        oAdquirienteContacto = CREATEOBJECT("EMPTY") 
        ADDPROPERTY(oAdquirienteContacto,"DeacNombre", objeto.deacnombre)
        ADDPROPERTY(oAdquirienteContacto,"DeacTelefono", objeto.deactelefono)
        ADDPROPERTY(oAdquirienteContacto,"DeacCorreo", objeto.deaccorreo)
        ADDPROPERTY(oAdquirienteContacto,"DeacCodigo", objeto.deaccodigo)
        RETURN oAdquirienteContacto
    ENDFUNC

    FUNCTION ItemImpuesto(oItem)
        LOCAL oDetalle, oImpuesto

        oDetalle = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oDetalle, "DediBase",oItem.dedibase) 
        ADDPROPERTY(oDetalle, "DediValor",oItem.dedivalor) 
        ADDPROPERTY(oDetalle, "DediFactor",oItem.dedifactor) 
        ADDPROPERTY(oDetalle, "UnimCodigo",oItem.unimcodigo) 

        oImpuesto = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oImpuesto, "DoeiTotal", oItem.doeitotal)
        ADDPROPERTY(oImpuesto, "DoeiEsPorcentual", oItem.doeiesporcentual)
        ADDPROPERTY(oImpuesto, "ImpuCodigo", oItem.impucodigo)
        ADDPROPERTY(oImpuesto, "Detalle", oDetalle)
        
        RETURN oImpuesto
    ENDFUNC

    FUNCTION CreateImpuestosFactura(oImpuestos)
        LOCAL oImpuestosFactura 
        oImpuestosFactura = CREATEOBJECT("Collection")
        FOR i = 1 TO oImpuestos.Count
            oImpuestosFactura.Add(THIS.ItemImpuesto(oImpuestos.Item(i)))
        ENDFOR
        RETURN oImpuestosFactura
    ENDFUNC

    FUNCTION DetallesFactura(oDetalles, oImpuestos)
        LOCAL oDetalleFactura, oImpuestoLinea, oDetalle

        oDetalleFactura = CREATEOBJECT("Collection")
        FOR i = 1 TO oDetalles.Count
            oItem = oDetalles.Item(i)
            oDetalle = CREATEOBJECT("EMPTY")
            ADDPROPERTY(oDetalle, "DoeiItem",oItem.doeiitem) 
            ADDPROPERTY(oDetalle, "DoeiCodigo",oItem.doeicodigo) 
            ADDPROPERTY(oDetalle, "DoeiDescripcion",oItem.doeidescripcion) 
            ADDPROPERTY(oDetalle, "DoeiMarca",oItem.doeimarca) 
            ADDPROPERTY(oDetalle, "DoeiModelo",oItem.doeimodelo) 
            ADDPROPERTY(oDetalle, "DoeiObservacion",oItem.doeiobservacion) 
            ADDPROPERTY(oDetalle, "DoeiDatosVendedor",oItem.doeidatosvendedor) 
            ADDPROPERTY(oDetalle, "DoeiCantidad",oItem.doeicantidad) 
            ADDPROPERTY(oDetalle, "DoeiCantidadEmpaque",oItem.doeicantidadempaque) 
            ADDPROPERTY(oDetalle, "DoeiEsObsequio",oItem.doeiesobsequio) 
            ADDPROPERTY(oDetalle, "DoeiPrecioUnitario",oItem.doeipreciounitario) 
            ADDPROPERTY(oDetalle, "DoeiPrecioReferencia",oItem.doeiprecioreferencia) 
            ADDPROPERTY(oDetalle, "DoeiValor",oItem.doeivalor) 
            ADDPROPERTY(oDetalle, "DoeiTotalDescuentos",oItem.doeitotaldescuentos) 
            ADDPROPERTY(oDetalle, "DoeiTotalCargos",oItem.doeitotalcargos) 
            ADDPROPERTY(oDetalle, "DoeiTotalImpuestos",oItem.doeitotalimpuestos) 
            ADDPROPERTY(oDetalle, "DoeiBase",oItem.doeibase) 
            ADDPROPERTY(oDetalle, "DoeiSubtotal",oItem.doeisubtotal) 
            ADDPROPERTY(oDetalle, "TicpCodigo",oItem.ticpcodigo) 
            ADDPROPERTY(oDetalle, "UnimCodigo",oItem.unimcodigo) 
            ADDPROPERTY(oDetalle, "CtprCodigo",oItem.ctprcodigo) 
            ADDPROPERTY(oDetalle, "DoeiNumeroRadicadoRemesa",oItem.doeinumeroradicadoremesa) 
            ADDPROPERTY(oDetalle, "DoeiNumeroConsecutivoRemesa",oItem.doeinumeroconsecutivoremesa) 
            ADDPROPERTY(oDetalle, "DoeiValorFleteRemesa",oItem.doeivalorfleteremesa) 
            ADDPROPERTY(oDetalle, "DoeiCantidadFleteRemesa",oItem.doeicantidadfleteremesa) 
            ADDPROPERTY(oDetalle, "DoeiUnimCodigoRemesa",oItem.doeiunimcodigoremesa) 

            oImpuestoLinea = CREATEOBJECT("Collection")
            FOR j = 1 TO oImpuestos.Count
                oImpuestoLinea.Add(THIS.ItemImpuesto(oImpuestos.Item(j)))
            ENDFOR
            ADDPROPERTY(oDetalle, "ImpuestosLinea", oImpuestoLinea)
            
            oDetalleFactura.Add(oDetalle)
        ENDFOR
        RETURN oDetalleFactura
    ENDFUNC

    FUNCTION Factura(oDocumento)
        LOCAL oFactura    
        oFactura = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oFactura, "Solicitud", oDocumento.Solicitud)
        ADDPROPERTY(oFactura, "DocumentoEquivalente", oDocumento.DocumentoEquivalente)
        RETURN oFactura
    ENDFUNC

    FUNCTION ResumenImpuestosFactura(impuesto)
        LOCAL oResumen
        oResumen = CREATEOBJECT("EMPTY")
        ADDPROPERTY(oResumen, "DeriTotalIva", impuesto[1].deritotaliva)
        ADDPROPERTY(oResumen, "DeriTotalConsumo", impuesto[1].deritotalconsumo)
        ADDPROPERTY(oResumen, "DeriTotalIca", impuesto[1].deritotalica)
        RETURN oResumen
    ENDFUNC

    FUNCTION TotalesFactura(objeto)
        LOCAL oTotales
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

    FUNCTION Extensiones(objeto)
        LOCAL oFabricanteSoftware, oBeneficiosComprador, oExtensionesPOS, oExtension, oInformacionCajaVenta

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

        * CREATE TABLE fventas (marca N(2),numero N(10),factura N(10),fecha C(8), hora C(10),tipo C(2), vence C(8),cliente C(20),;
        * items N(3),valor N(10),valor2 N(10),efectivo2 N(10),efectivo N(10),credito N(10),cheque N(10),tarjeta N(10),;
        * bono N(10),saldo N(10),codtar C(2),codban C(8),vendedor N(3),nota C(100),separado N(1),bolsas N(2),iconsumo N(6),;
        * estado C(1),dc_marca N(2),dc_numero N(10),pagado N(10),cambio N(10),banco C(15),numres C(20),valida C(1))

        * INSERT INTO fventas ;
        * (marca,numero,factura,fecha,hora,tipo,vence,cliente,items,valor,valor2,efectivo2,efectivo,credito,cheque,tarjeta,bono,saldo,codtar,codban,vendedor,nota,separado,bolsas,iconsumo,estado,dc_marca,dc_numero,pagado,cambio,banco,numres,valida);
        * VALUES(6, 2897, 1,'13/05/2024','12:12:00','V','13/05/2024','222222222222', 1, 50000, 50000, 120000, 120000, 0, 0, 0, 0, 0,'','',1,'VENTA 1', 0, 0, 0, 'A', 0, 0, 1, 20000, '', '', '1')

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
        WHERE marca=?marca AND numero=?numero ; 
        INTO CURSOR cImpuestos 
        
        strJson = THIS.loSer.Serialize("cursor:cImpuestos")
        objJson = THIS.loSer.Deserialize(strJson)
        USE IN cImpuestos
        RETURN objJson.rows
    ENDFUNC

    FUNCTION GeneraFile(sFieldValue)
        LOCAL _file
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
        LOCAL oDocumento, oCabecera, oPeriodoFactura, oExtensiones, oResumenImpuestosFactura, oDetalleFactura, oPagosFactura, oAdquiriente, oTotalesFactura, oAdquirienteContacto, oFactura, mStatus, mVenta, mCliente, mDetalle, mImpuestos, sFieldValue 
		OPEN DATABASE bdmaster
		SET DATABASE TO bdmaster
		SET DATE DMY
		? DBC()
		
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
        
        oResumenImpuestosFactura = THIS.ResumenImpuestosFactura(mImpuestos)
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