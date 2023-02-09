SELECT cohorts.name, count(*) AS total_submissions
FROM assignment_submissions
JOIN students 
ON student_id = students.id
JOIN cohorts
ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;