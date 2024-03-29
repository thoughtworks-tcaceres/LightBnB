-- select temp_avg.property_id as id, p.title as title, p.cost_per_night as cost_per_night, r.start_date as start_date, temp_avg.average as average_rating
-- from reservations r
-- join properties p on p.id = r.property_id
-- join
-- (select p_r.property_id as property_id,avg(p_r.rating) as average
-- from property_reviews p_r
-- group by p_r.property_id) temp_avg on temp_avg.property_id = p.id
-- where r.guest_id = 1 and r.end_date < now()::date
-- order by start_date
-- limit 10;

SELECT
  p.*,
  r.*,
  temp_avg.average AS average_rating
FROM
  reservations r
  JOIN properties p ON p.id = r.property_id
  JOIN (
    SELECT
      p_r.property_id AS property_id,
      avg(p_r.rating) AS average
    FROM
      property_reviews p_r
    GROUP BY
      p_r.property_id) temp_avg ON temp_avg.property_id = p.id
WHERE
  r.guest_id = 1
  AND r.end_date < now()::date
ORDER BY
  start_date
LIMIT 10;

