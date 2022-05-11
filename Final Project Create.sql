CREATE TABLE "census00" (
  "id" SERIAL PRIMARY KEY,
  "population" int,
  "minimum_age" int,
  "maximum_age" int,
  "gender" VARCHAR(6),
  "zipcode" VARCHAR(5),
  "geo_id" VARCHAR(14)
);

CREATE TABLE "census10" (
  "id" SERIAL PRIMARY KEY,
  "population" int,
  "minimum_age" int,
  "maximum_age" int,
  "gender" VARCHAR(6),
  "zipcode" VARCHAR(5),
  "geo_id" VARCHAR(20)
);

CREATE TABLE "census20" (
  "id" SERIAL PRIMARY KEY,
  "population" int,
  "minimum_age" int,
  "maximum_age" int,
  "gender" VARCHAR(6),
  "zipcode" VARCHAR(5),
  "geo_id" VARCHAR(20)
);

CREATE TABLE "ZHVI00" (
  "id" SERIAL PRIMARY KEY,
  "RegionID" VARCHAR(5),
  "SizeRank" int,
  "RegionName" VARCHAR(2),
  "RegionType" VARCHAR(3),
  "StateName" VARCHAR(2),
  "State" VARCHAR(2),
  "City" VARCHAR(250),
  "Metro" VARCHAR(250),
  "CountyName" VARCHAR(250),
  "2000_01_31" int,
  "2000_02_29" int,
  "2000_03_31" int,
  "2000_04_30" int,
  "2000_05_31" int,
  "2000_06_30" int,
  "2000_07_31" int,
  "2000_08_31" int,
  "2000_09_30" int,
  "2000_10_31" int,
  "2000_11_30" int,
  "2000_12_31" int
);

CREATE TABLE "ZHVI10" (
  "id" SERIAL PRIMARY KEY,
  "RegionID" VARCHAR(5),
  "SizeRank" int,
  "RegionName" VARCHAR(2),
  "RegionType" VARCHAR(3),
  "StateName" VARCHAR(2),
  "State" VARCHAR(2),
  "City" VARCHAR(250),
  "Metro" VARCHAR(250),
  "CountyName" VARCHAR(250),
  "2010_01_31" int,
  "2010_02_29" int,
  "2010_03_31" int,
  "2010_04_30" int,
  "2010_05_31" int,
  "2010_06_30" int,
  "2010_07_31" int,
  "2010_08_31" int,
  "2010_09_30" int,
  "2010_10_31" int,
  "2010_11_30" int,
  "2010_12_31" int
);

CREATE TABLE "ZHVI20" (
  "id" SERIAL PRIMARY KEY,
  "RegionID" VARCHAR(5),
  "SizeRank" int,
  "RegionName" VARCHAR(2),
  "RegionType" VARCHAR(3),
  "StateName" VARCHAR(2),
  "State" VARCHAR(2),
  "City" VARCHAR(250),
  "Metro" VARCHAR(250),
  "CountyName" VARCHAR(250),
  "2020_01_31" int,
  "2020_02_29" int,
  "2020_03_31" int,
  "2020_04_30" int,
  "2020_05_31" int,
  "2020_06_30" int,
  "2020_07_31" int,
  "2020_08_31" int,
  "2020_09_30" int,
  "2020_10_31" int,
  "2020_11_30" int,
  "2020_12_31" int
);

