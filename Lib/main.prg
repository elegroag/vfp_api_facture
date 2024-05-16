PARAMETERS marca, numero
SET DEFAULT TO C:\Users\edwin\Documents\VisualFoxPro\vfp_api_facture

PUBLIC PATHTRAB, PATHLIB, PATHDATOS, PATFOX AS CHARACTER
PATHTRAB="C:\Users\edwin\Documents\VisualFoxPro\vfp_api_facture"
PATHDATOS=PATHTRAB+"\datos\"
PATHLIB=PATHTRAB+"\Lib\"
PATFOX=PATHTRAB+"\Fox\"
SET DATE DMY 
SET CENTURY ON 
SET EXCLUSIVE OFF 
SET DELETED ON 
SET BELL OFF 
CLEAR

IF TYPE("marca") # "U"
	marca = 3		
ENDIF

IF TYPE("numero") # "U"
	numero = 11
ENDIF

? "Inicia el proceso de facturación"
? "MARCA: ",  marca
? "NUMERO: ", numero

DO ServicioPrueba
servicioPrueba = CREATEOBJECT('ServicioPrueba')
servicioPrueba.Principal(marca, numero)