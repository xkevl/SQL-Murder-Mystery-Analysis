Part 1

-- Step 1: Find the crime scene report
SELECT description
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City'
AND type = 'murder';

-- Step 2: Identify witnesses
SELECT name
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- Step 3: Find the interview transcript from our witness
SELECT transcript
FROM interview 
WHERE person_id = (
	SELECT id
	FROM person
	WHERE name = 'Morty Schapiro'
);

-- Step 4: Locate the culprit
SELECT p.name
FROM person AS p
JOIN drivers_license AS d ON p.license_id = d.id
JOIN get_fit_now_member AS g ON g.person_id = p.id
WHERE g.id LIKE '48Z%'
AND d.plate_number LIKE '%H42W%';


Part 2

-- Step 1: Find the interview transcript from our culprit
SELECT transcript
FROM interview 
WHERE person_id = (
	SELECT id
	FROM person
	WHERE name = 'Jeremy Bowers'
);

-- Step 2: Locate the real mastermind behind the murder
SELECT p.name
FROM person AS p
JOIN drivers_license AS d ON p.license_id = d.id
WHERE d.height BETWEEN 65 AND 67
AND d.hair_color = 'red'
AND d.car_model = 'Model S'
AND p.id IN (
	SELECT person_id
	FROM facebook_event_checkin
	WHERE event_name = 'SQL Symphony Concert'
	AND date LIKE '201712%'
	GROUP BY person_id
	HAVING COUNT(*) = 3
);