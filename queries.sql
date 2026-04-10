-- Step 1: Find the crime scene report
SELECT *
FROM crime_scene_report
WHERE date = 20180115
  AND type = 'murder'
  AND city = 'SQL City';

-- Step 2: Identify witnesses
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC;

-- Step 3: Continue investigation...