#Open .log file to read inside of it
file1= open("log/python.log", "w")

#Converts the .log file into data_file to be able to read it line by line to separate by connection
     with open("log/cron.log",'r') as data_file:

#Reads the file line by line
    for line in data_file: 
        
#Creates a txt file to save the line information       
    datos = open ('/var/log/line'+str(line)+'.txt''w') 

#If --tocheck-- is present in the line the algorithm will know to reparate the line
	if "--tocheck--" in line:
#Prepares file to save it and saves it with "write"
        datos = open ('/var/log/line'+str(line)+'.txt''a') 
        datos.write (line)
	else:
	    file1.write(line)
#Close the log file once it finishes the process
file1.close()


