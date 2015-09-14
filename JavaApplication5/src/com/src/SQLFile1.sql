truncate table bizbystate;
ALTER TABLE bizbystate AUTO_INCREMENT = 1000;

LOAD DATA INFILE 'C:\\myfiles\\ps\\documents\\USA Buisness DB\\extracted\\Buisness - by State DB\\NJ.CSV' INTO TABLE bizbystate
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES;

truncate table bizbystate_email;
ALTER TABLE bizbystate_email AUTO_INCREMENT = 1000;

truncate table bizcategory;
ALTER TABLE bizbystate_email AUTO_INCREMENT = 1000;

SELECT * FROM wp_posts w ;
delete FROM wp_posts where post_title = 'Auto Draft' ;

delete FROM wp_postmeta where
  post_id <> 2 and
  post_id in (SELECT post_id FROM wp_posts w where post_type = 'attachment') order by post_id ;

select * from bizbystate;

LOAD DATA INFILE 'C:\\myfiles\\ps\\documents\\USA Buisness DB\\extracted\\Buisness - by State DB\\NJ.CSV' INTO TABLE bizbystate
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES;

truncate table wp_terms;
ALTER TABLE wp_terms AUTO_INCREMENT = 999;

select * from bizbystate where left(STREET_ADDRESS_ZIP,5) not in ( SELECT zip FROM zcta_detail);
select * from bizbystate where STREET_ADDRESS_CITY not in ( SELECT CITY FROM zcta_detail) ORDER BY STREET_ADDRESS_CITY ;

select STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5) from bizbystate where STREET_ADDRESS_CITY not in
( SELECT CITY FROM zcta_detail where state = 'NJ')
group by STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5) ORDER BY STREET_ADDRESS_CITY;

select STREET_ADDRESS_CITY from bizbystate where STREET_ADDRESS_CITY not in ( SELECT CITY FROM zcta_header)
group by STREET_ADDRESS_CITY ORDER BY STREET_ADDRESS_CITY;

select distinct STREET_ADDRESS_city, left(STREET_ADDRESS_ZIP,5), count(STREET_ADDRESS_ZIP)  from bizbystate
group by STREET_ADDRESS_CITY, left(STREET_ADDRESS_ZIP,5) order by 1 ;

select distinct STREET_ADDRESS_city , count(STREET_ADDRESS_city)  from bizbystate group by STREET_ADDRESS_city order by 1 ;


select * from bizbystate  where left(STREET_ADDRESS_ZIP,5) in ( SELECT zip FROM zcta_detail);

delete FROM zcta_detail WHERE STATE is null ;
SELECT * FROM zcta_detail z where state = 'NJ' order by state,CITY ;
SELECT * FROM zcta_detail z where state = 'NJ' order by state,zip ;

SELECT distinct city FROM zcta_detail z where state = 'NJ' order by state,CITY ;
SELECT * FROM zcta_detail z where state = 'NJ' order by state,ZIP ;


SELECT distinct city FROM bizbystate where city not in( SELECT city FROM zcta_detail where state = 'NJ' ) order by city;

SELECT city FROM zcta_detail where state = 'NJ' ;
SELECT count(*) FROM bizbystate ;
SELECT * FROM wp_posts w order by 1;
select distinct city, zip_code, count(zip_code)  from bizbystate where length(zip_code) = 4 group by city, zip_code order by 1 ;
select * from bizbystate where length(zip_code) = 4 and zip_code = 8201 order by 1 ;
select concat(0,zip_code) from bizbystate where length(zip_code) = 4 and zip_code = 8201 order by 1 ;
select distinct city, zip_code from bizbystate where length(zip_code) = 4 and zip_code = 8201 order by 1 ;
select distinct city, zip_code, count(zip_code)  from bizbystate where length(zip_code) = 4 group by city, zip_code order by 1 ;
SELECT * FROM wp_terms w;
SELECT * FROM wp_countries w;

truncate table wp_multicity ;

