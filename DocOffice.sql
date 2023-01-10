-- Create DocOffice database
DROP DATABASE IF EXISTS DocOffice;
CREATE DATABASE DocOffice;
USE DocOffice;

-- Create DOCTOR
DROP TABLE IF EXISTS DOCTOR;
CREATE TABLE DOCTOR (
	Doctor_ID	varchar(6)	not null,
    Last_Name	varchar(20)	not null,
    First_Name	varchar(20)	not null,
    Phone_Number	char(10) not null,
    Specialty	varchar(30) null,
    Salary	decimal(10,2),
    primary key (Doctor_ID)
);

-- CREATE PATIENT
DROP TABLE IF EXISTS PATIENT;
CREATE TABLE PATIENT (
	SSN char(9) not null,
    Last_Name	varchar(20)	not null,
    First_Name	varchar(20)	not null,
    Primary_Phone_Number	char(10)	not null,
    Street_Name	varchar(30)	not null,
    Street_Number	varchar(15)	not null,
    City	varchar(30)	not null,
    Zip_Code	char(5)	not null,
    Insurance_ID	varchar(12),
    primary key (SSN)
);

-- CREATE PRESCRIPTION
DROP TABLE IF EXISTS PRESCRIPTION;
CREATE TABLE PRESCRIPTION (
	Prescription_ID	varchar(10)	not null,
    Drug_Name	varchar(25)	not null,
    Dosage	varchar(8) not null,
    Number_of_refills	int	not null,
    Appointment_num varchar(12) not null,
    Most_Recent_Filling	date,
    Prescribed_by	varchar(6)	not null,
    Patient_SSN	char(9)	not null,
    primary key (Prescription_ID),
    foreign key (Prescribed_by) references DOCTOR (Doctor_ID),
    foreign key (Patient_SSN) references PATIENT (SSN)
);

-- CREATE APPOINTMENT
DROP TABLE IF EXISTS APPOINTMENT;
CREATE TABLE APPOINTMENT (
	Appointment_Number	varchar(12)	not null,
    -- Test_Given	varchar(6)	not null,
    Patient_SSN	char(9)	not null,
    Doctor_ID	varchar(6) not null,
    Appointment_Time time	not null,
    Appointment_Date	date	not null,
    Room_number	int	not null,
    primary key (Appointment_Number),
    foreign key (Patient_SSN) references PATIENT (SSN),
	foreign key (Doctor_ID) references DOCTOR (Doctor_ID)
);

ALTER TABLE	PRESCRIPTION
ADD foreign key (Appointment_num) references APPOINTMENT (Appointment_Number);

-- CREATE MEDICAL_TEST
DROP TABLE IF EXISTS MEDICAL_TEST;
CREATE TABLE MEDICAL_TEST (
	Test_ID	varchar(6)	not null,
    Doctor_Name	varchar(20)	not null,
    Doctor_ID	varchar(6)	not null,
    Test_Type	varchar(25)	not null,
    Result	varchar(12)	not null,
    Patient_SSN	char(9)	not null,
    Appointment_num	varchar(12)	not null,
    primary key (Test_ID),
    foreign key (Doctor_ID) references DOCTOR (Doctor_ID),
    foreign key (Patient_SSN) references PATIENT (SSN),
    foreign key (Appointment_num) references APPOINTMENT (Appointment_Number)
);

-- CREATE AUDIT
DROP TABLE IF EXISTS AUDIT;
CREATE TABLE AUDIT (
	Doctor_ID	varchar(6)	not null,
    Doctor_Name	varchar(20)	not null,
    Audit_Action	varchar(15)	not null,
	Specialty varchar(25),
    Date_Modified	date	not null,
    foreign key (Doctor_ID) references DOCTOR (Doctor_ID)
);

-- DOCTOR data
INSERT INTO DOCTOR (Doctor_ID, Last_Name, First_Name, Phone_Number, Specialty, Salary)
VALUES  ('CL1111','Kent','Clark', '6261111111', 'Orthopedic', 350000.00),
		('BR1212', 'Wayne', 'Bruce', '6261112222', 'Anesthesiology', 200000.00),
        ('DI1313', 'Prince', 'Diana', '6261113333', 'Internal medicine', 179000.00),
        ('BA1414', 'Allen', 'Barry', '6261114444', 'Nuclear medicine', 190000.00),
        ('HA1515', 'Jordan', 'Hal', '6261115555', 'General surgeon', 237000.00),
        ('AR1616', 'Curry', 'Arthur', '6261116666', NULL, 185000.00),
        ('RO1000', 'Stevens', 'Robert', '6261234567', 'Family medicine', 215000.00),
        ('JA2316', 'Garrick', 'Jay', '6268761234', NULL, 127000.00);

