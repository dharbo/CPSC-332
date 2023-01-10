-- Deliverable 3 
DROP VIEW IF EXISTS Medication;
CREATE VIEW Medication AS SELECT DR.First_Name, DR.Last_Name FROM DOCTOR DR, PRESCRIPTION PR WHERE PR.Prescribed_by = DR.Doctor_ID AND PR.Drug_Name = 'Vicodin'; 
