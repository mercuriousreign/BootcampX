const { Pool } = require('pg');
const input = process.argv.slice(2);

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT students.id, students.name, students.cohort_id ,cohorts.name as cohorts_name
FROM students
JOIN cohorts
ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE '${input[0]}%'
LIMIT ${input[1]};
`)
.then(res => {
  console.log(res.rows);
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_id} ${user.cohorts_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));

