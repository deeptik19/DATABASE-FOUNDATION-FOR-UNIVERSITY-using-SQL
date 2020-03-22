-- Made by: Deepti Kulkarni

Create database schedule;
USE schedule;

Create Table Student 
(NetID Varchar(20) not null,			
StudentName varchar(20) not null,			
Major Varchar(20) not null,					
GraduationSemester varchar(20),				
GraduationGrade char(2),					
ResOrNonRes char(2),				
StudentEmail varchar(50),	
Contact_No decimal(10,0),			
DOB Date,						
Constraint Net_Pk PRIMARY KEY(NetID));	

Create Table Department
(DepartmentID varchar(20) not null,				
DepartmentName varchar(100) not null,								
HOD Varchar(20) not null,								
CONSTRAINT DepartmentID_FK PRIMARY KEY(DepartmentID));			


Create Table Course
(CourseID Varchar(20) not null,							
DepartmentID Varchar(20) not null,						
CourseName Varchar(100) not null,						
CourseBook Varchar(100),										
BookPublisher Varchar(100),										
ClassRoom Varchar(20),										
ClassCredit decimal(3,0),	
CreditHours decimal(4,0),									
Constraint CourseID_PK PRIMARY KEY(CourseID),													
CONSTRAINT DepartmentID_FK1 FOREIGN KEY(DepartmentID) References Department(DepartmentID));										

Create Table Instructor
(InstructorID Varchar(20) not null,						
DepartmentID varchar(20) not null,							
InstructorName Varchar(100),								
position varchar(100),
salary decimal(11,0),								
email varchar(100),						
Qualification varchar(20),							
Office varchar(20),							
DOJ date,									
ContactNo decimal(10,0),						
CONSTRAINT InstructorID_PK PRIMARY KEY(InstructorID),	
CONSTRAINT DepartmentID_FK2 FOREIGN KEY(DepartmentID) References Department(DepartmentID));						

Create Table Class 
(ClassID Varchar(20) not null,						
InstructorID Varchar(20) not null,				
CourseID varchar(20) not null,	
CourseYear integer,	
Constraint ClassID_PK Primary Key(ClassID),
Constraint InstructorID_FK  Foreign key(InstructorID) references Instructor(InstructorID),						
CONSTRAINT CourseID_FK FOREIGN KEY(CourseID) References Course(CourseID));

Create Table Enroll
(EnrollmentID Varchar(20) not null,						
NetID Varchar(20) not null,
ClassID varchar(20) not null,					
Constraint EnrollmentID_PK PRIMARY KEY(EnrollmentID),					
CONSTRAINT NetID_FK FOREIGN KEY(NetID) References Student(NetID),
Constraint ClassID_FK FOREIGN KEY(ClassID) References Class(ClassID));											

insert into Student values
('eu8293','Deepti Kulkarni','Business Analytics','Fall 2019','A','R','dkulkarni2@horizon.csueastbay.edu',4235727651,'03-01-1994'),
('eu8294','Nishtha Taneja','Business Analytics','Fall 2019','A','NR','ntaneja@horizon.csueastbay.edu',7263987637,'11-02-1992'),
('eu8295','Prasanna Adhikari','Business Analytics','Fall 2019','A','R','padhikari@horizon.csueastbay.edu',9863513243,'07-05-1993'),
('eu8296','Shivani Deshpande','Business Analytics','Spring 2019','A','NR','shivani@horizon.csueastbay.edu',8354765243,'07-12-1991'),
('eu8297','Neha Agarwal','Business Analytics','Spring 2018','A','R','nehaa@horizon.csueastbay.edu',6354725349,'09-5-1990'),
('eu8298','John','Business Analytics','Fall 2019','A','NR','john@horizon.csueastbay.edu',9241337654,'07-05-1993'),
('eu8299','Chauyuan','Business Analytics','winter 2019','A','R','chauyuan@horizon.csueastbay.edu',2315364758,'11-05-1990'),
('eu8300','Pooja','Business Analytics','spring 2019','A','NR','pooja@horizon.csueastbay.edu',8374563512,'10-03-1990'),
('eu8301','Deepika','Business Analytics','spring 2019','A','R','deepika@horizon.csueastbay.edu',8736482345,'01-01-1990');

insert into Department values
(1,'College of Business and Economics', 'Jiming wu'),
(2,'College of Education and Allied Studies', 'Lan wang'),
(3,'College of Letters, Arts, and Social Sciences', 'Chonqui wu'),
(4,'College of Science', 'Jyotishka ray');

