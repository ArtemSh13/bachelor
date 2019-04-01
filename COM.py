import win32com.client
Excel = win32com.client.Dispatch("Excel.Application")
Excel.Visible = 1
wb = Excel.Workbooks.Open(u'C:\\Users\\Артем\\Desktop\\Расписание BPC.xlsx')
sheet = wb.ActiveSheet
val = sheet.Cells(1,1).value
print(val)
vals = [r[0].value for r in sheet.Range("A1:A2")]
print(vals)
sheet.Cells(3,1).value = 'A3Value'
wb.Save()
sheet2 = wb.Worksheets(u'Лист2').Range('A1:A2')
vals = [r[0].value for r in sheet2]
print(vals)
wb.Close()
Excel.Quit()
input('Press enter to continue')
