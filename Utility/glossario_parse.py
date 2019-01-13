# coding=utf-8
#16/03/2018
#breve script che si occupa di recuperare tutti i termini di glossario da un 
#documento LaTeX del gruppo SonsOfSwe e, li scrive in un file.

import string
import re
import glob
import os

def parse(folder_path, name_file_terms,out_file):
	#https://stackoverflow.com/questions/18262293/how-to-open-every-file-in-a-folder

	for filename in glob.glob(os.path.join(folder_path, '*.tex')):
		#print filename
		with open(filename) as f:
			content = f.readlines()
			for line in content:
				res = re.findall(r'{[a-z0-9A-Z\s\'àòèéù\\\+\-\*/]*[}\s?\^&%]*\\ped{G}', line)
				#print(res)
				for x in res:
					mod = re.sub(r'^{', '', x)	#cancella { all'inizio
					mod = re.sub(r'}*\\ped{G}$', '', mod) #}ped{G}			
					out_file.write( mod + "\n" )
			f.close()
	


folder_path = raw_input("inserire il nome della cartella che si vuole parsare: ")
name_file_terms = raw_input("inserire il nome che si vuole dare al file generato: ")
out_file = open(name_file_terms + ".txt","w")
for root, dirs, files in os.walk(folder_path):	
	for dirx in dirs:
		print root+'/'+dirx+'/';
		parse(root+'/'+dirx+'/', name_file_terms,out_file)
print("File generato! Buon lavoro col glossario :D\n")
out_file.close()