select zh.* from wp_multicity mc, zcta_header zh where zh.city = mc.cityname;

SELECT * FROM wp_multicity w order by city_id;

SELECT * FROM wp_zones w where w.country_id = 223 and zone_code = 'NJ';

SELECT * FROM zcta_header z where state = 'NJ';
SELECT * FROM zcta_detail z where state = 'NJ' order by city,zip ;

SELECT * FROM wp_posts w;
SELECT * FROM wp_postmeta w;
SELECT * FROM wp_postmeta w where post_id = 2;
SELECT * FROM wp_terms w;
SELECT * FROM wp_term_taxonomy w;
SELECT * FROM wp_term_relationships w ;
delete FROM wp_term_relationships where object_id = 2;


SELECT * FROM wp_posts w where post_type = 'place';

SELECT b.rownum, b.company_name,
        concat(b.STREET_ADDRESS,',',b.STREET_ADDRESS_CITY,',',b.STATE,',',left(b.STREET_ADDRESS_ZIP,5)) as 'address',
        zh.city_id, zd.longitude,zd.latitude
  FROM   zcta_header zh,
         zcta_detail zd,
         bizbystate b
    where zh.city = b.STREET_ADDRESS_CITY and
    left(b.STREET_ADDRESS_ZIP,5) = zd.zip order by 3;


select distinct zx.STREET_ADDRESS_CITY,left(zx.STREET_ADDRESS_ZIP,5) as 'zip' from bizbystate zx where zx.rownum not in(
SELECT b.rownum
  FROM zcta_header zh, zcta_detail zd, bizbystate b
  where zh.city = zd.city and
  left(b.STREET_ADDRESS_ZIP,5) = zd.zip) order by city;

--------------------------------------------------------------------------
SELECT * FROM wp_postmeta w where post_id = 2;
SELECT * FROM wp_postmeta w order by 2;

Insert into wp_postmeta (post_id,meta_key,meta_value)
SELECT b.rownum,'geo_address' as meta_key,
concat(b.STREET_ADDRESS,',',b.STREET_ADDRESS_CITY,',',b.STATE,',',left(b.STREET_ADDRESS_ZIP,5)) as meta_value
  FROM   zcta_header zh,
         zcta_detail zd,
         bizbystate b
    where zh.city = b.STREET_ADDRESS_CITY and
    left(b.STREET_ADDRESS_ZIP,5) = zd.zip order by 3;


SELECT b.rownum, b.company_name,
        concat(b.STREET_ADDRESS,',',b.STREET_ADDRESS_CITY,',',b.STATE,',',left(b.STREET_ADDRESS_ZIP,5)) as 'address',
        zh.city_id, zd.longitude,zd.latitude
  FROM   zcta_header zh,
         zcta_detail zd,
         bizbystate b
    where zh.city = b.STREET_ADDRESS_CITY and
    left(b.STREET_ADDRESS_ZIP,5) = zd.zip order by 3;

SELECT b.rownum,'geo_address' as meta_key,
concat(b.STREET_ADDRESS,',',b.STREET_ADDRESS_CITY,',',b.STATE,',',left(b.STREET_ADDRESS_ZIP,5)) as meta_value
  FROM   zcta_header zh,
         zcta_detail zd,
         bizbystate b
    where zh.city = b.STREET_ADDRESS_CITY and
    left(b.STREET_ADDRESS_ZIP,5) = zd.zip order by 3;
-----------------------------------------------------------------------------------
insert into zcta_detail (city,zip,STATE)
select STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5),'NJ' AS state from bizbystate where STREET_ADDRESS_CITY not in
( SELECT CITY FROM zcta_detail where state = 'NJ')
group by STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5) ORDER BY STREET_ADDRESS_CITY;

select distinct STREET_ADDRESS_CITY from bizbystate where STREET_ADDRESS_CITY not in
( SELECT CITY FROM zcta_header where state = 'NJ')
group by STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5) ORDER BY STREET_ADDRESS_CITY;

select STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5),'NJ' AS state from bizbystate where STREET_ADDRESS_CITY not in
( SELECT CITY FROM zcta_detail where state = 'NJ')
group by STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5) ORDER BY STREET_ADDRESS_CITY;

select * from zcta_detail where city = 'Alpha';

select DISTINCT city from zcta_detail z1 where z1.latitude is null and state = 'NJ';

select * from zcta_detail z1 where z1.latitude is not null and z1.state = 'NJ' and z1.city in (
select DISTINCT city from zcta_detail z1 where z1.latitude is null and state = 'NJ');

select count(*) from bizbystate;

select count(*) from bizbystate where STREET_ADDRESS_CITY in(
select DISTINCT city from zcta_detail z1 where z1.latitude is null and state = 'NJ');

select * from zcta_detail z1 where z1.latitude is null and state = 'NJ'
union
select * from zcta_detail z1 where z1.latitude is not null and state = 'NJ' and zip in(
select zip from zcta_detail z2 where z2.latitude is null and z2.state = 'NJ' order by 1) order by 1;

select * from zcta_detail z1 where z1.latitude is null and state = 'NJ';


select * from zcta_header z1 where city not in(
select city from zcta_detail z2 ) order by 1;
------------------------------------------------------------------
insert into wp_multicity (
select   city_id as `city_id`     , '223' as `country_id`   , '' as `ptype`          , '3738' as `zones_id`    , city as `cityname`,
         0 as `lat`    , 0 as `lng`    , '13' as `scall_factor` , 0 as `set_zooming_opt`  , '' as `map_type`, city_id as `sortorder`,
         'Yes' as `is_zoom_home`, '' as `categories`      , 0 as `is_default`,
         '' as `geo_address` FROM zcta_header) ;

select   city_id as `city_id`     , '223' as `country_id`   , '' as `ptype`          , '3738' as `zones_id`    , city as `cityname`,
         0 as `lat`    , 0 as `lng`    , '13' as `scall_factor` , 0 as `set_zooming_opt`  , '' as `map_type`, city_id as `sortorder`,
         'Yes' as `is_zoom_home`, '' as `categories`      , 0 as `is_default`,
         '' as `geo_address` FROM zcta_header ;

SELECT * FROM zcta_detail where state = 'NJ' and city = 'Alpha';
SELECT * FROM zcta_detail where state = 'NJ' and zip = 08879;
SELECT city,count(zip) FROM zcta_detail where state = 'NJ' group by city order by 2;

select * from wp_multicity where CITYname in
( SELECT CITY FROM zcta_detail where state = 'NJ');

update wp_multicity m , zcta_detail z set
  m.lat = z.latitude,
  m.lng = z.longitude where
m.cityname = z.city and
z.state = 'NJ';

update wp_multicity m, bizbystate b
  set m.ptype = left(b.STREET_ADDRESS_ZIP,5)
  where m.lat = 0 and
    b.STREET_ADDRESS_CITY = m.cityname;


select STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5) from bizbystate where STREET_ADDRESS_CITY not in
( SELECT CITY FROM zcta_detail where state = 'NJ')
group by STREET_ADDRESS_CITY,left(STREET_ADDRESS_ZIP,5) ORDER BY STREET_ADDRESS_CITY;

SELECT distinct left(STREET_ADDRESS_ZIP,5) FROM bizbystate m where STREET_ADDRESS_CITY = 'Laurence Harbor';
SELECT * FROM wp_multicity m where lat = 0;
-----------------------------------------------------
SELECT * FROM wp_postmeta w where post_id = 2;
SELECT * FROM wp_postmeta w order by 2;

truncate table wp_postmeta;

Insert into wp_postmeta (post_id,meta_key,meta_value)
SELECT  b.rownum       as post_id,
        'post_city_id' as meta_key,
        zh.city_id     as meta_value
  FROM   zcta_header zh,
         zcta_detail zd,
         bizbystate b
    where zh.city = b.STREET_ADDRESS_CITY and
    left(b.STREET_ADDRESS_ZIP,5) = zd.zip order by 1;


