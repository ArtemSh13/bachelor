import sqlite3

conn = sqlite3.connect('AdmiReps.db')
cursor = conn.cursor()
arr = cursor.fetchall()

for i in arr:
    print(i)