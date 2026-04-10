Part 1

-- Step 1: Find the crime scene report
SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City'
AND type = 'murder';

-- Step 2: Identify witnesses
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- Step 3: Find the interview transcript from our witness
SELECT name, transcript
FROM interview AS i
JOIN person AS p
ON i.person_id = p.id
WHERE p.name = 'Morty Schapiro';

-- Step 4: Locate the culprit
SELECT g.name, g.id, d.plate_number
FROM get_fit_now_member AS g
JOIN person AS p
ON g.person_id = p.id
JOIN drivers_license AS d
ON p.license_id = d.id
WHERE g.id LIKE '48Z%'
AND d.plate_number LIKE '%H42W%';


Part 2

-- Step 1: Find the interview transcript from our culprit
SELECT name, transcript
FROM interview AS i
JOIN person AS p
ON i.person_id = p.id
WHERE p.name = 'Jeremy Bowers';

-- Step 2: Locate the real mastermind behind the murder
SELECT name, date, event_name
FROM facebook_event_checkin AS f
JOIN person AS p
ON f.person_id = p.id
JOIN drivers_license AS d
ON p.license_id = d.id
WHERE height BETWEEN 65 AND 67
AND hair_color = 'red'
AND car_model = 'Model S'
GROUP BY name;