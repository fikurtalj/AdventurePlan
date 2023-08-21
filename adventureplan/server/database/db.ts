//declaration of pg library
const Pool = require("pg").Pool;

export const pool = new Pool({
  user: "postgres",
  password: "12345",
  host: "localhost",
  port: 5432,
  database: "adventPlan",
});

// module.exports = pool;
