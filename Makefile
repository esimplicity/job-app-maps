DBNAME = map_test
DBUSER = root
DBPASS = 

JS = data.js
MYSQL = mysql -u $(DBUSER) --password='$(DBPASS)'
MYDB = $(MYSQL) $(DBNAME)

CSV = free-zipcode-database-Primary.csv
URL = http://federalgovernmentzipcodes.us/$(CSV)

all: load-db js

$(CSV):
	wget $(URL)

load-db: $(CSV)
	$(MYSQL) -e 'CREATE a DATABASE IF NOT EXISTS $(DBNAME)'
	$(MYDB) --enable-local-infile < load-zips.sql 

js:
	echo -n "var data = [" > $(JS) 
	$(MYDB) -B < make-json.sql | tail -n +2 | perl -pe 's/\n//g' | sed 's/,$$/];/' >> $(JS)
