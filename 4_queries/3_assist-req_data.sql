SELECT teachers.name AS teacher, students.name as student, assignments.name as assignment, (completed_at-started_at) AS duration
FROM assistance_requests
JOIN teachers
ON teachers.id = assistance_requests.teacher_id
JOIN students
ON students.id = assistance_requests.student_id
JOIN assignments
ON assignments.id = assistance_requests.assignment_id
GROUP BY assignments.name, students.name, teachers.name,  completed_at, started_at, duration
ORDER BY duration;

