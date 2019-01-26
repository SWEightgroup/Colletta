import gspread
import os
from oauth2client.service_account import ServiceAccountCredentials

scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('/home/sebas/Scrivania/Swe/Colletta/Utility/MAGIC/MAGIC-SWE-1ac7fd374262.json',scope)
client = gspread.authorize(creds)

sheet = client.open('Gulpease Daily').sheet1

__location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))
f = open(os.path.join(__location__, 'Gulpease.txt'))

lines = [line.rstrip('\n') for line in f]
for i in range(1,len(lines)):
    lines[i] = float(lines[i])


sheet.append_row(lines)

#gulp = sheet.get_all_records()
#print gulp
