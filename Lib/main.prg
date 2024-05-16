CLEAR ALL
CLEAR
SET PATH TO C:\Users\edwin\Documents\VisualFoxPro\vfp_api_facture\;datos\;JsonFox\;Fox\;Lib\

DO ServicioPrueba

marca = 3
numero = 11
servicioPrueba = CREATEOBJECT('ServicioPrueba')
servicioPrueba.Principal(marca, numero)