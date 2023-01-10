-- Deliverable 4 
DROP VIEW IF EXISTS Specialty;
CREATE VIEW Specialty AS SELECT DR.First_Name, DR.Last_Name, DR.Specialty FROM DOCTOR DR WHERE DR.Specialty IS NOT NULL;
