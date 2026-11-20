-- List all appointments with doctors + patient names 
-- This uses joins + order by 
SELECT
    a.appointment_id,
    a.appointment_date,
    d.first_name || ' ' || d.last_name AS doctor_name,
    p.first_name || ' ' || p.last_name AS patient_name,
    a.status
FROM appointment a
JOIN doctor d ON a.doctor_id = d.doctor_id
JOIN patient p ON a.patient_id = p.patient_id
ORDER BY a.appointment_date;

-- counting how many patients each doctor has seen using group by + count

SELECT
    d.doctor_id,
    d.first_name || ' ' || d.last_name AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctor d
LEFT JOIN appointment a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY total_appointments DESC;

-- Finding out which patients have 2 or more prescriptions 

SELECT
    p.patient_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    COUNT(pr.prescription_id) AS total_prescriptions
FROM patient p
JOIN medical_record mr ON p.patient_id = mr.patient_id
JOIN prescription pr ON mr.record_id = pr.record_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING COUNT(pr.prescription_id) >= 2;


-- finding ot which bills are unpaid over $200 using where + join 

SELECT
    b.bill_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    b.amount,
    b.payment_status
FROM billing b
JOIN patient p ON b.patient_id = p.patient_id
WHERE b.payment_status = 'Pending'
  AND b.amount > 200;

  -- finding out what medications were prescribed by cardiology doctor only using distinct

SELECT DISTINCT
    m.med_id,
    m.generic_name,
    m.brand_name
FROM medication m
JOIN prescription pr ON m.med_id = pr.med_id
JOIN medical_record mr ON pr.record_id = mr.record_id
WHERE mr.doctor_id IN (
    SELECT doctor_id
    FROM doctor
    WHERE dept_id = 2   -- Cardiology
);

-- total billed grouped by insurance company using sum + group by 

SELECT
    p.insurance_provider,
    SUM(b.amount) AS total_billed
FROM billing b
JOIN patient p ON b.patient_id = p.patient_id
GROUP BY p.insurance_provider
ORDER BY total_billed DESC;


-- Upcoming appointments 

SELECT
    a.appointment_id,
    a.appointment_date,
    p.first_name || ' ' || p.last_name AS patient_name,
    d.first_name || ' ' || d.last_name AS doctor_name
FROM appointment a
JOIN patient p ON a.patient_id = p.patient_id
JOIN doctor d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date BETWEEN SYSDATE AND SYSDATE + 7
ORDER BY a.appointment_date;


-- using the view of patient full medical history 

SELECT
    pt_name,
    doc_name,
    condition,
    appt_date,
    med_generic,
    dosage
FROM vw_full_medical_history
WHERE pt_id = 1
ORDER BY appt_date DESC;

-- list doctors and the medications they are allowed to prescibe uses the department + formulary 

SELECT
    d.doctor_id,
    d.first_name || ' ' || d.last_name AS doctor_name,
    dept.dept_name,
    m.generic_name AS allowed_med
FROM doctor d
JOIN department dept ON d.dept_id = dept.dept_id
JOIN department_formulary f ON dept.dept_id = f.dept_id
JOIN medication m ON f.med_id = m.med_id
ORDER BY d.doctor_id, m.generic_name;


