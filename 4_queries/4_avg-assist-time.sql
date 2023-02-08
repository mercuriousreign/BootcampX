SELECT avg(completed_at-created_at) AS average_assistance_request_duration FROM assistance_requests;

-- SELECT students.name, AVG(assignment_submissions.duration) as average_assignment_duration, AVG(assignments.duration) as average_estimated_duration 
-- FROM assignment_submissions
-- JOIN students
-- ON student_id = students.id
-- JOIN assignments
-- ON assignments.id = assignment_submissions.assignment_id
-- WHERE students.end_date IS NULL 
-- GROUP BY students.name
-- HAVING AVG(assignment_submissions.duration) <= AVG(assignments.duration);