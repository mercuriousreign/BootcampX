SELECT teachers.name as teacher,  cohorts.name as cohort, COUNT(*) as total_assistance FROM assistance_requests
JOIN teachers
ON teachers.id = assistance_requests.teacher_id
JOIN students
ON students.id = assistance_requests.student_id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name,  cohorts.name
ORDER BY teachers.name;