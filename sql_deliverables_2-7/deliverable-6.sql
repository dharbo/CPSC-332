-- Deliverable 6
DROP TRIGGER IF EXISTS AuditSpecialty_UPDATE;
CREATE TRIGGER AuditSpecialty_UPDATE AFTER UPDATE ON DOCTOR for each row
    INSERT INTO AUDIT (Doctor_ID, Doctor_Name, Audit_Action, Specialty, Date_Modified)
		VALUE( NEW.Doctor_ID, NEW.First_Name, 'Update' , NEW.Specialty, curdate());

DROP TRIGGER IF EXISTS AuditSpecialty_INSERT;
CREATE TRIGGER AuditSpecialty_INSERT AFTER INSERT ON DOCTOR for each row
    INSERT INTO AUDIT (Doctor_ID, Doctor_Name, Audit_Action, Specialty, Date_Modified)
		VALUE( NEW.Doctor_ID, NEW.First_Name, 'Insert' , NEW.Specialty, curdate());
