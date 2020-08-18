CREATE TABLE "departments" (
    "dept_no" VARCHAR PRIMARY KEY NOT NULL,
    "dept_name" VARCHAR NOT NULL
);

CREATE TABLE "dept_emp" (
	"emp_no" INT PRIMARY KEY NOT NULL,
    "dept_no" VARCHAR NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR PRIMARY KEY NOT NULL,
    "emp_no" INT NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT PRIMARY KEY NOT NULL,
    "emp_title" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT PRIMARY KEY NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(10) PRIMARY KEY NOT NULL,
    "title" VARCHAR   NOT NULL
);
