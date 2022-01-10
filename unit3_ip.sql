INSERT INTO Advisors (FirstName, LastName, EmailAddr)
VALUES 
 ('Bob', 'Gordon', 'bob@college.edu'),
 ('Fred', 'Stone', 'fred@college.edu'),
 ('Jack', 'Simpson', 'jack@college.edu')
 ;

--#####################################################################################
INSERT INTO Classes (ClassCode, ClassName, Description)
VALUES
 ('ACCTR306', 'Accounting 1', 'This course introduces accounting concepts and explores the accounting environment. It covers the basic structure of accounting, how to maintain accounts, use account balances to prepare financial statements, and complete the accounting cycle. It also introduces the concept of internal control and how to account for assets.'),
 ('CS362', 'Structured Query Language for Data Management', 'This course gives complete coverage of SQL, with an emphasis on storage, retrieval, and manipulation of data.'),
 ('ENG115', 'English Composition', 'In this course, students focus on developing writing skills through practice and revision. Students will examine expository, critical, and persuasive essay techniques.'),
 ('FIN322', 'Investments', 'This course focuses on investments and investment strategies. Various investment vehicles such as stocks, bonds, and commodities are examined. Students will explore the principles of security analysis and valuation.')
;

--#####################################################################################
INSERT INTO Students (FistName, LastName, BirthDate, Gender, StartDate, GPA, IsActive, Bio, AdvisorID)
VALUES
 ('Craig', 'Franklin', '1970-03-15', 'M', '2010-05-30', 3.10, 1, '', 3),
 ('Harriet', 'Smith', '1982-04-15', 'F', '2010-05-30', 3.22, 1, '', 1),
 ('George', 'David', '1984-11-05', 'M', '2010-10-01', 0.00, 1, '', 3),
 ('Ben', 'Jefferson', '1976-09-25', 'M', '2009-02-21', 1.80, 0, 'The student has gone on temporary leave to pursue other opportunities but plans on returning in 1 year.', 3)
 ;

--#####################################################################################
DELETE FROM Classes 
WHERE ClassName = 'Investments';

--#####################################################################################
UPDATE Students 
SET BirthDate = '1982-04-25', 
    GPA = 3.25 
WHERE 
    (FirstName = 'Harriet' AND LastName = 'Smith');

--What if there is more than one person with same first/lastname?