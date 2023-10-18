-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Department_No" VARCHAR   NOT NULL,
    "Department_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_No"
     )
);

CREATE TABLE "Department_Employees" (
    "Employee_No" INT   NOT NULL,
    "Department_No" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department_Employees" PRIMARY KEY (
        "Employee_No"
     )
);

CREATE TABLE "Department_Managers" (
    "Department_No" VARCHAR   NOT NULL,
    "Employee_No" INT   NOT NULL
);

CREATE TABLE "Employees" (
    "Employee_No" INT   NOT NULL,
    "Employee_Title" VARCHAR   NOT NULL,
    "Birth_Date" VARCHAR   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Sex" VARCHAR   NOT NULL,
    "Hire_Date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_No"
     )
);

CREATE TABLE "Salaries" (
    "Employee_No" INT   NOT NULL,
    "Salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Employee_No"
     )
);

CREATE TABLE "Titles" (
    "Title_id" VARCHAR   NOT NULL,
    "Employee_Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_id"
     )
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Department_No" FOREIGN KEY("Department_No")
REFERENCES "Department_Employees" ("Department_No");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Salaries" ("Employee_No");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_Department_No" FOREIGN KEY("Department_No")
REFERENCES "Departments" ("Department_No");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Employees" ("Employee_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Employee_Title" FOREIGN KEY("Employee_Title")
REFERENCES "Titles" ("Employee_Title");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Employees" ("Employee_No");

