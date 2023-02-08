SELECT cohorts.name, count (*) AS student_count 
FROM students
JOIN cohorts 
ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING count(students.*) >= 18
ORDER BY student_count;
