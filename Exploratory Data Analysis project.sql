-- Exploratory data analysis. Our objective on this project is just to look around our data and see what we can get. We can start with focusing the total laid off column paired with the percentage laid off.

select *
from layoffs_staging2;

SELECT max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc
;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc
;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 DESC;

select min(`date`), max(`date`)
from layoffs_staging2;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 DESC;

select year (`date`), sum(total_laid_off)
from layoffs_staging2
group by year (`date`)
order by 2 DESC;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 DESC;

-- I want to see how the layoffs progresses over the months
 select substr(`date`, 1,7) as `Month`, sum(total_laid_off) as total_off
 from layoffs_staging2
 where substr(`date`, 1,7) is not null
 group by `Month`
 order by 1 asc;

with Rolling_Total as
(
 select substr(`date`, 1,7) as `Month`, sum(total_laid_off) as total_off
 from layoffs_staging2
 where substr(`date`, 1,7) is not null
 group by `Month`
 order by 1 asc
)
select `Month`, total_off,
sum(total_off) over(order by `Month`) as rolling_total
from Rolling_Total;

-- I also want to check out which companies did the most layoffs  as time progressed

select company, year (`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year (`date`)
order by 3 desc;

with company_year(company, years, total_laid_off) as
(
select company, year (`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year (`date`)
order by 3 desc
),
company_year_ranks as
(
SELECT *,
dense_rank () over(partition by years order by total_laid_off desc) as Ranking
from company_year
where years is not null
)
select *
from company_year_ranks
where Ranking <= 5
;


