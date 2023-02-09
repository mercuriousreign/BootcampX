const { Pool } = require('pg');
const input = process.argv.slice(2);

const cohortName = process.argv[2];

const values = [`%${cohortName}%`];

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});


const queryString = `
SELECT DISTINCT teachers.name as teacher,  cohorts.name as cohort
FROM assistance_requests
JOIN teachers
ON teachers.id = assistance_requests.teacher_id
JOIN students
ON students.id = assistance_requests.student_id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
GROUP BY teachers.name,  cohorts.name
ORDER BY teachers.name;
`;

pool.query(queryString,values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));





