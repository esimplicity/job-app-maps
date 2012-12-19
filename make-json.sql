SELECT 
	CONCAT('["', Zipcode, '",', Latitude, ',', Longitude, '],') 
FROM ZipCode 
WHERE Zipcode LIKE '850%';