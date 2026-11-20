-- When a new prescription is inserted the trigger will 
-- look up the doctor from the medical record
-- check the doctors department 
-- check if the department is allowed to prescribe the medication
-- if not ill block the insert and show a clear error


CREATE OR REPLACE TRIGGER trg_validate_prescription
BEFORE INSERT ON prescription
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the medication is allowed for the doctor's department
    SELECT COUNT(*)
    INTO v_count
    FROM medical_record mr
    JOIN doctor d
        ON mr.doctor_id = d.doctor_id
    JOIN department_formulary f
        ON d.dept_id = f.dept_id
    WHERE mr.record_id = :NEW.record_id
      AND f.med_id = :NEW.med_id;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Doctor is not authorized to prescribe this medication.');
    END IF;
END;

-- Prevents trying to schedule an appt in the past 
CREATE OR REPLACE TRIGGER trg_no_past_appointments
BEFORE INSERT OR UPDATE ON appointment
FOR EACH ROW
BEGIN
    IF :NEW.appointment_date < SYSDATE THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Cannot schedule an appointment in the past.'
        );
    END IF;
END;
/

-- This prevents deletion of a medical record if a patient has a medical record then we cannot delete them.. 
CREATE OR REPLACE TRIGGER trg_patient_delete_block
BEFORE DELETE ON patient
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM medical_record
    WHERE patient_id = :OLD.patient_id;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Cannot delete patient with existing medical records.'
        );
    END IF;
END;
/