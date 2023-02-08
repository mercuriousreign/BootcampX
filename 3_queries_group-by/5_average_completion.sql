SELECT students.name, AVG(duration) as average_assignment_duration
FROM assignment_submissions
JOIN students
ON student_id = students.id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;



-- SELECT cohorts.name, count(*) AS total_submissions
-- FROM assignment_submissions
-- JOIN students 
-- ON student_id = students.id
-- JOIN cohorts
-- ON cohorts.id = students.cohort_id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions;