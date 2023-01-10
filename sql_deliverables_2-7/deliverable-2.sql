-- Deliverable 2
DROP VIEW IF EXISTS Roberts_Patient;
CREATE VIEW Roberts_Patient AS SELECT PATIENT.First_Name, PATIENT.Last_Name, PATIENT.Primary_Phone_Number
								FROM (SELECT Patient_SSN
										FROM APPOINTMENT
										WHERE Doctor_ID = 'RO1000') AS SOCIAL
								INNER JOIN PATIENT
								ON SOCIAL.Patient_SSN = PATIENT.SSN;
