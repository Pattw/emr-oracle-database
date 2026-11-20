-- Showing a patients Information
SELECT * FROM patient
WHERE patient_id = 23;

-- Showing all the appointments for the patient
SELECT appointment_id, appointment_date, reason, status
FROM appointment
WHERE patient_id = 23;

-- Show the doctor info for the appointment 

SELECT d.doctor_id, d.first_name, d.last_name, d.specialization
FROM doctor d
JOIN appointment a ON d.doctor_id = a.doctor_id
WHERE a.appointment_id = 43;

-- Showing the medical records for that appointment
SELECT * FROM medical_record
WHERE appointment_id = 43;

-- Showing the billing information 

SELECT * FROM billing
WHERE appointment_id = 43;

-- Showing prescriptions 

SELECT * FROM prescription
WHERE record_id = 43;

-- Trigger 

INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (999, 13, 3, '10mg', 'Take once a day');

INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status)
VALUES (999, 101, 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'Prescription Refill', 'Scheduled');

DELETE FROM patient
WHERE patient_id = 23;


SELECT index_name, table_name
FROM user_indexes
WHERE table_name = 'PATIENT';


SELECT * FROM vw_appointment_details
WHERE pt_id = 23;

SELECT * FROM vw_full_medical_history
WHERE PT_ID = 23;

SELECT * FROM vw_billing_summary
WHERE PT_ID = 23; 



SELECT 
    p.first_name || ' ' || p.last_name AS patient_name,
    d.first_name || ' ' || d.last_name AS doctor_name,
    a.appointment_date,
    a.reason
FROM appointment a
JOIN patient p ON a.patient_id = p.patient_id
JOIN doctor d  ON a.doctor_id = d.doctor_id
WHERE a.appointment_id = 43;


SELECT insurance_used, COUNT(*) AS num_claims, SUM(amount) AS total_amount
FROM billing
GROUP BY insurance_used;


SELECT 
    p.prescription_id,
    m.generic_name,
    m.brand_name,
    p.dosage,
    p.instructions
FROM prescription p
JOIN medical_record mr ON p.record_id = mr.record_id
JOIN medication m      ON p.med_id = m.med_id
WHERE mr.patient_id = 23;