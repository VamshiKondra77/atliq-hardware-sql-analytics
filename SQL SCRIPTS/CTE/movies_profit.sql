## movies that produced 500% or more profit and their rating was less than average rating
with t1 as (select movie_id,(revenue-budget)*100/budget as profit_pct from financials
		   where (revenue-budget)*100/budget>=500),
       t2 as (select * from movies where imdb_rating<(select avg(imdb_rating) from movies))
select t1.movie_id,t1.profit_pct,t2.title,t2.imdb_rating
from t1
join t2 on t1.movie_id=t2.movie_id

/* #Select all Hollywood movies released after the year 2000  that made more than 500 million $ profit or more profit. Note that all Hollywood movies have millions as a unit

#1 Select all Hollywood movies released after the year 2000 
# 500 million $ profit or more profit.*/
with t1 as
(select movie_id,(revenue-budget)*100/budget as profit_pct from financials
 where (revenue-budget)*100/budget>=500),
 t2 as
 (select * from movies where industry="hollywood" and release_year > 2000)
 select t1.movie_id,t1.profit_pct,t2.title,t2.release_year,t2.industry
 from t1
 join t2
 using(movie_id)
