-- looking up patient on last name
CREATE INDEX idx_patient_lastname ON patient(last_name);
-- looking up patient on first name 
CREATE INDEX idx_patient_firstname ON patient(first_name);
-- looking up patient on date of birth
CREATE INDEX idx_patient_dob ON patient(date_of_birth);
-- with all the information
CREATE INDEX idx_patient_name_dob 
ON patient(last_name, first_name, date_of_birth);

