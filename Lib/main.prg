CLEAR ALL
CLEAR
SET PATH TO C:\Users\edwin\Documents\VisualFoxPro\vfp_api_facture;Db;JsonFox;Fox;Entities;Lib

#DEFINE rFoxJson "FoxJson\"
#DEFINE rFox "Fox\"
#DEFINE rModels "Entities\"

LOCAL sFieldValue

SET PROCEDURE TO "servicioprueba.prg"
SET PROCEDURE TO "replacestring.prg"

sFieldValue = ServicioPrueba()
sFieldValue = ReplaceString(sFieldValue)
? sFieldValue

_file = FCREATE("test.txt")
FWRITE(_file, sFieldValue)
FCLOSE(_file)