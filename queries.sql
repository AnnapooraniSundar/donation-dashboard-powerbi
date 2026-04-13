select count(*) from donations;
--------------------------------
select * from donations limit 100;
---------------------------------
select campaign, sum(donation_amount) as total_donation
from donations
group by campaign
order by total_donation DESC
limit 10
-----------------------------------
SELECT donor_id, name, SUM(donation_amount) AS total_donation
FROM donations
GROUP BY donor_id, name
ORDER BY total_donation DESC
limit 10
------------------------------------
SELECT 
    CASE 
        WHEN donation_count = 1 THEN 'One-time donor'
        ELSE 'Repeat donor'
    END AS donor_type,
    COUNT(*) AS donor_count,
    SUM(total_donation) AS total_donation
from (
SELECT donor_id, name, COUNT(*) AS donation_count, SUM(donation_amount) AS total_donation
FROM donations
GROUP BY donor_id, name)
group by donor_type;
-----------------------------------------------
SELECT donation_type, 
       COUNT(*) AS donation_count,
       SUM(donation_amount) AS total_donation
FROM donations
GROUP BY donation_type;
-------------
SELECT 
    CASE 
        WHEN donation_count = 1 THEN 'One-time donor'
        ELSE 'Repeat donor'
    END AS donor_type,
    COUNT(*) AS donor_count,
    SUM(total_donation) AS total_donation,
    ROUND(SUM(total_donation) * 1.0 / COUNT(*), 2) AS avg_donation_per_donor
FROM (
    SELECT donor_id, COUNT(*) AS donation_count, SUM(donation_amount) AS total_donation
    FROM donations
    GROUP BY donor_id
)
GROUP BY donor_type;
----------------------------
select donation_type, avg(donation_amount) as avg_donation
from donations
group by donation_type
order by avg_donation
