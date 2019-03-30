# Without main() and test() we get a memory leak! because of temp. lists.

load "sqlitelib.ring"

func main
	o1 = new mytest
	while True
	o1.test()
	? "After close"
	end
	

class mytest 

	aResult = []

func test 
	oSQLite = sqlite_init()
	? oSQLIte 
	sqlite_open(oSQLite,"b:\pwct2\files\performance\large5000.pwct")
	? "before"
	aResult = sqlite_execute(oSQLite,"select * from stepstree;")
	? "after"
	? sqlite_close(oSQLite)
	
