# Recursos necesarios para el proyecto

1. **Instalación de JSONFox**:

    - Puedes encontrar el código fuente y la documentación en el repositorio de GitHub: [JSONFox en GitHub](https://github.com/Irwin1985/JSONFox).
    - Descarga el archivo ZIP del repositorio y extrae los archivos.
    - Agrega el archivo `JSONFox.prg` a tu proyecto en Visual FoxPro.
    - Si deseas acelerar el proceso de análisis léxico, puedes utilizar la DLL `JSONFoxHelper.dll` incorporada en C# que escanea los tokens más rápido. Para activar esta función, establece la propiedad `netScanner` en `.T.` antes de usar cualquier rutina de la clase JSON:

    ```sh
    _Screen.Json.netScanner = .T.
    _Screen.Json.Parse(myJSONString)
    ```
        La nueva DLL escanea un archivo JSON de 8 MB en solo 93 segundos, en comparación con los más de 15 minutos del escáner nativo⁴.

2. **Uso básico de JSONFox**:
    - Puedes utilizar JSONFox como una aplicación compilada:
        ```sh
        DO LocFile("JSONFox", "app")
        ```
    - Para analizar una cadena JSON en un objeto:
        ```sh
        MyObj = _Screen.Json.Parse('{"foo": "bar"}')
        ? MyObj.foo
        ```
    - También puedes analizar cualquier cadena JSON válida:
        ```sh
        ? _Screen.Json.Parse('"bar"') && bar
        ? _Screen.Json.Parse('true') && .T.
        ? _Screen.Json.Parse('false') && .F.
        ? _Screen.Json.Parse('null') && .NULL.
        ? _Screen.Json.Parse('1985') && 1985
        ```
    - Para convertir un cursor en una cadena JSON:
        ```sh
        CREATE CURSOR cGames (game C(25), launched I(4))
        INSERT INTO cGames VALUES ('Pac-Man', 1980)
        INSERT INTO cGames VALUES ('Super Mario Bros', 1985)
        ? _Screen.Json.CursorToJson('cGames')
        ```
    - También puedes convertir cualquier estructura de cursor en JSON:
        ```sh
        ? _Screen.Json.CursorStructure('cGames')
        ```


Vamos a realizar una consulta SQL y convertir los resultados en un objeto JSON utilizando **JSONFox** en **Visual FoxPro**. A continuación, te muestro cómo hacerlo paso a paso:

1. **Consulta SQL y almacenamiento en un cursor**:
   - Supongamos que tienes una tabla llamada `miTabla` con datos que deseas consultar. Ejecuta una consulta SQL para obtener los datos y almacénalos en un cursor. Por ejemplo:
     ```sh
     SELECT * FROM miTabla WHERE condicion INTO CURSOR cResultado
     ```

2. **Convertir el cursor en un objeto JSON**:
   - Utiliza **JSONFox** para convertir el cursor `cResultado` en una cadena JSON. Aquí tienes un ejemplo:
     ```sh
     LOCAL loJson, lcJsonString
     loJson = CREATEOBJECT("JsonFox.Json")
     lcJsonString = loJson.CursorToJson("cResultado")
     ```

3. **Resultado**:
   - `lcJsonString` ahora contiene la representación JSON de los datos en el cursor `cResultado`.

4. **Ejemplo completo**:
   Supongamos que tenemos una tabla `miTabla` con columnas `nombre` y `edad`. Ejecutamos la consulta:
   ```sh
   SELECT nombre, edad FROM miTabla WHERE edad > 25 INTO CURSOR cResultado
   ```

   Luego, convertimos el cursor en JSON:
   ```sh
   LOCAL loJson, lcJsonString
   loJson = CREATEOBJECT("JsonFox.Json")
   lcJsonString = loJson.CursorToJson("cResultado")
   ? lcJsonString
   ```

   El resultado será una cadena JSON con los datos de las personas mayores de 25 años en la tabla.


```sh
LOCAL miColeccion AS Collection
miColeccion = CREATEOBJECT("Collection")

# Agregar un nuevo objeto a la colección
miColeccion.Add(CREATEOBJECT("Empty"))

# Acceder al último objeto agregado y añadirle propiedades
miColeccion[miColeccion.Count].AddProperty("nombre", "Juan")
miColeccion[miColeccion.Count].AddProperty("edad", 30)

# Ahora, miColeccion[1] tiene las propiedades 'nombre' y 'edad'
? miColeccion[1].nombre && Devuelve "Juan"
? miColeccion[1].edad   && Devuelve 30
``` 
----

```sh
# Crear un nuevo objeto
LOCAL objNuevo AS Object

objNuevo = NEWOBJECT("Empty")
AddProperty(objNuevo,"nombre", "Pedro")
AddProperty(objNuevo, "edad", 35)

# Agregar el nuevo objeto al array 'cresultado'
objJson.cresultado.Add(objNuevo)

#  Ahora, objJson.cresultado tiene un objeto más
? objJson.cresultado[objJson.cresultado.Count].nombre 
? objJson.cresultado[objJson.cresultado.Count].edad

# ============================

# Parsear la cadena JSON en un objeto
LOCAL objJson AS Object
objJson = _Screen.Json.Parse('{"obj":[1,2,3]}')

# Definir una variable array y asignarle los valores del array 'obj'
LOCAL miArray[3]
miArray = objJson.obj

# Ahora, miArray contiene los valores [1,2,3]
? miArray[1] && Devuelve 1
? miArray[2] && Devuelve 2
? miArray[3] && Devuelve 3

```
----

+ En Visual FoxPro, un cursor es esencialmente una tabla temporal en memoria que puedes usar para manipular datos. Los métodos y funciones que puedes usar con un cursor son los mismos que usarías con cualquier otra tabla en Visual FoxPro. Aquí te dejo algunos ejemplos:

- `SELECT`: Cambia el área de trabajo activa al cursor especificado.
- `APPEND FROM`: Agrega registros desde otro cursor o tabla al cursor actual.
- `COPY TO`: Copia los registros del cursor actual a otro cursor o tabla.
- `DELETE`: Marca registros para eliminación.
- `RECALL`: Anula la eliminación de registros.
- `REPLACE`: Reemplaza los valores de los campos en los registros.
- `SCAN...ENDSCAN`: Recorre los registros del cursor.
- `SEEK`: Busca un registro en el cursor.

Además, puedes usar funciones como `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()` para realizar operaciones en los registros del cursor.

Espero que esto te sea de ayuda. 😊

-----


+ Claro, aquí te dejo algunos ejemplos de cómo podrías usar estos métodos con el cursor cResultado:


```sh
# Cambiar el área de trabajo activa al cursor cResultado
SELECT cResultado

# Agregar registros desde otro cursor o tabla al cursor cResultado
APPEND FROM otraTabla

# Copiar los registros del cursor cResultado a otro cursor o tabla
COPY TO otraTabla

# Marcar registros para eliminación
DELETE FOR edad > 30

# Anular la eliminación de registros
RECALL ALL

# Reemplazar los valores de los campos en los registros
REPLACE ALL nombre WITH "Nuevo nombre"

# Recorrer los registros del cursor
SCAN
    ? nombre, edad
ENDSCAN

# Buscar un registro en el cursor
SEEK "Juan" IN nombre
```

-----

+ Puedes usar la función RECCOUNT() para obtener el número de registros en el cursor cResultado y guardar ese valor en una variable size. Aquí te dejo un ejemplo de cómo podrías hacerlo:

```sh
# Cambiar el área de trabajo activa al cursor cResultado
SELECT cResultado

# Obtener el número de registros y guardarlo en la variable size
LOCAL size
size = RECCOUNT()

# Ahora, la variable size contiene el número de registros en cResultado
? size
```

---

### Para eliminar un cursor

+ Para eliminar un cursor en Visual FoxPro, puedes usar el comando USE con la opción IN seguido del nombre del cursor. Aquí te dejo un ejemplo de cómo podrías hacerlo:

```sh

# Cambiar el área de trabajo activa al cursor cResultado
SELECT cResultado

# Cerrar el cursor
USE IN cResultado

```

---

**Crear la tabla miTabla**

Esta tabla nos permite hacer una prueba del uso de cursores 


```sh
SET DEFAULT TO C:\Users\maxed\Videos\FoxPro\JSONFox\src\
DO C:\Users\maxed\Videos\FoxPro\JSONFox\src\main.prg


CREATE TABLE miTabla (nombre C(50), edad I)
INSERT INTO miTabla VALUES ("Juan", 28)
INSERT INTO miTabla VALUES ("María", 35)
INSERT INTO miTabla VALUES ("Pedro", 22)
INSERT INTO miTabla VALUES ("Ana", 30)
INSERT INTO miTabla VALUES ("Luis", 40)
INSERT INTO miTabla VALUES ("Laura", 27)
INSERT INTO miTabla VALUES ("Carlos", 33)
INSERT INTO miTabla VALUES ("Sofía", 29)
INSERT INTO miTabla VALUES ("Andrés", 25)
INSERT INTO miTabla VALUES ("Valentina", 31)

SELECT nombre, edad FROM miTabla WHERE edad > 25 INTO CURSOR cResultado
LOCAL strJson, objJson

strJson = _Screen.Json.CursorToJson('cResultado')
? strJson
objJson = _Screen.Json.Parse(strJson)
? objJson.cresultado[1].nombre

##pasar object a string
strJson = _Screen.Json.stringify(objJson)
?strJson


SELECT nombre, edad FROM miTabla WHERE edad > 25 INTO CURSOR cResultado readwrite

MESSAGEBOX("No se encontró el Id buscado")
```

* Crear la tabla cResultado (simulando una consulta SQL)
```sh

SELECT nombre, edad FROM miTabla WHERE edad > 25 INTO CURSOR cResultado 

objNuevo = newobject("EMPTY")
ADDPROPERTY(objNuevo,"nombre", "Pedro")
ADDPROPERTY(objNuevo, "edad", 35)

objJson.cresultado.Add(objNuevo)
```

```sh
CREATE CURSOR cResultado (nombre C(50), edad I)

## Llenarlo (una manera que funcionaria en cualquier version

SELECT miTabla 
GO TOP
DO WHILE !EOF()
INSERT INTO cResultado (nombre, edad);
VALUES ( miTabla.nombre, miTabla.edad)

SELECT miTabla
SKIP
ENDDO
```

### Para insertar un nuevo registro

+ Para insertar un nuevo registro en el cursor cResultado, puedes usar el comando APPEND BLANK para agregar un nuevo registro vacío y luego usar el comando REPLACE para asignar valores a los campos de ese registro. Aquí te dejo un ejemplo de cómo podrías hacerlo:

```sh

# Cambiar el área de trabajo activa al cursor cResultado
SELECT cResultado

# Agregar un nuevo registro vacío
APPEND BLANK

# Asignar valores a los campos del nuevo registro
REPLACE nombre WITH "Nuevo nombre", edad WITH 30

# Ahora, cResultado tiene un registro más con nombre "Nuevo nombre" y edad 30

```



### CONDICIONALES
```sh
LOCAL lnNumero
lnNumero = 10

IF lnNumero > 0
    ? "El número es positivo."
ELSEIF lnNumero < 0
    ? "El número es negativo."
ELSE
    ? "El número es cero."
ENDIF

```

### ITERATIVOS

En Visual FoxPro 9, hay varias estructuras iterativas que puedes usar, incluyendo `FOR ... ENDFOR`, `DO WHILE ... ENDDO`, `SCAN ... ENDSCAN` y `LOOP ... ENDLOOP`. Aquí dejo un ejemplo:

1. **FOR ... ENDFOR**

```sh
FOR i = 1 TO 5
    ? "Iteración número: ", i
ENDFOR
```

2. **DO WHILE ... ENDDO**

```sh
LOCAL lnContador
lnContador = 1
DO WHILE lnContador <= 5
    ? "Iteración número: ", lnContador
    lnContador = lnContador + 1
ENDDO
```

3. **SCAN ... ENDSCAN**

```sh
* Supongamos que tienes una tabla llamada 'miTabla' con un campo llamado 'miCampo'

USE miTabla
SCAN
    ? "Valor de miCampo: ", miCampo
ENDSCAN
```

4. **LOOP ... ENDLOOP**

```sh
LOCAL lnContador
lnContador = 1
DO
    ? "Iteración número: ", lnContador
    lnContador = lnContador + 1
    IF lnContador > 5
        EXIT
    ENDIF
ENDLOOP
```

Espero que estos ejemplos te ayuden a entender cómo usar las estructuras iterativas en Visual FoxPro 9. Si tienes más preguntas o necesitas más ayuda, no dudes en preguntar. ¡Estoy aquí para ayudar! 😊

--------

### Funciones 

+ Aquí un ejemplo de cómo puedes definir y usar métodos y funciones en Visual FoxPro 9


```sh
# Definición de una clase con un método
DEFINE CLASS MiClase AS Custom
    PROCEDURE MiMetodo
        ? "Este es un método de MiClase."
    ENDPROC
ENDDEFINE

# Creación de una instancia de la clase y uso del método
oMiObjeto = CREATEOBJECT("MiClase")
oMiObjeto.MiMetodo()
```

```sh

# Definición de una función
FUNCTION MiFuncion
    LPARAMETERS lcMensaje
    ? "Mensaje: ", lcMensaje
    RETURN .T.
ENDFUNC

# Uso de la función
llResultado = MiFuncion("Este es un mensaje.")
```

En este código, primero se define una clase `MiClase` con un método `MiMetodo`. Luego, se crea una instancia de `MiClase` y se llama a `MiMetodo`.

Después, se define una función `MiFuncion` que toma un parámetro `lcMensaje` y muestra un mensaje. Finalmente, se llama a `MiFuncion` con un mensaje como argumento.

```sh 

FUNCTION CreateObjetoJson
    loCustomer = CREATEOBJECT("Empty")
    ADDPROPERTY(loCustomer,"lastname", "Strahl")
    ADDPROPERTY(loCustomer,"firstname", "Rick")
    ADDPROPERTY(loCustomer,"company", "West Wind")

    *** Add a nested object
    loAddress = CREATEOBJECT("EMPTY")  
    ADDPROPERTY(loAddress, "street", "101 Nowhere Lane")
    ADDPROPERTY(loAddress, "city", "Anytown")
    ADDPROPERTY(loAddress, "zip", "11111")

    ADDPROPERTY(loCustomer, "address", loAddress)  && Add as child to ^customer

    loSer = CREATEOBJECT("wwJsonSerializer")
    loSer.PropertyNameOverrides = "lastName,firstName"  && exact casing
    res = loSer.Serialize(loCustomer)
    ?res 
    RETURN res
ENDFUNC

lcJson = CreateObjetoJson();
?lcJson

# Supongamos que tienes tres cursores: cursorCabecera, cursorItems y cursorCliente
# Estos cursores se llenan después de realizar las consultas SQL correspondientes

Do rModels + "Cabecera.prg"
Do rModels + "ItemFactura.prg"
Do rModels + "Cliente.prg"
Do rModels + "Factura.prg"

SELECT * FROM factura WHERE id=1 INTO CURSOR cursorFactura

SELECT * FROM facturador WHERE id=1 INTO CURSOR cursorFacturador

SELECT * FROM items_factura WHERE factura_id=1 INTO CURSOR cursorItems

SELECT * FROM cliente WHERE factura_id=1 INTO CURSOR cursorCliente

SELECT cursorFactura
SCAN
    oFactura = CREATEOBJECT("Factura")
    oFactura.oCabecera.cFacturador = cursorFactura.cFacturador
    oFactura.oCabecera.dFecha = cursorFactura.dFecha
    oFactura.oCabecera.nNumero = cursorFactura.nNumero

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
    oFactura.oCliente.cNombre = cursorCliente.cNombre
    oFactura.oCliente.cDireccion = cursorCliente.cDireccion
    oFactura.oCliente.cTelefono = cursorCliente.cTelefono

    * Aquí puedes hacer lo que necesites con el objeto oFactura
    * Por ejemplo, puedes imprimir la factura, guardarla en una base de datos, etc.
ENDSCAN

oJSON = CREATEOBJECT("wwJsonSerializer")
cJson = oJSON.Serialize(oFactura)
?cJson
```