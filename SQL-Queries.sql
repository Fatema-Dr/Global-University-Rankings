psql postgres://postgres:Fat912ema.@localhost:5432/postgres

CREATE DATABASE university_ranking;

CREATE TABLE university_rankings (
    Rank INT,
    University VARCHAR(255),
    Location VARCHAR(255),
    "Overall Score" NUMERIC,
    "Overall Teaching Score" NUMERIC,
    "Research Score" NUMERIC,
    "Research Quality" NUMERIC,
    "Industry Income Score" NUMERIC,
    "International Outlook Score" NUMERIC
);

\copy university_rankings FROM 'C:\Users\fatem\OneDrive - University of East London\Self Learning\Global University Rankings-Data-Driven Analysis\notebooks\Cleaned_University_Rankings_Data.csv' DELIMITER ',' CSV HEADER;

--Top 10 Uinversities Globally
SELECT * FROM university_rankings 
ORDER BY Rank ASC 
LIMIT 10;

--Top 5 universities by country
SELECT * FROM (
    SELECT *, 
           RANK() OVER (PARTITION BY location ORDER BY "Overall Score" DESC) AS univ_rank
    FROM university_rankings
	WHERE "Overall Score" >0
) ranked
WHERE univ_rank <= 5
ORDER BY Location, univ_rank;

--Top Universities with Highest Research Quality
SELECT University, Location, "Research Quality"
FROM university_rankings
ORDER BY "Research Quality" DESC
LIMIT 20;

--Top Universities with High Industry Income
SELECT Location,University, "Industry Income Score"
FROM university_rankings
ORDER BY "Industry Income Score" DESC
LIMIT 20;

--Top Universities with Best International Outlook
SELECT Location,University, "International Outlook Score"
FROM university_rankings
ORDER BY "International Outlook Score" DESC
LIMIT 20;

--Average Scores by Country
SELECT Location,
       ROUND(AVG("Overall Score"), 2) AS Avg_Overall_Score,
       ROUND(AVG("Overall Teaching Score"), 2) AS Avg_Teaching,
       ROUND(AVG("Research Score"), 2) AS Avg_Research,
	   ROUND(AVG("Industry Income Score"), 2) AS Avg_Industry_Income_Score,
       ROUND(AVG("International Outlook Score"), 2) AS Avg_International_Outlook_Score
FROM university_rankings
GROUP BY Location
ORDER BY Avg_Overall_Score DESC;

--Median vs Mean Overall Score by Country	
SELECT Location,
       ROUND(AVG("Overall Score"), 2) AS mean_score,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "Overall Score") AS median_score
FROM university_rankings
WHERE "Overall Score" > 0
GROUP BY Location
ORDER BY mean_score DESC;

--Standard Deviation of Overall Score by Country
SELECT 
    university,
    location,
    ROUND(
        STDDEV_POP(val), 2
    ) AS score_stddev
FROM (
    SELECT 
        university,
        location,
        UNNEST(ARRAY[
            "Overall Score", 
            "Overall Teaching Score", 
            "Industry Income Score", 
            "International Outlook Score", 
            "Research Score", 
            "Research Quality"
        ]) AS val
    FROM university_rankings
) AS unpivoted
GROUP BY university, location
ORDER BY score_stddev DESC
LIMIT 10;

--Teaching vs Research Correlation by Country
SELECT location,
       ROUND(CORR("Overall Teaching Score", "Research Score")::numeric, 2) AS teaching_research_corr
FROM university_rankings
GROUP BY location
ORDER BY teaching_research_corr DESC;

--Research vs Industry Income Correlation
SELECT ROUND(CORR("Research Score", "Industry Income Score")::numeric, 2) AS research_income_corr
FROM university_rankings;

--Average Gap between Teaching and Research by Country
SELECT location,
       ROUND(AVG(ABS("Overall Teaching Score" - "Research Score")), 2) AS teaching_research_gap
FROM university_rankings
GROUP BY location
ORDER BY teaching_research_gapSA DESC;

--High International Outlook but Low Research Score
SELECT university, location, "International Outlook Score", "Research Score"
FROM university_rankings
WHERE "International Outlook Score" > 85 AND "Research Score" < 50
ORDER BY "International Outlook Score" DESC;

--High Research Quality but Low Overall Score
SELECT university, location, "Research Quality", "Overall Score"
FROM university_rankings
WHERE "Research Quality" > 85 AND "Overall Score" < 60 AND "Overall Score">0
ORDER BY "Research Quality" DESC;

--Universities with Balanced Score across all metrics
SELECT university, location,
       ROUND(STDDEV_POP(ARRAY[
           "Overall Teaching Score", 
           "Research Score", 
           "Industry Income Score", 
           "International Outlook Score"
       ]::numeric[]), 2) AS score_variation
FROM university_rankings
ORDER BY score_variation ASC
LIMIT 10;

--Number of Universities per Country
SELECT location, COUNT(*) AS Total_universities
FROM university_rankings
GROUP BY location
ORDER BY Total_universities DESC;

--Countries with Most Universities in Top 100
SELECT Location, COUNT(*) AS Top_100_Count
FROM university_rankings
WHERE Rank <= 100
GROUP BY Location
ORDER BY Top_100_Count DESC;

--Score Ranges Distribution
SELECT 
  CASE 
    WHEN "Overall Score" >= 90 THEN '90-100'
    WHEN "Overall Score" >= 80 THEN '80-89'
    WHEN "Overall Score" >= 70 THEN '70-79'
    WHEN "Overall Score" >= 60 THEN '60-69'
    ELSE '<60'
  END AS Score_Range,
  COUNT(*) AS university_count
FROM university_rankings
GROUP BY Score_Range
ORDER BY Score_Range DESC;

--Countries with top high score universities
SELECT location, COUNT(*) AS high_scorers
FROM university_rankings
WHERE "Overall Score" > 85
GROUP BY location
ORDER BY high_scorers DESC;

--Universities with Balanced Teaching and Research Scores
SELECT University, Location, "Overall Teaching Score", "Research Score",
       ABS("Overall Teaching Score" - "Research Score") AS Score_Gap
FROM university_rankings
ORDER BY Score_Gap ASC
LIMIT 10;



