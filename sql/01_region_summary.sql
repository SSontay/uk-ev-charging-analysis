-- Question 2: private battery electric cars per public charger, by region (July 2026)
SELECT
    region,
    SUM(bev_private) AS bev_private,
    SUM(chargers) AS chargers,
    ROUND(SUM(bev_private) / SUM(chargers), 1) AS bev_private_per_charger
FROM la_analysis
GROUP BY region
ORDER BY bev_private_per_charger;
