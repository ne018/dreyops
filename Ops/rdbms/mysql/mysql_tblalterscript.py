#author: dr3y

import mysql.connector

conn = mysql.connector.connect(
	host = "yourhost",
	user = "youruser",
	passwd = "yourpass",
	db = "yourdb"
)

write_cursor=conn.cursor()
write_cursor.execute('show tables')
tbls=write_cursor.fetchall()

for a in tbls:
	sql = 'show columns from '+a[0]
	write_cursor.execute(sql)
	clms=write_cursor.fetchall()
  
	for b in clms:
    #except primary key field
		if b[3] != "PRI":
			altersql = "ALTER TABLE "+a[0]+" MODIFY "+b[0]+" "+b[1]+" NULL"
			print(altersql)
			write_cursor.execute(altersql)
			print('done! -> next in progress..')