insert into Course values
('BAN 610', '1', 'Database mgmt and applications','Modern database management','Jeff Hoffer','146',3,40.5),
('BAN 675', '1', 'Text Mining','Text mining and application','Charles Anderson','q146',3,40.5),
('BAN 620', '1', 'Data Mining','Data Minig and applications','Jeff Hoffer','vbt146',3,40.5),
('BAN 622', '1', 'Optimization method','Optimization methods','Joel Hoffer','vbt147',3,40.5),
('BAN 623', '1', 'Time series','Time series analytics','Jiming Hoffer','vbt116',3,40.5),
('BAN 624', '1', 'Big data','Big data and applications','Venkat','vbt16',3,40.5),
('BAN 601', '1', 'Technology fundamental for analytics','Python for everyone','Charles R. Severance','121',3,40.5),
('BAN 602', '1', 'Quantitative fundamentals for analytics','Statistics for business and economics','Anderson','111',3,40.5),
('BAN 612', '1', 'Data analytics','Data science from scrach','Joel Grus','126',3,40.5);

insert into Instructor values
('e1','1', 'Jyotishka Ray','professor',$126000.34,'ray@horizon.csueastbay.edu','Phd','ss123','12-03-2010',1243765987),
('a5','1', 'Lang wang','professor',$26000.34,'lwang@horizon.csueastbay.edu','Phd','ns123','02-03-2001',2243765987),
('a6','1', 'Peng xie','professor',$26000.34,'pengxie@horizon.csueastbay.edu','Phd','eu123','02-03-2001',8243765987),
('f1','1', 'Jimming wu','professor',$226000.34,'jimmimgwu@horizon.csueastbay.edu','Phd','vbt123','10-03-2012',3443765987),
('y2','1', 'Chonqui wu','professor',$56000.34,'cwu@horizon.csueastbay.edu','Phd','vbt43','11-03-2015',4243765987);

insert into Class values
('BAN 610 1','e1','BAN 610',2018),
('BAN 610 2','e1','BAN 610',2018),
('BAN 601 1','f1','BAN 601',2018),
('BAN 601 2','a5','BAN 601',2018),
('BAN 622 1','y2','BAN 622',2018),
('BAN 675 1','f1','BAN 675',2018),
('BAN 620 1','a5','BAN 620',2018),
('BAN 623 1','a6','BAN 623',2018),
('BAN 624 1','f1','BAN 624',2018),
('BAN 602 1','y2','BAN 602',2018),
('BAN 602 2','y2','BAN 602',2018),
('BAN 612 1','a5','BAN 612',2018),
('BAN 612 2','a5','BAN 612',2018);
				
insert into Enroll values
(1,'eu8293','BAN 610 1'),
(2,'eu8293','BAN 601 1'),
(3,'eu8293','BAN 602 1'),
(4,'eu8293','BAN 622 1'),
(5,'eu8293','BAN 623 1'),
(6,'eu8293','BAN 675 1'),
(7,'eu8293','BAN 612 1'),
(8,'eu8293','BAN 620 1'),
(9,'eu8293','BAN 624 1'),
(10,'eu8294','BAN 610 1'),
(11,'eu8295','BAN 675 1'),
(12,'eu8296','BAN 612 1'),
(13,'eu8296','BAN 675 1'),
(14,'eu8298','BAN 610 1'),
(15,'eu8300','BAN 601 1');


--1. Count the number of students who are graduating in the same semester.

select GraduationSemester,Count(GraduationSemester) as totalStudent
from Student group by GraduationSemester;


--2. Display the students name and major who have taken BAN 610

 Select Student.StudentName, Student.Major,Class.CourseID,Enroll.ClassID
 from Student inner join Enroll on Student.NetID = Enroll.NetID  
 inner join
  Class 
  on Class.ClassID = Enroll.ClassID
  where  Class.CourseID = 'BAN 610';


 --3. Display the NetID and student name of the students who have taken more than 8 courses in year 2018 
 --(adjust the number of courses taken so that the query returns at least one result).


 select Student.StudentName ,Count(Enroll.NetId) as count1, Enroll.NetId 
 from Enroll, Student where Enroll.NetID = Student.NetID 
 group by Enroll.NetID,Student.StudentName having Count(Enroll.NetID)>8; 


--4. Display the NetID and the total credit hours taken by each student in 2018.


  SELECT distinct(Enroll.NetID), Sum(CreditHours) as totalhrs 
  from Course inner join Class
  on Course.CourseID = Class.CourseID
  inner join Enroll
  on Class.ClassID= Enroll.ClassID
  group by Enroll.NetID;


  
 --5. Display the instructors name and the number of course books prescribed by each instructor.


 select distinct(Instructor.InstructorName), Course.CourseBook as "Number of course books"
  from Course inner join Class 
  on Class.CourseID = Course.CourseID 
  inner join Instructor
   on Instructor.InstructorID = Class.InstructorID
group by Instructor.InstructorName, Course.CourseID ;

