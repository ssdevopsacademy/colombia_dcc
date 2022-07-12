#obtener el archivo
archivo = open("/Users/jhon.bedoya/logs/conection.log", "r")
count=1
log1 = open("/Users/jhon.bedoya/logs/log1.log", "w")
log2 = open("/Users/jhon.bedoya/logs/log2.log", "w")
while(True):
    #leer la siguiente linea
    linea = archivo.readline()
    #revisar si la linea no es null
    if not linea:
        break
    if count <14:
        log1.write(linea)
    else
        log2.write(linea)
    count=cout+1
#cerramos el archivo
archivo.close
log1.close
log2.close