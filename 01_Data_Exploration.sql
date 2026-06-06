--Total Records
mysql> select count(*) from layoffs_clean;

--Dataset Overview
mysql> select * from layoffs_clean limit 5;

--Date Range
mysql> select min(date) as earliest_date,min(date) as latest_date from layoffs_clean;

--Total Companies,industries,countries
mysql> select count(distinct company) from layoffs_clean;
mysql> select count(distinct company) from layoffs_clean;
mysql> select count(distinct company) from layoffs_clean;

--Maximum Layoffs
mysql> select max(total_laid_off) from layoffs_clean;

--Minimum Layoffs
mysql> select min(total_laid_off) from layoffs_clean 
    -> where total_laid_off is not null;

--Companies with 100% Layoffs
mysql> select * from layoffs_clean where percentage_laid_off=1;

--Count of 100% Layoffs
mysql> select count(*) from layoffs_clean where percentage_laid_off=1;

