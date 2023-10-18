-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Department_Employees;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Department_Managers;


CREATE TABLE IF NOT EXISTS Departments (
    Department_No VARCHAR   NOT NULL,
    Department_Name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Department_No
     )
);


CREATE TABLE IF NOT EXISTS Department_Employees (
    Employee_No INT NOT NULL,
    Department_No VARCHAR NOT NULL,
    CONSTRAINT pk_Department_Employees PRIMARY KEY (Employee_No),
    CONSTRAINT uq_Department_Employees_Department_No UNIQUE (Department_No) -- Add a unique constraint
);



CREATE TABLE IF NOT EXISTS  Employees (
    Employee_No INT   NOT NULL,
    Employee_Title VARCHAR   NOT NULL,
    Birth_Date VARCHAR   NOT NULL,
    First_Name VARCHAR   NOT NULL,
    Last_Name VARCHAR   NOT NULL,
    Sex VARCHAR   NOT NULL,
    Hire_Date VARCHAR   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Employee_No
     )
);

CREATE TABLE IF NOT EXISTS  Department_Managers (
    Department_No VARCHAR NOT NULL,
    Employee_No INT NOT NULL,
    PRIMARY KEY (Department_No, Employee_No)
);


CREATE TABLE IF NOT EXISTS  Salaries (
    Employee_No INT   NOT NULL,
    Salary INT   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        Employee_No
     )
);

CREATE TABLE IF NOT EXISTS  Titles (
    Title_id VARCHAR   NOT NULL,
    Employee_Title VARCHAR   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (Title_id),
	CONSTRAINT uk_Titles_Employee_Title UNIQUE (Employee_Title)
);

-- this one work
ALTER TABLE Departments ADD CONSTRAINT fk_Departments_Department_No FOREIGN KEY(Department_No)
REFERENCES Department_Employees (Department_No);

-- this one works
ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_Employee_No FOREIGN KEY(Employee_No)
REFERENCES Salaries (Employee_No);

-- this one works
ALTER TABLE Department_Managers ADD CONSTRAINT fk_Department_Managers_Department_No FOREIGN KEY(Department_No)
REFERENCES Departments (Department_No);

-- this one works
ALTER TABLE Department_Managers ADD CONSTRAINT fk_Department_Managers_Employee_No FOREIGN KEY(Employee_No)
REFERENCES Employees (Employee_No);

-- does work
ALTER TABLE Employees ADD CONSTRAINT fk_Employees_Employee_Title FOREIGN KEY(Employee_Title)
REFERENCES Titles (Employee_Title);

-- this one works
ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Employee_No FOREIGN KEY(Employee_No)
REFERENCES Employees (Employee_No);

