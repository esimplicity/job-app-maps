DROP TABLE IF EXISTS ZipCode;
CREATE TABLE ZipCode (
  Zipcode char(5) NOT NULL,
  ZipCodeType varchar(100) NOT NULL,
  City varchar(100) NOT NULL,
  State char(2) NOT NULL,
  LocationType enum('Primary','Acceptable','Not Applicable') NOT NULL,
  Latitude double NOT NULL,
  Longitude double NOT NULL,
  Location varchar(200) NOT NULL,
  Decommissioned enum('true','false') NOT NULL,
  TaxReturnsField int(11) NOT NULL,
  EstimatedPopulation int(11) NOT NULL,
  TotalWages int(11) NOT NULL
  PRIMARY KEY (Zipcode),
  KEY Location (Latitude,Longitude)
) ENGINE=MyISAM;

LOAD DATA LOCAL INFILE 'free-zipcode-database-Primary.csv' 
INTO ZipCode COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

