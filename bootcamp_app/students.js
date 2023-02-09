const { Pool } = require('pg');

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;

const values = [`%${cohortName}%`, limit];


const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});


const queryString = `
SELECT students.id, students.name, students.cohort_id ,cohorts.name as cohorts_name
FROM students
JOIN cohorts
ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`

pool.query(queryString,values)
.then(res => {
  console.log(res.rows);
  console.log(values);
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_id} ${user.cohorts_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));

