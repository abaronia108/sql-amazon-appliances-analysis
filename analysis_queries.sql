--query 1
select reviewerid, avg(overall) 
from appliances_reviews
group by reviewerid;
--query 2 
select extract(month from reviewtime) as month, avg(overall)
from appliances_reviews 
where extract(year from reviewTime) = 2014
group by extract(month from reviewtime);
--query 3
select subcategory, avg(price)
from appliances_metadata
group by subcategory;
--query 4 
select subcategory, count(asin)
from appliances_metadata
group by subcategory;
--query 5
select count(distinct subcategory)
from appliances_metadata;
--query 6
select avg(overall)
from appliances_reviews;
--query 7
select count(distinct reviewerid)
from appliances_reviews;
--query 8 
select subcategory, count(appliances_reviews.asin) as total_reviews
from appliances_metadata
join appliances_reviews on appliances_metadata.asin = appliances_reviews.asin
group by subcategory;
--query 9 
select avg(length(reviewtext))
from appliances_reviews;
--query 10 
select extract(year from reviewtime) as year, count (*) total_january_reviews
from appliances_reviews
where extract(year from reviewtime) in (2011, 2012, 2013, 2014) and extract(month from reviewtime) = 1
group by year;
--query 11 
select extract(year from reviewtime) as year, count (*) total_may_reviews, subcategory
from appliances_reviews
join appliances_metadata on appliances_reviews.asin = appliances_metadata.asin
where extract(year from reviewtime) in (2011, 2012, 2013, 2014) and extract(month from reviewtime) = 5
group by year, subcategory;
--query 12 
select subcategory, avg(price)
from appliances_metadata
join appliances_reviews on appliances_metadata.asin = appliances_reviews.asin 
group by subcategory
having avg(overall) > 3;
--query 13
with ranked_reviews as 
	(select title, subcategory, count(reviewText) as review_count, row_number() over (partition by subcategory order by
	count(reviewText) desc) as rank
	from appliances_metadata
	join appliances_reviews on appliances_metadata.asin = appliances_reviews.asin
	group by title, subcategory
)
select subcategory, title, review_count
from ranked_reviews
where rank <= 3
order by subcategory, review_count 