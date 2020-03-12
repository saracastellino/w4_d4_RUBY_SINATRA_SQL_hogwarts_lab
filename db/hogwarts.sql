DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;

CREATE TABLE houses (
  id SERIAL primary key,
  name VARCHAR(255),
  url VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL primary key,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house_id INT REFERENCES houses(id) ON DELETE CASCADE,
  age INT
);
