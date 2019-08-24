select c.name,
	   c.country,
	   rg.year,
	   cr.type,
	   count(cr.type)
from city c
inner join registercrime rg
on c.id = rg.id_city
inner join crimestype cr
on rg.id_crime = cr.id
group by c.name,
	   c.country,
	   rg.year,
	   cr.type
order by rg.year

select *
from crimestype;

select (select name
	   from city where id = c.id_city) as City,
	   c.year,
	   c.population
from census c;

select rg."year",
	   count(rg.year) as "Number of crimes" ,
	   population 
from registercrime rg
left join census cen
on rg.id_city = cen.id_city
and rg.year = cen.year
group by rg.year,
		 cen.population 
order by rg.year

select c.name,
	   c.state,
	   c.country,
	   rg.year,
	   cr.type,
	   count(cr.type)
from city c
inner join registercrime rg
on c.id = rg.id_city
inner join crimestype cr
on rg.id_crime = cr.id
group by  c.name,
	   c.state,
	   c.country,
	   rg.year,
	   cr.type
order by rg.year
