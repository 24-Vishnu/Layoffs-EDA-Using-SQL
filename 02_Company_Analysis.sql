--Total Layoffs by Company
mysql> select  company,sum(total_laid_off) as total_layoffs 
    -> from layoffs_clean group by company
    -> order by total_layoffs desc;

--Top 10 Companies
mysql> select company,sum(total_laid_off) as total_layoffs
    -> from layoffs_clean
    -> group by company
    -> order by total_layoffs desc
    -> limit 10;

--Companies with 100% Layoffs
mysql> select company,total_laid_off,percentage_laid_off 
    -> from layoffs_clean 
    -> where percentage_laid_off=1
    -> order by total_laid_off desc;

--Top Companies by Single Layoff Event
mysql> select company,total_laid_off
    -> from layoffs_clean
    -> order by total_laid_off desc;

--Company Ranking
mysql> select company,sum(total_laid_off) as total_layoffs,
    -> rank() over(
    -> order by sum(total_laid_off) desc
    -> ) as company_rank
    -> from layoffs_clean
    -> group by company;

--Top 5 Ranked Companies
mysql> with company_rankings as(
    -> select company,sum(total_laid_off) as total_layoffs,
    -> rank() over (order by sum(total_laid_off) desc
    -> ) as ranking
    -> from layoffs_clean group by company)
    -> select * from company_rankings
    -> where ranking<=5;

--Average Layoffs per Company
mysql> select company,round(avg(total_laid_off),2) as avg_layoffs
    -> from layoffs_clean
    -> group by company
    -> order by avg_layoffs desc;































