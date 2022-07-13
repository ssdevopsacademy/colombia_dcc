import os

texto_final=[]
archivo = open("conexion.log")
for line in archivo:
        texto_final.append(line)

i=1
for line in texto_final:
        file=open("log"+str(i)+".log","w")
        file.write(line)
        file.close()
        i+=1
