CREATE DATABASE Hospital

USE Hospital

CREATE TABLE Speciallites(
Id int primary key identity,
Category nvarchar(50)
)

INSERT INTO Speciallites
Values('Allergist'),
      ('Cardiologist'),
	  ('Dermatologists'),
	  ('Nevrology')

CREATE TABLE Doctors(
Id int primary key identity,
fULLName nvarchar(50),
SpeciallityId int references Speciallites(Id)
)

INSERT INTO Doctors
Values('Nagiyev Ferid',3),
      ('Allahverdiyeva Aygun',1),
	  ('Abbasova Lale',4),
	  ('Nuriyev Yahya',2)


CREATE TABLE RoomTypes(
Id int primary key identity,
Name nvarchar (100)
)
INSERT INTO RoomTypes
Values('Rentgen room'),
      ('Treatment room'),
	  ('Intensive care room'),
	  ('Surgery room')

CREATE TABLE Rooms(
Id int primary key identity,
NumberRoom int ,
RoomTypeId int references RoomTypes(Id)
)

INSERT INTO Rooms
Values(120,1),
      (121,1),
	  (122,1),
	  (200,2),
	  (201,2),
	  (202,2),
	  (300,3),
	  (301,3),
	  (302,3),
	  (400,4),
	  (401,4),
	  (402,4)

CREATE TABLE Pacients(
Id int primary key identity,
FullName nvarchar(70),
DoctorId int references Doctors(Id)
)
INSERT INTO Pacients
Values('Abbasova Gunel',1),
      ('Rustemzade Zahra',3),
	  ('Eliyev Yusif',2),
	  ('Babayev Baxtiyar',4)

CREATE TABLE Insurances(
Id int primary key identity,
Name nvarchar(90)
)

INSERT INTO Insurances
Values('Pasha'),
      ('Azer'),
	  ('Xalq')

CREATE TABLE PatientInsurances(
Id int primary key identity,
PacientId int references Pacients(Id),
InsurenceId int references Insurances(id)
)
INSERT INTO PatientInsurances
Values(1,3),
      (2,4),
	  (2,1),
	  (3,3),
	  (4,3),
	  (1,2)
CREATE TABLE Departments(
Id int primary key identity,
Name nvarchar(100),
PacientId int references Pacients(Id),
DoctorId int references Doctors(Id),
RoomId int references Rooms(Id),
SpecialistId int references Speciallites(id)
)

INSERT INTO Departments
Values('Estetic',2,3,1,3),
      ('Cardiology',4,4,2,2),
	  ('Neurology',3,1,3,4)
	  

SELECT p.FullName 'Patient Name',i.Name 'Insuarence type', de.Name 'Department Name',d.fULLName 'Doctor Name',rt.Name 'Room Type',r.NumberRoom 'Number of room' FROM Insurances i 
JOIN  PatientInsurances pi
on i.id=pi.InsurenceId
JOIN Pacients  p
on p.id=pi.PacientId
JOIN Doctors d
on d.Id=p.DoctorId
JOIN Speciallites s
on s.id=d.SpeciallityId
JOIN Departments de
on s.id=de.SpecialistId
JOIN Rooms r
on r.id=de.RoomId
JOIN RoomTypes rt
on r.RoomTypeId=rt.Id


