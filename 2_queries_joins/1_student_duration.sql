SELECT SUM(duration) as total_duration FROM assignment_submissions
INNER JOIN students ON assignment_submissions.student_id = students.id
WHERE name = 'Ibrahim Schimmel';