-- PATIENT data
INSERT INTO PATIENT (SSN, Last_Name, First_Name, Primary_Phone_Number, Street_Name, Street_Number, City, Zip_Code, Insurance_ID)
VALUES ('111223333', 'Jones', 'John', '6261117777', 'Maple Street', '1234', 'Fullerton', '90621', 'ABC123'),
		('222334444', 'Queen', 'Oliver', '6261118888', 'Main Street', '1122', 'Anaheim', '92801', 'BCD234'),
        ('333445555', 'Palmer', 'Ray', '6261119999', '2nd Street', '5678', 'Fullerton', '90621', 'ABB957'),
        ('123456789', 'Kent', 'Clark', '6261111111', '6th Street', '5555', 'Anahiem', '92815', 'CDE228'),
        ('444556666', 'Dibny', 'Ralph', '6262220000', 'Nutwood Avenue', '1111', 'Fullerton', '90621', 'ABC909'),
        ('555667777', 'Stewart', 'John', '6263330000', 'Chapman Avenue', '9912', 'Santa Ana', '92705', 'DDF2846'),
        ('998887777', 'Batson', 'Billy', '6269871111', '1st Street', '9327', 'Tustin', '92616', 'VXZ1200'),
        ('666442222', 'Nelson', 'Kent', '6268762222', 'Whiiter Boulevard', '2301', 'Whittier', '90450', 'QWE0192');
        
-- APPOINTMENT data
INSERT INTO APPOINTMENT (Appointment_Number, Patient_SSN, Doctor_ID, Appointment_Time, Appointment_Date, Room_number)
VALUES ('12345ABC', '111223333', 'CL1111', '12:00:00', '2021-12-20', 4),
		('12345BCD', '222334444', 'RO1000', '11:15:00', '2022-02-20', 1),
        ('12345CDE', '123456789', 'RO1000', '11:55:00', '2022-02-20', 2),
        ('12345XYZ', '333445555', 'BA1414', '13:30:00', '2022-04-07', 14),
        ('12345DEF', '555667777', 'BR1212', '10:00:00', '2022-01-15', 6),
        ('12345DEG', '555667777', 'HA1515', '11:00:00', '2022-01-15', 8),
        ('98765LKJ', '998887777', 'BA1414', '09:20:00', '2022-05-03', 3),
        ('87230AAA', '444556666', 'AR1616', '14:00:00', '2022-07-14', 1);

-- MEDICAL_TEST data
INSERT INTO MEDICAL_TEST (Test_ID, Doctor_Name, Doctor_ID, Test_Type, Result, Patient_SSN, Appointment_num)
VALUES ('AAA987', 'Clark', 'CL1111', 'Bone Scan', 'Negative', '111223333', '12345ABC'),
		('AAA997',  'Barry', 'BA1414', 'Antiglobulin Test', 'Negative', '111223333', '12345ABC'),
		('LPC284', 'Barry', 'BA1414', 'Antiglobulin Test', 'Positive', '998887777', '98765LKJ'),
        ('KLD873', 'Robert', 'RO1000', 'Stress Test', 'Negative', '123456789', '12345CDE'),
        ('VNW240', 'Arther', 'AR1616', 'Sickle Cell Test', 'Negative', '444556666', '87230AAA'),
        ('GKS615', 'Hal', 'HA1515', 'Kidney Scan', 'Positive', '555667777', '12345DEG');
        
-- PRESCIPTION data
INSERT INTO PRESCRIPTION (Prescription_ID, Drug_Name, Dosage, Number_of_refills, Appointment_num, Most_Recent_Filling, Prescribed_by, Patient_SSN)
VALUES ('ZY912875', 'Metformin', '5mg', 2, '12345ABC', '2022-01-01', 'CL1111', '111223333'),
		('ZY912876', 'Vicodin', '5mg', 2, '12345ABC', '2022-01-01', 'CL1111', '111223333'),
		('ZY912877', 'Vicodin', '10mg', 1, '12345BCD', '2022-02-25', 'RO1000', '222334444'),
        ('XY123456', 'Lipitor', '5mg', 3, '12345DEF', '2022-01-25', 'BR1212', 555667777),
        ('XY123459', 'Albuterol', '8mg', 1, '12345DEF', '2022-01-25', 'BR1212', '555667777'),
        ('LM762388', 'Amoxicillin', '10mg', 0, '12345CDE', '2022-03-01', 'RO1000', '123456789');

-- AUDIT data
INSERT INTO AUDIT (Doctor_ID, Doctor_Name, Audit_Action, Specialty, Date_Modified)
VALUES ('CL1111', 'Clark', 'Update', 'Orthopedic', '2021-07-12'),
		('DI1313', 'Diana', 'Add', 'Internal medicine', '2021-10-23'),
        ('HA1515', 'Hal', 'Add', 'General surgeon', '2021-11-02'),
        ('BR1212', 'Bruce', 'Update', 'Anesthesiology', '2021-10-13'),
        ('BA1414', 'Barry', 'Add', 'Nuclear medicine', '2021-09-27'),
        ('RO1000', 'Robert', 'Update', 'Family medicine', '2018-02-13');
