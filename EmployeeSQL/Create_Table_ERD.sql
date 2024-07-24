-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE departments CASCADE;
DROP TABLE dept_emp CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE titles CASCADE;

CREATE TABLE "departments" (
    "dept_no" VARCHAR(5) PRIMARY KEY NOT NULL,
    "dept_name" VARCHAR(20)   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(5)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT  PRIMARY KEY NOT NULL,
    "emp_title_id" VARCHAR(6)   NOT NULL,
    "birth_date" DATE, 
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE 
);

CREATE TABLE "salaries" (
    "emp_no" INT PRIMARY KEY NOT NULL,
    "salary" FLOAT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(6)  PRIMARY KEY NOT NULL,
    "title" VARCHAR(20)   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

