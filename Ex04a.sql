SELECT ProjectID, ProjectName, Department, MaxHours, StartDate, EndDate
From PROJECT;

SELECT *
FROM PROJECT;

SELECT ProjectName, Department, MaxHours
FROM PROJECT;

SELECT ProjectName, MaxHours, Department
FROM PROJECT;

SELECT Department
FROM PROJECT;

SELECT DISTINCT Department
FROM PROJECT

SELECT *
FROM PROJECT
WHERE Department = "Finance";

SELECT *
FROM PROJECT
WHERE StartDate = "05/10/2017";

SELECT *
FROM PROJECT
MaxHours > 135;

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE Department = "Accounting";

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
ORDER BY Department;

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
ORDER BY Department DESC;

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
ORDER BY Department DESC, LastName ASC;

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE Department = "Accounting" AND OfficePhone = "360-285-8430";

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE Department = "Accounting" OR OfficePhone = "360-285-8410";

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE Department = "Accounting" AND NOT OfficePhone = "360-285-8430";

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE Department IN ("Administration", "Finance", "Accounting");

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE EmployeeNumber >= 2 AND EmployeeNumber <=5;

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE EmployeeNumber BETWEEN 2 AND 5;

SELECT *
FROM PROJECT
WHERE ProjectName LIKE "2017 Q_ Porfolio Analysis";

SELECT *
FROM EMPLOYEE
WHERE OfficePhone LIKE "360-287-88__";

SELECT *
FROM EMPLOYEE
WHERE OfficePhone LIKE "360-287-88%";

SELECT *
FROM EMPLOYEE
WHERE Department LIKE "%ing";

SELECT *
FROM EMPLOYEE
WHERE Department NOT LIKE "%ing";

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE OfficePhone IS NULL;

SELECT FirstName, LastName, Department, OfficePhone
FROM EMPLOYEE
WHERE OfficePhone IS NOT NULL;

SELECT COUNT (*)
FROM PROJECT;

SELECT COUNT (*) AS NumberOfProjects
FROM PROJECT;

SELECT COUNT (Department) AS NumberOfDepartments
FROM PROJECT;

SELECT COUNT (DISTINCT Department) AS NumberOfDepartments
FROM PROJECT;

SELECT SUM (MaxHours) AS TotalMaxHours,
       AVG (MaxHours) AS AverageMaxHours,
       MIN (MaxHours) AS MinimumMaxHours,
       MAX (MaxHours) AS MaximumMaxHours
FROM PROJECT
WHERE ProjectID <= 1200;

SELECT ProjectName, Count (*)
FROM PROJECT;

SELECT *
FROM PROJECT
WHERE MaxHours > AVG (MaxHours);

SELECT ProjectID, ProjectName, MaxHours,
       (24.50 * MaxHours) AS MaxProjectCost
FROM PROJECT
WHERE Department IN ("Administration", "Finance", "Accounting");

SELECT Department, Count(*) AS NumberOfEmployees
FROM EMPLOYEE
GROUP BY Department;

SELECT Department, Count(*) AS NumberOfEmployees
FROM EMPLOYEE
GROUP BY Department
HAVING COUNT (*) > 1;

SELECT Department, Count(*) AS NumberOfEmployees
FROM EMPLOYEE
WHERE EmployeeNumber <= 10
GROUP BY Department
HAVING Count (*) >1;

SELECT FirstName, LastName
FROM EMPLOYEE
WHERE EmployeeNumber IN (6, 10, 11, 16, 17);

SELECT DISTINCT EmployeeNumber
FROM ASSIGNMENT
WHERE HoursWorked >50;

SELECT FirstName, LastName
FROM EMPLOYEE
WHERE EmployeeNumber IN
      (SELECT DISTINCT EmployeeNumber
       FROM ASSIGNMENT
       WHERE HoursWorked > 50);

SELECT DISTINCT ProjectID
FROM PROJECT
WHERE Department = "Accounting";

SELECT DISTINCT EmployeeNumber
FROM ASSIGNMENT
WHERE HoursWorked > 40
   AND ProjectID IN
      (SELECT ProjectID
      FROM Project
      WHERE Department = "Accounting");

SELECT FirstName, LastName
FROM EMPLOYEE
WHERE EmployeeNumber IN
      (SELECT DISTINCT EmployeeNumber
      FROM ASSIGNMENT
      WHERE HoursWorked > 40
      AND ProjectID IN
      (SELECT ProjectID
      FROM PROJECT
      WHERE Department = "Accounting"));
      

SELECT FirstName, LastName, ProjectID, HoursWorked
FROM EMPLOYEE, ASSIGNMENT;

SELECT FistName, LastName, ProjectID, HoursWorked
FROM EMPLOYEE, ASSIGNMENT
WHERE EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber;

SELECT FistName, LastName, ProjectID, HoursWorked
FROM EMPLOYEE, ASSIGNMENT
WHERE EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber
ORDER BY EMPLOYEE.EmployeeNumber, ProjectID;


SELECT FistName, LastName, ProjectID, HoursWorked
FROM EMPLOYEE, ASSIGNMENT
WHERE EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber
ORDER BY EMPLOYEE.EmployeNumber, ProjectID;


SELECT FistName, LastName, ProjectID, HoursWorked
FROM EMPLOYEE, ASSIGNMENT
ON EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber
ORDER BY EMPLOYEE.EmployeeNumber, ProjectID;

SELECT FirstName, LastName, SUM (HoursWorked) AS TotalHoursWorked
FROM EMPLOYEE AS E JOIN ASSIGNMENT AS A 
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY LastName, FirstName
Order BY LastName, FistName;

SELECT FirstName, LastName, ProjectID, HoursWorked
FROM EMPLOYEE AS E JOIN ASSIGNMENT AS A
ON E.EmployeeNumber = A.EmployeeNumber
WHERE HoursWorked > 50
ORDER BY LastName, FirstName, ProjectID;

SELECT ProjectName, FirstName, LastName, HoursWorked
FROM EMPLOYEE AS E JOIN ASSIGNMENT AS A
ON E.EmployeeNumber = A.EmployeeNumber
JOIN PROJECT AS P
ON A.ProjectID = P.ProjectID
ORDER BY P.ProjectID = A.EmployeeNumber;

SELECT * FROM PROJECT;
       
INSERT INTO PROJECT
       (ProjectName, Department, MaxHours, StartDate)
       VALUES ("2017 Q4 Tax Preparation", "Accounting", 175.00, "10-DEC-17");

SELECT ProjectName, FirstName, LastName, HoursWorked
FROM EMPLOYEE AS E JOIN ASSIGNMENT AS A
ON E.EmployeeNumber = A.EmployeeNumber
JOIN PROJECT AS P
ON A.ProjectID = P.ProjectID
ORDER BY P.ProjectID = A.EmployeeNumber;
