USE University;

CREATE TABLE Advisors(
    AdvisorID INT IDENTITY NOT NULL PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    EmailAddr VARCHAR(50) NOT NULL
)
CREATE TABLE Students(
    StudentID INT NOT NULL IDENTITY PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    BirthDate DATE NOT NULL,
    --BirthDate DATE MASKED WITH(FUNCTION = 'default()') NOT NULL, # Class version doesn't support data masking.
    Gender NCHAR(1) CHECK (Gender in ('M','F')),
    StartDate DATE NOT NULL,
    GPA DECIMAL(3,2) NOT NULL CHECK(GPA >= 0.00 AND GPA <= 4.00),
    IsActive BIT NOT NULL,
    Bio VARCHAR(MAX),
    AdvisorID INT FOREIGN KEY REFERENCES Advisors(AdvisorID)
)

CREATE TABLE Classes(
    ClassID INT IDENTITY NOT NULL PRIMARY KEY,
    ClassCode VARCHAR(20) NOT NULL,
    ClassName VARCHAR(100) NOT NULL,
    Description VARCHAR(MAX) NOT NULL
)

CREATE TABLE Student_Classes(
    StudentClassID INT IDENTITY NOT NULL PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    ClassID INT FOREIGN KEY REFERENCES Classes(ClassID),
    StartDate DATE NOT NULL,
    Assignment1 DECIMAL(5,2) NOT NULL CHECK(Assignment1 >= 0 and Assignment1 <= 100),
    Assignment2 DECIMAL(5,2) NOT NULL CHECK(Assignment2 >= 0 and Assignment2 <= 100),
    Assignment3 DECIMAL(5,2) NOT NULL CHECK(Assignment3 >= 0 and Assignment3 <= 100),
    Assignment4 DECIMAL(5,2) NOT NULL CHECK(Assignment4 >= 0 and Assignment4 <= 100),
    ClassGPA DECIMAL(3,2) NOT NULL CHECK(ClassGPA >= 0.00 AND ClassGPA <= 4.00)
)

CREATE TRIGGER GPA_Calculate 
ON Student_Classes
AFTER INSERT OR UPDATE
AS 