SELECT  b.rownum       as post_id,
        'post_city_id' as meta_key,
        concat(b.STREET_ADDRESS,',',b.STREET_ADDRESS_CITY,',',b.STATE,',',left(b.STREET_ADDRESS_ZIP,5)) as meta_value,
        b.STREET_ADDRESS_CITY as 'STREET_ADDRESS_CITY',
        zh.city as city
  FROM   zcta_header zh,
         bizbystate b
    where zh.city = b.STREET_ADDRESS_CITY order by 1;

select city, count(city) from zcta_header group by city order by 2;

-- Main SQL-------
SELECT b.rownum, b.company_name,
        concat(b.STREET_ADDRESS,',',b.STREET_ADDRESS_CITY,',',b.STATE,',',left(b.STREET_ADDRESS_ZIP,5)) as 'address',
        zh.city_id, zd.longitude,zd.latitude
  FROM   zcta_header zh,
         zcta_detail zd,
         bizbystate b
    where zh.city = b.STREET_ADDRESS_CITY and
    left(b.STREET_ADDRESS_ZIP,5) = zd.zip order by 3;
---------------------------------------------------------------------------
update wp_terms wt, wp_term_taxonomy wtt set wtt.count =
(select count(*) from bizbystate b where b.PRIMARY_SIC = 17101 and b.SECONDARY_SIC_1 = 17101 and b.SECONDARY_SIC_2 = 17999)
where wt.term_id = wtt.term_id and wt.PRIMARY_SIC = 17101 and wt.SECONDARY_SIC_1 = 17101 and wt.SECONDARY_SIC_2 = 17999 ;
--------------------------------------------------------------------------------------------------------------------------------------------
-------------------Find business with all names having more than 10 branches-------------------
select * from bizbystate
where PRIMARY_SIC = 17101 and
          SECONDARY_SIC_1 = 17101 and
          SECONDARY_SIC_2 = 17999;

SELECT * FROM state_nj
     where actual_sales_volume > 500000
     order by actual_sales_volume,primary_sic, primary_sic_description;

SELECT primary_sic, primary_sic_description, count(primary_sic)
FROM state_nj where actual_sales_volume > 500000 group by primary_sic, primary_sic_description;

SELECT primary_sic, primary_sic_description , company_name, count(company_name) as 'total'
FROM state_CT where primary_sic > 0 group by company_name,primary_sic, primary_sic_description
having count(company_name) > 10 order by primary_sic,total ;

SELECT distinct primary_sic, primary_sic_description
FROM state_nj group by company_name,primary_sic, primary_sic_description
having count(company_name) > 15 ;

SELECT company_name, primary_sic, primary_sic_description , count(company_name) as 'total'
FROM state_nj group by company_name,primary_sic, primary_sic_description
having count(company_name) > 15 order by primary_sic,total;
--------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM site_usbdb.usa_population
where SUMLEV IN (40)
order by popestimate2011 desc;

SELECT distinct * FROM site_usbdb.usa_population
where
STNAME like 'New Jersey' and
SUMLEV NOT IN (50,40) and
PLACE NOT IN (99990) and
popestimate2011 > 20000
order by popestimate2011 desc;

SELECT distinct REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(NAME,'city',''),'township',''),'borough',''),'town',''),'village','') as 'cityname' FROM site_usbdb.usa_population
where
STNAME like 'New Jersey' and
SUMLEV NOT IN (50,40) and
PLACE NOT IN (99990) and
popestimate2011 > 20000
order by popestimate2011 desc;

SELECT * FROM site_usbdb.usa_population
where
STNAME like 'New York' and
SUMLEV NOT IN (50,40) and
PLACE NOT IN (99990) and
popestimate2011 > 20000
order by popestimate2011 desc;
