-- Question 1 ####################################################
-- List all active male students assigned to Advisors 1 or 3 (Fred Stone or Jack Simpson).

SELECT * FROM Students
WHERE
      Gender = 'M'
AND 
      (AdvisorID = 1 OR AdvisorID = 3);

-- Question 2 ####################################################
-- Provide a list of all students without a biography.

SELECT * FROM Students
WHERE Bio = '';

-- Question 3 ####################################################
--What classes are in the English department?

SELECT * FROM Classes
WHERE ClassCode LIKE '%ENG%';

-- Question 4 ####################################################
-- Create a list of all students and their advisors. Sort by the advisor’s name and then the student’s name. Include the student’s birth date, gender, and GPA.
SELECT DISTINCT Advisors.AdvisorID, Advisors.Firstname, Advisors.LastName, Students.FirstName, Students.LastName, Students.Gender, Students.GPA, Students.BirthDate, Students.AdvisorID
FROM Advisors
LEFT JOIN Students ON Advisors.AdvisorID = Students.AdvisorID
ORDER BY Advisors.LastName, Students.LastName
;

-- Question 5 ####################################################
-- How many students were born in the 1980s?

SELECT COUNT(*) FROM Students
WHERE BirthDate LIKE '%198%';
     

-- Question 6 ####################################################
-- Write a query to show the average GPA by gender.

SELECT Gender, AVG(GPA) FROM Students
GROUP BY Gender;

-- Question 7 ####################################################
-- Provide a list of all advisors and the number of active students assigned to each. Filter out any advisors with more than 1 student.
