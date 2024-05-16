PARAMETERS marca, numero
SET DEFAULT TO C:\Users\edwin\Documents\VisualFoxPro\vfp_api_facture
SET PATH TO C:\Users\edwin\Documents\VisualFoxPro\vfp_api_facture\;datos\;Fox\;Lib\

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