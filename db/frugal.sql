DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE budgets;


CREATE TABLE IF NOT EXISTS budgets(
  id SERIAL8 PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  amount FLOAT8,
  name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tags(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS transactions(
  id SERIAL8 PRIMARY KEY,
  price FLOAT8,
  date_added DATE,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  budget_id INT8 REFERENCES budgets(id) ON DELETE CASCADE
);
