load "sqlitelib.ring"

oSQLite = sqlite_init()

? oSQLIte 
sqlite_open(oSQLite,"b:\pwct2\files\performance\large5000.pwct")
? "before"
input(2)
sqlite_execute(oSQLite,"PRAGMA locking_mode = EXCLUSIVE;")
sqlite_execute(oSQLite,"PRAGMA cache_size=8192;")
sqlite_execute(oSQLite,"PRAGMA temp_store = FILE;")
aResult = sqlite_execute(oSQLite,"select * from stepstree;")
? "after"
input(2) 
aResult = NULL
? "after DELETE "
input(2) 
? sqlite_close(oSQLite)
? "After close"
input(2)

