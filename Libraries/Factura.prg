
DEFINE CLASS Factura AS Custom
    PRIVATE oCabecera = .NULL.
    PRIVATE aItems = .NULL.
    PRIVATE oCliente = .NULL.

    PROCEDURE Init
        THIS.oCabecera = CREATEOBJECT("Cabecera")
        THIS.aItems = CREATEOBJECT("Collection")
        THIS.oCliente = CREATEOBJECT("Cliente")
    ENDPROC

    PROCEDURE AgregarItem
        LPARAMETERS oItem
        THIS.aItems.Add(oItem)
    ENDPROC

    PROCEDURE SetCliente
        LPARAMETERS _oCliente
        THIS.oCliente = _oCliente
    ENDPROC

    PROCEDURE SetCabecera
        LPARAMETERS _oCabecera
        THIS.oCabecera = _oCabecera
    ENDPROC
ENDDEFINE