-- Query One Join Census, Housing and Spatial data then sort by highest population limit 100

select zhvi00."2000-01-31", zhvi00.City,zhvi00."State", census00.population, census00.gender, st_asgeojson(g.geom) as geom
from census00 
inner join zhvi00 on "zipcode" = "RegionName"
inner join geomzip00 g on "zcta5ce00" = "zipcode"
where zhvi00."2000-01-31" is not null and census00.minimum_age = 40 and census00.maximum_age = 44 
order by zhvi00."2000-01-31" desc 
limit 100


-- Query Two Find most populous areas for people 25 to 29 for year 2000 join to ZHVI to find town name
select census00.minimum_age,census00.maximum_age,census00.gender,census00.zipcode,census00.population as pop00, z.city,z."State"
from census00
join "ZHVI00" z 
on z."RegionID" = census00.zipcode 
where census00.population is not null and census00.minimum_age is not null and census00.maximum_age  is not null and census00.population > 0 and census00.minimum_age = 25 and census00.gender in ('male')
order by pop00 desc
limit 100



-- Query Three calc yearly increase from jan to december
select "ZHVI00".city, "ZHVI00"."State","ZHVI00"."2000-01-31" ,"ZHVI00"."2000-12-31" , (("ZHVI00"."2000-12-31"-"ZHVI00"."2000-01-31")/"ZHVI00"."2000-01-31")*100 as pctChange, geom
from "ZHVI00"
join geomzip00 g on g.zcta5ce00 = "ZHVI00"."RegionName" 
where "ZHVI00"."2000-01-31" is not null and "ZHVI00"."2000-12-31" is not null
order by pctChange desc
limit 100

-- Detroit Michigan is the top.. Wow


-- Query 4 do same for 2010
select "ZHVI10"."City" , "ZHVI10"."State","ZHVI10"."2010-01-31" ,"ZHVI10"."2010-12-31" , (("ZHVI10"."2010-12-31"-"ZHVI10"."2010-01-31")/"ZHVI10"."2010-01-31")*100 as pctChange
from "ZHVI10" 
where "ZHVI10"."2010-01-31" is not null and "ZHVI10"."2010-12-31" is not null
order by pctChange desc
limit 100

--again jackson ms wow

-- Query 5 now stitch together. 

-- geom makes this one realllyyy slowww
select "ZHVI10"."City" , "ZHVI10"."State", (("ZHVI00"."2000-12-31"-"ZHVI00"."2000-01-31")/"ZHVI00"."2000-01-31")*100 as pctChange00, (("ZHVI10"."2010-12-31"-"ZHVI10"."2010-01-31")/"ZHVI10"."2010-01-31")*100 as pctChange10, geom
from "ZHVI10"
join "ZHVI00" on "ZHVI00"."RegionID" = "ZHVI10"."RegionID" 
join geomzip10 g on g.zcta5ce10 = "ZHVI10"."RegionName" 
where "ZHVI00"."2000-01-31" is not null and "ZHVI00"."2000-12-31" is not null and "ZHVI10"."2010-01-31" is not null and "ZHVI10"."2010-12-31" is not null
order by pctChange10 desc
limit 100
-- Query 5 without geom
select "ZHVI10"."City" , "ZHVI10"."State", (("ZHVI00"."2000-12-31"-"ZHVI00"."2000-01-31")/"ZHVI00"."2000-01-31")*100 as pctChange00, (("ZHVI10"."2010-12-31"-"ZHVI10"."2010-01-31")/"ZHVI10"."2010-01-31")*100 as pctChange10
from "ZHVI10"
join "ZHVI00"
on "ZHVI00"."RegionID" = "ZHVI10"."RegionID" 
where "ZHVI00"."2000-01-31" is not null and "ZHVI00"."2000-12-31" is not null and "ZHVI10"."2010-01-31" is not null and "ZHVI10"."2010-12-31" is not null
order by pctChange10 desc
limit 100


-- Query 5 Stored procedure??