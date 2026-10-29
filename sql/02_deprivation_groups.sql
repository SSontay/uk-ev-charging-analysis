-- Question 3: EV adoption and public charging in five deprivation groups (England outside London)

-- Step 1: split all English local authorities into five equal groups by IMD score (1 = least deprived)
WITH england AS (
    SELECT
        la.*,
        d.imd_score,
        NTILE(5) OVER (ORDER BY d.imd_score) AS imd_group
    FROM la_analysis AS la
    JOIN deprivation AS d ON la.la_code = d.la_code
)

-- Step 2: totals per group, leaving London out (as in notebook 05)
SELECT
    imd_group,
    COUNT(*) AS local_authorities,
    ROUND(SUM(bev_private) / SUM(all_vehicles_private) * 100, 1) AS bev_share_pct,
    ROUND(SUM(chargers) / SUM(population_2024) * 100000, 1) AS chargers_per_100k,
    ROUND(SUM(bev_private) / SUM(chargers), 1) AS bev_private_per_charger
FROM england
WHERE region <> 'London'
GROUP BY imd_group
ORDER BY imd_group;
