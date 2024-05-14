

FUNCTION ServicioFactura
    DO wwJsonSerializer

    * Supongamos que tienes tres cursores: cursorCabecera, cursorItems y cursorCliente
    * Estos cursores se llenan después de realizar las consultas SQL correspondientes
    DO rModels + "Cabecera.prg"
    DO rModels + "ItemFactura.prg"
    DO rModels + "Cliente.prg"
    DO rModels + "Factura.prg"

    SELECT * FROM factura WHERE id=1 INTO CURSOR cursorFactura

    SELECT * FROM facturador WHERE id=1 INTO CURSOR cursorFacturador

    SELECT * FROM items_factura WHERE factura_id=1 INTO CURSOR cursorItems

    SELECT * FROM cliente WHERE factura_id=1 INTO CURSOR cursorCliente

    oFactura = CREATEOBJECT("Factura")

    SELECT cursorFactura
    SCAN

        oCabecera = CREATEOBJECT("Cabecera")
        oCabecera.cFacturador = cursorFactura.cFacturador
        oCabecera.dFecha = cursorFactura.dFecha
        oCabecera.nNumero = cursorFactura.nNumero
        oFactura.SetCabecera(oCabecera)

        SELECT cursorItems
        SCAN
            oItem = CREATEOBJECT("Item")
            oItem.cDescripcion = cursorItems.cDescripcion
            oItem.nCantidad = cursorItems.nCantidad
            oItem.nPrecio = cursorItems.nPrecio
            oFactura.AgregarItem(oItem)
        ENDSCAN

        SELECT cursorCliente
        GO TOP
        oCliente = CREATEOBJECT("Cliente")
        oCliente.cNombre = cursorCliente.cNombre
        oCliente.cDireccion = cursorCliente.cDireccion
        oCliente.cTelefono = cursorCliente.cTelefono
        oFactura.SetCliente(oCliente)
    ENDSCAN

    oJSON = CREATEOBJECT("wwJsonSerializer")
    cJson = oJSON.Serialize(oFactura)
    ?cJson
    RETURN cJson
ENDFUNC