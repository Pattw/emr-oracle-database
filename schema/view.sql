-- so we can see the appointment details
CREATE OR REPLACE VIEW vw_appointment_details AS
SELECT
    a.appointment_id AS appt_id,
    a.appointment_date AS appt_date,
    a.reason AS appt_reason,
    a.status AS appt_status,
    a.notes AS appt_notes,
    d.doctor_id AS doc_id,
    (d.first_name || ' ' || d.last_name) AS doc_name,
    d.specialization AS doc_spec,
    d.room_number AS room_no,
    p.patient_id AS pt_id,
    (p.first_name || ' ' || p.last_name) AS pt_name,
    p.insurance_provider AS insurance
FROM appointment a
JOIN doctor d ON a.doctor_id = d.doctor_id
JOIN patient p ON a.patient_id = p.patient_id;
/
-- billing department view so that we can wee what the bill is for the patient and what doctor they seen and if the bill was covered. 
CREATE OR REPLACE VIEW vw_billing_summary AS
SELECT
    b.bill_id AS bill_id,
    b.amount AS amount,
    b.payment_status AS pay_status,
    b.payment_method AS pay_method,
    b.diagnostic_code AS diag_code,
    b.payment_date AS pay_date,
    a.appointment_id AS appt_id,
    a.appointment_date AS appt_date,
    a.reason AS appt_reason,
    p.patient_id AS pt_id,
    (p.first_name || ' ' || p.last_name) AS pt_name,
    p.insurance_provider AS insurance,
    d.doctor_id AS doc_id,
    (d.first_name || ' ' || d.last_name) AS doc_name
FROM billing b
JOIN appointment a ON b.appointment_id = a.appointment_id
JOIN patient p ON b.patient_id = p.patient_id
JOIN doctor d ON a.doctor_id = d.doctor_id;
/

-- The medical records shows the patients doctor, name, condtion, appt date, med, dose all the info you in your medical chart. 
CREATE OR REPLACE VIEW vw_full_medical_history AS
SELECT 
    mr.record_id AS rec_id,
    mr.condition AS condition,
    mr.notes AS rec_notes,
    p.patient_id AS pt_id,
    (p.first_name || ' ' || p.last_name) AS pt_name,
    p.date_of_birth AS dob,
    p.insurance_provider AS insurance,
    d.doctor_id AS doc_id,
    (d.first_name || ' ' || d.last_name) AS doc_name,
    d.specialization AS doc_spec,
    a.appointment_id AS appt_id,
    a.appointment_date AS appt_date,
    a.reason AS appt_reason,
    a.status AS appt_status,
    pr.prescription_id AS rx_id,
    pr.dosage AS dosage,
    pr.instructions AS rx_instr,
    m.med_id AS med_id,
    m.generic_name AS med_generic,
    m.brand_name AS med_brand,
    m.description AS med_desc
FROM medical_record mr
JOIN patient p ON mr.patient_id = p.patient_id
JOIN doctor d ON mr.doctor_id = d.doctor_id
JOIN appointment a ON mr.appointment_id = a.appointment_id
LEFT JOIN prescription pr ON mr.record_id = pr.record_id
LEFT JOIN medication m ON pr.med_id = m.med_id;
/