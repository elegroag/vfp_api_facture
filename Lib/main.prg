CLEAR ALL
CLEAR
SET PATH TO C:\Users\edwin\Documents\VisualFoxPro\vfp_api_facture\;datos\;JsonFox\;Fox\;Entities\;Lib\

marca = 3
numero = 11
LOCAL sFieldValue

SET PROCEDURE TO "servicioprueba.prg"
SET PROCEDURE TO "replacestring.prg"

sFieldValue = ServicioPrueba(marca, numero)
sFieldValue = ReplaceString(sFieldValue)
? sFieldValue

_file = FCREATE("test.txt")
FWRITE(_file, sFieldValue)
FCLOSE(_file)	