-- Data Cleaning

select * from layoffs;

-- 1. Remove Duplicates
-- 2.standardixe the Data
-- 3.Null values or blank values
-- 4.Remove any Columns

create table layoffs_staging like layoffs;

insert layoffs_Staging select * from layoffs;

select * from layoffs;

select * ,row_number() over(partition by company,industry,total_laid_off,percentage_laid_off,`date`)  as Row_num
from layoffs_staging;

with duplicate_cte as(
select * , row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,
country,funds_raised_millions) as Row_num from layoffs_staging)
select * from duplicate_cte where row_num >1;


select * from layoffs_staging where company='Casper';


with duplicate_cte as(
select * , row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,
country,funds_raised_millions) as Row_num from layoffs_staging)
Delete from  duplicate_cte where row_num >1;





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


select * from layoffs_staging2;

insert into layoffs_staging2 select * , row_number() over(partition by company,location,industry,total_laid_off,
percentage_laid_off,`date`,stage, country,funds_raised_millions) as Row_num from layoffs_staging;

delete  from layoffs_staging2 where row_num>1;
select * from layoffs_staging2;


-- 2.Standardizing Data

select company,trim(COMPANY) from layoffs_staging2;

update layoffs_staging2 set company=Trim(COMPANY);

select distinct industry from layoffs_staging2 order by 1;
select * from layoffs_staging2 where  company like'Bally%';

update layoffs_staging2 set industry='Crypto' where industry like 'Crypto%';

select * from layoffs_staging2 where country like'United States%' order by  1;
select distinct country,trim(trailing '.' from country) from layoffs_staging2  order by  1;

update layoffs_staging2 set country=trim(trailing '.' from country) where country like 'United States%';


select `date`from layoffs_staging2;
update layoffs_staging2 set `date`=str_to_date(`date`,'%m/%d/%Y');

alter table layoff_staging2 modify column `date` date;

select * from layoffs_staging2;

select * from layoffs_staging2 where total_laid_off is null
and percentage_laid_off is null;

update layoffs_staging2 set industry=null where industry ='';

select * from layoffs_staging2 where industry is null or industry='';

select * from layoffs_staging2 where company='Airbnb';

select * from layoffs_staging2 t1 join layoffs_staging2 t2 on t1.company=t2.company 
  where(t1.industry is null or t1.industry='') and t2.industry is not null;
  
select t1.industry,t2.industry from layoffs_staging2 t1 join layoffs_staging2 t2 on t1.company=t2.company 
  where(t1.industry is null or t1.industry='') and t2.industry is not null;
  
  
update layoffs_staging2 t1 join layoffs_staging2 t2 on 
 t1.company=t2.company set t1.industry= t2.industry 
 where t1.industry is null and t2.industry is not null;
 
 
 select * from layoffs_staging2;
 
-- 3.Null values or blank values
-- 4.Remove any Columns
 
 select * from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null;
 
 delete from layoffs_staging2 where total_laid_off is null and percentage_laid_off is null;
 
  alter table layoffs_staging2 drop column row_num;
  
  -- Exploratory Data Analysis
  
  select * from layoffs_staging2;
 
select max(total_laid_off), max(percentage_laid_off)  from layoffs_staging2;
   
select * from layoffs_staging2 where percentage_laid_off=1
   order by funds_raised_millions desc;
   
select company,sum(total_laid_off) from layoffs_staging2   group by company order by 2 desc;

select `date`,sum(total_laid_off) from layoffs_staging2 group by `date` order by 1 desc;


select min(`date`),max(`date`) from layoffs_staging2;

select industry,sum(total_laid_off) from layoffs_staging2 group by industry order by 2 desc;

select year(`date`),sum(total_laid_off) from layoffs_staging2 group by  year(`date`) order by 1 desc;

select stage,sum(total_laid_off) from layoffs_staging2 group by  stage order by 1 desc;

select company,sum(percentage_laid_off) from layoffs_staging2 group by company order by 2 desc;

select substring(`date`,6,2) as `month` ,sum(total_laid_off) from layoffs_staging2 group by substr(`date`,6,2);

 select substring(`date`,6,2) as `month` ,sum(total_laid_off) from layoffs_staging2 group by`month` order by 1 asc;
 
 select substring(`date`,1,7) as `month` ,sum(total_laid_off) from layoffs_staging2 where substring(`date`,1,7) is 
  not null group by `month` order by 1 asc;

with Rolling_Total as
(
select substring(`date`,1,7) as `month` ,sum(total_laid_off) as total_off from layoffs_staging2 
where substring(`date`,1,7) is 
  not null group by `month` order by 1 asc) 
  select 	`MONTH` ,total_off,sum(total_off) over(order by `MONTH`) as rolling_total from Rolling_Total;

select company,sum(total_laid_off) from layoffs_staging2 group by company order by 2 desc;


select company,year(`date`) ,sum(total_laid_off) from layoffs_staging2 
  group by company,year(`date`) order by company asc;
  
select company,year(`date`) ,sum(total_laid_off) from layoffs_staging2 
  group by company,year(`date`) order by 3 desc;
  
  with Company_Year(company ,years,total_laid_off) as
  (select company,year(`date`) ,sum(total_laid_off) from layoffs_staging2 
  group by company,year(`date`) ),Company_Year_Rank as
  (select *,dense_rank() over(partition by years order by total_laid_off desc) as Ranking from Company_Year
  where years is not null )select * from Company_Year_Rank where ranking>=5;
  