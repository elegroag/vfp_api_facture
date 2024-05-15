#INCLUDE foxpro.h

DEFINE CLASS CabeceraEntity AS Custom
    DoceManejaPeriodos = 0
    DoceConsecutivo = ""
    DocePrefijo = ""
    DoceFecha = ""
    DoceCantidadItems = 0
    DoceLineasWhatsApp = ""
    AmbdCodigo = 0
    TipoCodigo = ""
    DoetCodigo = ""
    MoneCodigo = "" 
    RefvNumero = "" 
    DoceReferenciaPago = "" 
    EnviarSetPruebas = ""

    PROCEDURE MapperCursor
        LPARAMETERS _cursor
        ? "Inicializa la cabecera"
        THIS.DoceManejaPeriodos = _cursor.docemanejaperiodos
        THIS.DoceConsecutivo = _cursor.doceconsecutivo
        THIS.DocePrefijo = _cursor.doceprefijo
        THIS.DoceFecha = _cursor.docefecha    
        THIS.DoceCantidadItems = _cursor.docecantidaditems
        THIS.DoceLineasWhatsApp = _cursor.docelineaswhatsapp
        THIS.AmbdCodigo = _cursor.ambdcodigo
        THIS.TipoCodigo = _cursor.tipocodigo
        THIS.DoetCodigo = _cursor.doetcodigo
        THIS.MoneCodigo = _cursor.monecodigo
        THIS.RefvNumero = _cursor.refvnumero
        THIS.DoceReferenciaPago = _cursor.docereferenciapago
        THIS.EnviarSetPruebas = _cursor.enviarsetpruebas
    ENDPROC

ENDDEFINE