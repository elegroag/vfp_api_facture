#INCLUDE foxpro.h

DEFINE CLASS FacturadorEntity AS Custom
    Solicitud = .NULL.
    DocumentoEquivalente = .NULL.

    PROCEDURE Init
    	? "Inicializa el Object Facturador" 
        THIS.Solicitud = NEWOBJECT("EMPTY")
        THIS.DocumentoEquivalente = NEWOBJECT("EMPTY")
    ENDPROC

    PROCEDURE setNonceSolicitud
        LPARAMETERS valor
        AddProperty(THIS.Solicitud, "Nonce", valor)
    ENDPROC
    
    PROCEDURE setSuscriptorSolicitud
        LPARAMETERS suscriptor
        AddProperty(THIS.Solicitud, "Suscriptor", suscriptor)
    ENDPROC

    PROCEDURE addDocumentoEquivalente
        LPARAMETERS oClave, objeto
        IF THIS.DocumentoEquivalente <> .NULL.
            AddProperty(THIS.DocumentoEquivalente, oClave, objeto)
        ENDIF
    ENDPROC

ENDDEFINE