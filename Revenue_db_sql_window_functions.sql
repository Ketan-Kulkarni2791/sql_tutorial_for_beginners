CREATE TABLE IF NOT EXISTS tax_revenue (
  id SERIAL PRIMARY KEY,
  year CHAR(4) NOT NULL,
  quarter CHAR(1) NOT NULL,
  revenue INT NOT NULL
);

INSERT INTO tax_revenue
  (year, quarter, revenue)
VALUES
  ('2020', '1', 3515),
  ('2020', '2', 3678),
  ('2020', '3', 4203),
  ('2020', '4', 3924),
  ('2021', '1', 3102),
  ('2021', '2', 3293),
  ('2021', '3', 3602),
  ('2021', '4', 2901);

SELECT * FROM tax_revenue;

---------------------------------------------- LAG() ----------------------------------------------

SELECT *,
  lag(revenue, 1) OVER (
    PARTITION BY year
    ORDER BY quarter DESC
  ) next_quarter_revenue
FROM tax_revenue;

SELECT *,
  lag(revenue, 1, 0) OVER (
    PARTITION BY year
    ORDER BY quarter DESC
  ) next_quarter_revenue
FROM tax_revenue;

---------------------------------------------- LEAD() ----------------------------------------------

SELECT *,
  lead(revenue, 1) OVER (
    PARTITION BY year
    ORDER BY quarter DESC
  ) last_quarter_revenue
FROM tax_revenue;