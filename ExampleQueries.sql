-- Query One Join Census, Housing and Spatial data then sort by highest population limit 100

select zhvi00."2000-01-31", zhvi00.City,zhvi00."State", census00.population, census00.gender, st_asgeojson(g.geom) as geom
from census00 
inner join zhvi00 on "zipcode" = "RegionName"
inner join geomzip00 g on "zcta5ce00" = "zipcode"
where zhvi00."2000-01-31" is not null and census00.minimum_age = 40 and census00.maximum_age = 44 
order by zhvi00."2000-01-31" desc 
limit 100


-- Query Two calc pop increase from 2000 to 2010
select census00.minimum_age,census00.maximum_age,census00.zipcode,census00.population as pop00, census10.population as pop10, ((census00.population-census10.population)/census00.population)*100 as PctPopChange
from census00, census10
join census00 c 
on c.zipcode = census10.zipcode and c.minimum_age = census10.minimum_age 
where census00.zipcode = '01760' and census00.population is not null and census10.population is not null and census00.population > 0
limit 100
-- ???join????
-- nope div by 0 likely need to convert to a stored procedure and integrate null handling or clean data better 
-- done 


-- Query Three calc yearly increase from jan to december
select zhvi00.city, zhvi00."State",zhvi00."2000-01-31" ,zhvi00."2000-12-31" , ((zhvi00."2000-12-31"-zhvi00."2000-01-31")/zhvi00."2000-01-31")*100 as pctChange
from zhvi00
where zhvi00."2000-01-31" is not null and zhvi00."2000-12-31" is not null
order by pctChange desc
limit 100

-- Detroit Michigan is the top.. Wow


-- Query 3a do same for 2010
select "ZHVI10"."City" , "ZHVI10"."State","ZHVI10"."2010-01-31" ,"ZHVI10"."2010-12-31" , (("ZHVI10"."2010-12-31"-"ZHVI10"."2010-01-31")/"ZHVI10"."2010-01-31")*100 as pctChange
from "ZHVI10" 
where "ZHVI10"."2010-01-31" is not null and "ZHVI10"."2010-12-31" is not null
order by pctChange desc
limit 100

--again jackson ms wow

-- Query 4 now stitch together. 

-- geom makes this one realllyyy slowww
select "ZHVI10"."City" , "ZHVI10"."State", (("ZHVI00"."2000-12-31"-"ZHVI00"."2000-01-31")/"ZHVI00"."2000-01-31")*100 as pctChange00, (("ZHVI10"."2010-12-31"-"ZHVI10"."2010-01-31")/"ZHVI10"."2010-01-31")*100 as pctChange10, geom
from "geomzip10","ZHVI10"
join "ZHVI00"
on "ZHVI00"."RegionID" = "ZHVI10"."RegionID" 
where "ZHVI00"."2000-01-31" is not null and "ZHVI00"."2000-12-31" is not null and "ZHVI10"."2010-01-31" is not null and "ZHVI10"."2010-12-31" is not null
order by pctChange10 desc
limit 100

select "ZHVI10"."City" , "ZHVI10"."State", (("ZHVI00"."2000-12-31"-"ZHVI00"."2000-01-31")/"ZHVI00"."2000-01-31")*100 as pctChange00, (("ZHVI10"."2010-12-31"-"ZHVI10"."2010-01-31")/"ZHVI10"."2010-01-31")*100 as pctChange10
from "ZHVI10"
join "ZHVI00"
on "ZHVI00"."RegionID" = "ZHVI10"."RegionID" 
where "ZHVI00"."2000-01-31" is not null and "ZHVI00"."2000-12-31" is not null and "ZHVI10"."2010-01-31" is not null and "ZHVI10"."2010-12-31" is not null
order by pctChange10 desc
limit 100

create view test as 
	select "ZHVI10"."City" , "ZHVI10"."State", (("ZHVI00"."2000-12-31"-"ZHVI00"."2000-01-31")/"ZHVI00"."2000-01-31")*100 as pctChange00, (("ZHVI10"."2010-12-31"-"ZHVI10"."2010-01-31")/"ZHVI10"."2010-01-31")*100 as pctChange10, geom
	from "geomzip10","ZHVI10"
	join "ZHVI00"
	on "ZHVI00"."RegionID" = "ZHVI10"."RegionID" 
	where "ZHVI00"."2000-01-31" is not null and "ZHVI00"."2000-12-31" is not null and "ZHVI10"."2010-01-31" is not null and "ZHVI10"."2010-12-31" is not null
	order by pctChange10 desc
	
select * from test limit 100




-- Query 5 Stored procedure??