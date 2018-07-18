# Without main() and test() we get a memory leak! because of temp. lists.

load "sqlitelib.ring"

func main
	test()
	? "After close"
	input(2)

func test 
	oSQLite = sqlite_init()
	? oSQLIte 
	sqlite_open(oSQLite,"b:\pwct2\files\performance\large5000.pwct")
	? "before"
	input(2)
	aResult = sqlite_execute(oSQLite,"select * from stepstree;")
	? "after"
	input(2) 
	aResult = NULL
	? "after DELETE "
	input(2) 
	callgc()
	? "after callgc()"
	input(2)
	? sqlite_close(oSQLite)
	
