select * from crimestype;
select * from city;
select count(*) from registercrime

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
