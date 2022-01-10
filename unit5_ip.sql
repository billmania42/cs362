/*
Using the database completed so far, extend the design to accommodate degree programs. 
The new design should incorporate the following functionalities:

A degree has a name and description.
What degree is the student working towards? A student can only work on one degree at a time.
What classes are necessary to obtain a specific degree?
Provide the DDL script to add the tables for the new design changes. 
Include an updated diagram that shows all the tables in the system.
Write the DML script to insert 3 test records in each of the tables in the system. 
This data will be necessary to write the queries in the next assignment.
Copy and paste the work into your Key Assignment document and include screen shots of each step, describe what you did for each step and paste in the actual SQL text used to perform each step. Upload your document to the Submitted Tasks section.
*/
--#############################################################
CREATE TABLE Degree (
    DegreeID INT PRIMARY KEY NOT NULL IDENTITY,
    DegreeName VARCHAR(50) NOT NULL,
    DegreeDescription VARCHAR(MAX)
);

--#############################################################
ALTER TABLE Students
ADD DegreeID INT FOREIGN KEY REFERENCES Degree(DegreeID);

--#############################################################
CREATE TABLE ClassDegree (
    ClassDegreeID INT PRIMARY KEY NOT NULL IDENTITY,
    DegreeID INT FOREIGN KEY REFERENCES Degree(DegreeID),
    ClassID INT FOREIGN KEY REFERENCES Classes(ClassID)
);

--#############################################################
INSERT INTO Degree(DegreeName, DegreeDescription)
VALUES 
('Information Technology', 'The Bachelor of Science in Information Technology (BSIT) degree program provides instruction in computer system architecture, networking, database and security, as well as broad technical subjects such as programming, network management, system administration, cloud computing, IT system development, project management and ethics. This program has a General Track and three concentrations: Network Management, Security, and Software System Engineering.'),
('Nursing', 'The RN to BSN degree completion program at Colorado Technical University is designed to help nurses acquire the knowledge and skills needed to expand their practice options for a variety of clinical and administrative leadership activities and to manage change in an increasingly complex and diverse environment. Building on a foundation of general education and core coursework, the nursing major courses range from a review of the challenges and trends in nursing care to a nursing capstone that will synthesize and apply prior learning. Students fulfill the program''s clinical requirements in their own community during the population health, and health and wellness courses.'),
('Computer Science', 'This degree program is designed for students who are interested in pursuing a career centered on building computer software solutions through programming with algorithmic techniques. Students will explore a broad range of theoretical and practical knowledge, methods, processes, and skills to effectively design and develop computer software according to domain-specific requirements. The curriculum offers broad and detailed knowledge on how a computer’s software works, and how to design and develop different levels and types of computer software.')
;       

--#############################################################
UPDATE Students 
SET DegreeID = 2
WHERE (LastName = 'Franklin' AND Firstname = 'Craig');

--#############################################################
UPDATE Students 
SET DegreeID = 1
WHERE (LastName = 'Smith' AND Firstname = 'Harriet');

--#############################################################
UPDATE Students 
SET DegreeID = 3
WHERE (LastName = 'David' AND Firstname = 'George');

--#############################################################
INSERT INTO ClassDegree(DegreeID, ClassID)
VALUES
(1,1),
(1,2),
(2,1),
(3,1),
(3,2),
(3,3);