-- Data cleaning
select *
from layoffs;

-- The job 
-- 1. Remove any duplicates 
-- 2. Standardize the data
-- 3. Check on Null values or Blacnk areas(should they be filled)
-- 4. Remove any columns (If they are unnecessary)
-- Just to be on the safe side while dealing with no.4 it is best practise to create a duplicate of the raw data(layoffs)

create table layoffs_staging
like layoffs;

insert layoffs_staging
select *
from layoffs;

with duplicate_cte as
(
select *,
row_number () over (partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num >1 ;

select *
from layoffs_staging
where company = 'Casper';

-- since we can't directly delete with the cte a sql thing, we will create a new table with all the data and then delete it from there this is because the row_num column is not in our table.

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

insert into layoffs_staging2
select *,
row_number () over (partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) as row_num
from layoffs_staging;

delete
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2
where row_num > 1;

-- And with that we completed task 1

-- Task 2 - Standardizing Data(this is just finding issues in your data and then fixing it)





