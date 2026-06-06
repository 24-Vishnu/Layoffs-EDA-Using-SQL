--Total Layoffs by Industry
mysql> select industry,sum(total_laid_off) as total_layoffs
    -> from layoffs_clean
    -> where total_laid_off is not null
    -> group by industry
    -> order by total_layoffs desc;

--Top 10 Industries
mysql> select industry,sum(total_laid_off) as total_layoffs 
    -> from layoffs_clean where total_laid_off is not null
    -> group by industry
    -> order by total_layoffs desc
    -> limit 10;

--Number of Layoff Events per Industry
mysql> select industry,count(*) as layoffs_events
    -> from layoffs_clean
    -> group by industry
    -> order by layoffs_events desc;

--Average Layoffs by Industry
select industry,
       round(avg(total_laid_off),2) as avg_layoffs
from layoffs_clean
where total_laid_off is not null
group by industry
order by avg_layoffs desc;

--Industry Ranking
select industry,
       sum(total_laid_off) as total_layoffs,
       rank() over(
       order by sum(total_laid_off) desc
       ) as industry_rank
from layoffs_clean
where total_laid_off is not null
group by industry;

--Top 5 Industries Using CTE
with industry_rankings as
(
select industry,
       sum(total_laid_off) as total_layoffs,
       dense_rank() over(
       order by sum(total_laid_off) desc
       ) as ranking
from layoffs_clean
where total_laid_off is not null
group by industry
)
select *
from industry_rankings
where ranking <= 5;

