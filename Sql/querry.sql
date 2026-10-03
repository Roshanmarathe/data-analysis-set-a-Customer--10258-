-- S2a — Average resolution time by department

USE customers_1;

SELECT 
    t.department,
    AVG(k.resolution_hours) AS avg_resolution_hours
FROM tickets k
JOIN teams t
    ON k.team_id = t.team_id
GROUP BY t.department
ORDER BY avg_resolution_hours DESC;


-- S2b — Teams breaching SLA

SELECT 
    t.team,
    AVG(k.resolution_hours) AS avg_resolution_hours
FROM tickets k
JOIN teams t
    ON k.team_id = t.team_id
GROUP BY t.team
HAVING AVG(k.resolution_hours) > 24;


-- S2c — Top two channels by breach count

SELECT 
    channel,
    COUNT(*) AS breach_count
FROM tickets
WHERE resolution_hours > 24
GROUP BY channel
ORDER BY breach_count DESC, channel ASC
LIMIT 2;


-- S3 — Data Integrity Check

SELECT DISTINCT k.team_id
FROM tickets k
LEFT JOIN teams t
    ON k.team_id = t.team_id
WHERE t.team_id IS NULL;