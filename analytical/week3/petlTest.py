import petl as etl

tbl1 =  etl.fromcsv("petl.csv")
tbl2 = etl.convert(tbl1, "a", "upper")
tbl3 = etl.convert(tbl2, "b", int)
tbl4 = etl.convert(tbl3, "c", float)
# assign boolean value to a new column d
tbl5 = etl.addfield(tbl4, "d", lambda row: row.b == row.c)
print(tbl1.look)
print(tbl5.look)
