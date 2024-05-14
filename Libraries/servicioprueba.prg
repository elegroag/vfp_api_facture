
FUNCTION ServicioPrueba
    DO wwJsonSerializer
    
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
    RETURN res
ENDFUNC