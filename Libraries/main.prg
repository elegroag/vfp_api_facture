#DEFINE TOPATH "C:\Users\maxed\OneDrive\Documentos\Visual FoxPro Projects\FoxFactureProyect\Libraries\" 
#DEFINE rFoxJson TOPATH + "FoxJson\"
#DEFINE rFox TOPATH + "Fox\"

SET DEFAULT TO rFox

LOCAL loJson, lcJsonString, lcJson

loJson = "Inicia el proyecto " + " OK"
? loJson

DO wwJsonSerializer

SET PROCEDURE TO TOPATH + "serviciofactura.prg"

PRIVATE sFieldValue = ''

sFieldValue = ServicioFactura()
? sFieldValue