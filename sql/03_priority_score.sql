-- Question 4: priority score for public charging investment, top 20 (England and Wales)

-- Growth in private battery electric cars, June 2025 -> June 2026
WITH growth AS (
    SELECT
        la_code,
        (SUM(bev_private) FILTER (WHERE quarter = '2026 Q2')
            / SUM(bev_private) FILTER (WHERE quarter = '2025 Q2') - 1) * 100 AS bev_private_growth
    FROM vehicles
    WHERE body_type = 'Cars' AND quarter IN ('2025 Q2', '2026 Q2')
    GROUP BY la_code
),

-- The three indicators; the inner join with housing keeps England and Wales only
indicators AS (
    SELECT
        la.la_code,
        la.la_name,
        la.region,
        la.bev_private_per_charger,
        (h.flats + h.terraced) / h.households * 100 AS no_driveway_share,
        g.bev_private_growth
    FROM la_analysis AS la
    JOIN housing AS h ON la.la_code = h.la_code
    JOIN growth AS g ON la.la_code = g.la_code
),

-- Percentile rank of each indicator (0 = lowest, 1 = highest), like PERCENTRANK in Excel
ranks AS (
    SELECT
        *,
        PERCENT_RANK() OVER (ORDER BY bev_private_per_charger) AS rank_gap,
        PERCENT_RANK() OVER (ORDER BY no_driveway_share) AS rank_no_driveway,
        PERCENT_RANK() OVER (ORDER BY bev_private_growth) AS rank_growth
    FROM indicators
)

SELECT
    ROW_NUMBER() OVER (ORDER BY (rank_gap + rank_no_driveway + rank_growth) DESC) AS priority_rank,
    la_name,
    region,
    ROUND((rank_gap + rank_no_driveway + rank_growth) / 3, 2) AS priority_score
FROM ranks
ORDER BY priority_rank
LIMIT 20;
