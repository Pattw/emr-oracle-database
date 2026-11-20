ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER TRIGGER trg_no_past_appointments DISABLE;


-- Table 1: Departments
INSERT INTO department (Dept_ID, Dept_Name) VALUES (1, 'Primary Care');
INSERT INTO department (Dept_ID, Dept_Name) VALUES (2, 'Cardiology');
INSERT INTO department (Dept_ID, Dept_Name) VALUES (3, 'Mental Health');
INSERT INTO department (Dept_ID, Dept_Name) VALUES (4, 'Gynecology');
INSERT INTO department (Dept_ID, Dept_Name) VALUES (5, 'Dermatology'); -- Added for referrals
INSERT INTO department (Dept_ID, Dept_Name) VALUES (6, 'Orthopedics'); -- Added for referrals

-- Table 2: Doctors with all there info
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (101, 'Ramona', 'Singer', 1, '201', 'Family Physician', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (102, 'Austen', 'Kroll', 1, '202', 'Family Physician', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (103, 'Anthony', 'Vance', 2, '301', 'Cardiologist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (104, 'Olivia', 'Grant', 2, '302', 'Cardiologist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (105, 'Kenya', 'Moore', 4, '501', 'Gynecologist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (106, 'Tristin', 'Thompson', 4, '502', 'Gynecologist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (107, 'Madison', 'LeCroy', 3, '401', 'Psychiatrist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (108, 'Ethan', 'Carter', 3, '402', 'Psychiatrist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (109, 'Garcelle', 'Beauvais', 5, '101', 'Dermatologist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (110, 'Patrick', 'Thomas', 5, '101', 'Dermatologist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (111, 'Craig', 'Conover', 3, '403', 'Therapist', 'N');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (112, 'Kathryn', 'Dennis', 3, '404', 'Therapist', 'N');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (113, 'Shep', 'Rose', 6, '601', 'Orthopedist', 'Y');
INSERT INTO doctor (doctor_id, first_name, last_name, dept_id, room_number, specialization, can_prescribe) 
VALUES (114, 'Cameran', 'Eubanks', 6, '601', 'Orthopedist', 'Y');

-- Table 3: Patients with all their info
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (1, 'Luann', 'De Lesseps', TO_DATE('1965-05-17','YYYY-MM-DD'), 'Female', '212-655-1839', '214 Park Ave, New York, NY 10017', 'Aetna', 'AET101189', 'GRP100', TO_DATE('2026-12-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (2, 'Bethenny', 'Frankel', TO_DATE('1970-11-04','YYYY-MM-DD'), 'Female', '212-789-2204', '22 Hudson Blvd, New York, NY 10001', 'UnitedHealthcare', 'UHC102204', 'GRP200', TO_DATE('2026-06-30','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (3, 'Lisa', 'Barlow', TO_DATE('1974-12-14','YYYY-MM-DD'), 'Female', '801-398-4116', '52 Briar Ln, Salt Lake City, UT 84103', 'Cigna', 'CIG108416', 'GRP300', TO_DATE('2027-01-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (4, 'Brian', 'Carter', TO_DATE('1982-02-17','YYYY-MM-DD'), 'Male', '206-345-5678', '408 Elm Dr, Seattle, WA 98101', 'Humana', 'HUM103378', 'GRP100', TO_DATE('2026-05-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (5, 'Meredith', 'Marks', TO_DATE('1972-12-15','YYYY-MM-DD'), 'Female', '801-543-1835', '19 Meadow Ct, Park City, UT 84060', 'Aetna', 'AET107145', 'GRP200', TO_DATE('2027-03-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (6, 'Samuel', 'Davis', TO_DATE('1968-05-21','YYYY-MM-DD'), 'Male', '440-218-4311', '775 Orchard Rd, Cleveland, OH 44114', 'Blue Cross Blue Shield', 'BCBS105311', 'GRP300', TO_DATE('2026-11-30','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (7, 'Chloe', 'Brooks', TO_DATE('1990-12-01','YYYY-MM-DD'), 'Female', '305-728-9123', '612 Pearl Ave, Miami, FL 33139', 'Cigna', 'CIG102123', 'GRP100', TO_DATE('2027-02-28','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (8, 'Noah', 'Green', TO_DATE('1987-10-29','YYYY-MM-DD'), 'Male', '213-256-7070', '43 Harrison St, Los Angeles, CA 90012', 'UnitedHealthcare', 'UHC104070', 'GRP200', TO_DATE('2026-09-30','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (9, 'Ava', 'Morgan', TO_DATE('1993-07-25','YYYY-MM-DD'), 'Female', '323-589-0191', '325 Lakeview Blvd, Los Angeles, CA 90026', 'Blue Cross Blue Shield', 'BCBS106191', 'GRP300', TO_DATE('2026-08-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (10, 'Isaiah', 'Turner', TO_DATE('1979-04-10','YYYY-MM-DD'), 'Male', '310-515-7744', '812 Holly Rd, Long Beach, CA 90805', 'Humana', 'HUM107744', 'GRP100', TO_DATE('2026-12-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (11, 'Emma', 'Schroder', TO_DATE('2002-01-14','YYYY-MM-DD'), 'Female', '216-018-6772', '120 River Way, Cleveland, OH 44102', 'Aetna', 'AET101652', 'GRP200', TO_DATE('2027-01-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (12, 'Derek', 'Lawson', TO_DATE('1985-08-06','YYYY-MM-DD'), 'Male', '440-234-6534', '532 Fair St, Columbus, OH 43215', 'Cigna', 'CIG104298', 'GRP300', TO_DATE('2026-07-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (13, 'Tom', 'Schwartz', TO_DATE('1982-10-16','YYYY-MM-DD'), 'Male', '310-555-3298', '872 Melrose Ave, West Hollywood, CA 90046', 'Blue Cross Blue Shield', 'BCBS106191', 'GRP200', TO_DATE('2027-03-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (14, 'Scheana', 'Shay', TO_DATE('1985-05-07','YYYY-MM-DD'), 'Female', '310-213-4298', '145 Pacific Coast Hwy, Marina del Rey, CA 90292', 'Aetna', 'AET105429', 'GRP300', TO_DATE('2026-07-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (15, 'Katie', 'Maloney', TO_DATE('1987-01-16','YYYY-MM-DD'), 'Female', '424-591-3220', '902 Silverlake Blvd, Los Angeles, CA 90039', 'Blue Cross Blue Shield', 'BCBS108220', 'GRP300', TO_DATE('2026-07-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (16, 'Patricia', 'White', TO_DATE('1986-11-23','YYYY-MM-DD'), 'Female', '513-640-3309', '812 Elmwood Dr, Cincinnati, OH 45202', 'Cigna', 'CIG104298', 'GRP300', TO_DATE('2026-07-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (17, 'Kate', 'Chastain', TO_DATE('1983-01-02','YYYY-MM-DD'), 'Female', '904-655-3128', '19 Harbor View Dr, Melbourne, FL 32901', 'Cigna', 'CIG104298', 'GRP300', TO_DATE('2026-07-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (18, 'Hannah', 'Ferrier', TO_DATE('1986-11-23','YYYY-MM-DD'), 'Female', '61-2-9055-3298', '85 Ocean View Rd, Sydney, NSW 2026', 'Cigna', 'CIG104298', 'GRP300', TO_DATE('2026-07-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (19, 'Tamra', 'Judge', TO_DATE('1967-09-02','YYYY-MM-DD'), 'Female', '949-555-1987', '132 Ocean Breeze Way, Laguna Beach, CA 92651', 'Blue Cross Blue Shield', 'BCBS106987', 'GRP300', TO_DATE('2027-01-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (20, 'Shannon', 'Beador', TO_DATE('1964-03-24','YYYY-MM-DD'), 'Female', '949-555-4729', '52 Newport Blvd, Newport Beach, CA 92660', 'Cigna', 'CIG109472', 'GRP200', TO_DATE('2026-10-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (21, 'Heather', 'Dubrow', TO_DATE('1969-01-05','YYYY-MM-DD'), 'Female', '949-555-9051', '102 Palisades Rd, Newport Coast, CA 92657', 'Aetna', 'AET101905', 'GRP100', TO_DATE('2026-12-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (22, 'Gina', 'Kirschenheiter', TO_DATE('1984-03-11','YYYY-MM-DD'), 'Female', '714-555-8814', '400 Harbor Point Dr, Costa Mesa, CA 92626', 'UnitedHealthcare', 'UHC108814', 'GRP200', TO_DATE('2027-02-28','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (23, 'Kandi', 'Burruss', TO_DATE('1976-05-17','YYYY-MM-DD'), 'Female', '678-555-1734', '44 Cascade Rd, Atlanta, GA 30311', 'Blue Cross Blue Shield', 'BCBS106734', 'GRP300', TO_DATE('2026-09-30','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (24, 'Drew', 'Sidora', TO_DATE('1985-05-01','YYYY-MM-DD'), 'Female', '470-555-1501', '810 Maple Ave, Decatur, GA 30030', 'Humana', 'HUM101501', 'GRP200', TO_DATE('2027-03-31','YYYY-MM-DD'));
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, phone_number, address, insurance_provider, insurance_policy_no, insurance_group_no, insurance_expiration)
VALUES (25, 'Porsha', 'Williams', TO_DATE('1981-06-22','YYYY-MM-DD'), 'Female', '404-555-6221', '1222 Piedmont Ave, Atlanta, GA 30309', 'Aetna', 'AET106221', 'GRP100', TO_DATE('2027-01-31','YYYY-MM-DD'));

-- Table 4: Appointments
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (1, 101, 1, '2025-09-10 09:00:00', 'Annual Physical', 'Completed', 'Normal Checkup.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (2, 102, 3, '2025-09-12 10:30:00', 'Flu Symptoms', 'Completed', 'Viral Infection.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (3, 103, 4, '2025-09-13 11:00:00', 'Chest Pain', 'Completed', 'Hypertension.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (4, 104, 8, '2025-09-15 14:15:00', 'Routine ECG', 'Completed', 'Normal. Discussed diet.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (5, 109, 5, '2025-09-17 09:30:00', 'Acne Treatment', 'Completed', 'Mild Acne.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (6, 113, 9, '2025-09-18 13:00:00', 'Post-surgery Therapy', 'Completed', 'Knee recovery proceeding well.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (7, 101, 10, '2025-09-19 10:00:00', 'Annual Physical', 'Completed', 'Routine checkup.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (8, 108, 2, '2025-09-20 15:00:00', 'Anxiety', 'Completed', 'Adjustment Disorder.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (9, 101, 11, '2025-09-22 09:00:00', 'Cough', 'Completed', 'Acute Bronchitis.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (10, 103, 1, '2025-09-23 11:30:00', 'Heart Follow-up', 'Completed', 'BP controlled.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (11, 104, 4, '2025-09-24 14:45:00', 'High Cholesterol', 'Completed', 'Hyperlipidemia.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (12, 101, 5, '2025-09-25 10:30:00', 'Annual Physical', 'Completed', 'Routine checkup.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (13, 109, 6, '2025-09-26 13:30:00', 'Skin Rash', 'Completed', 'Eczema.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (14, 114, 9, '2025-09-27 14:00:00', 'Shoulder Pain', 'Completed', 'Shoulder Strain.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (15, 108, 3, '2025-09-28 15:30:00', 'Therapy Session', 'Completed', 'General Anxiety.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (16, 102, 7, '2025-09-29 11:00:00', 'Checkup', 'Completed', 'Normal.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (17, 103, 2, '2025-09-30 08:30:00', 'Cardiac Stress Test', 'Completed', 'Normal results.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (18, 109, 8, '2025-10-01 13:45:00', 'Mole Removal', 'Completed', 'Benign nevus removed.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (19, 102, 10, '2025-10-02 11:00:00', 'Ear Infection', 'Completed', 'Otitis Media.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes) 
VALUES (20, 108, 1, '2025-10-03 16:00:00', 'Follow-up Therapy', 'Completed', 'Improved mood noted.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (21, 101, 12, '2025-10-10 10:00:00', 'Annual Physical', 'Completed', 'Routine checkup.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (22, 109, 12, '2025-11-05 15:00:00', 'Rash on arm', 'Completed', 'Mild dermatitis.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (23, 108, 13, '2025-10-11 09:30:00', 'Anxiety evaluation', 'Completed', 'Discussed coping strategies.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (24, 102, 13, '2025-12-02 14:15:00', 'Follow-up visit', 'Completed', 'Patient improving.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (25, 109, 14, '2025-10-15 13:45:00', 'Full skin check', 'Completed', 'No concerning lesions found.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (26, 105, 14, '2025-11-12 11:00:00', 'Annual GYN exam', 'Completed', 'Pap smear performed.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (27, 107, 15, '2025-10-18 10:30:00', 'Depression consult', 'Completed', 'Evaluation completed.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (28, 110, 15, '2025-11-20 16:00:00', 'Eczema flare-up', 'Completed', 'Hydration and cream prescribed.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (29, 103, 16, '2025-10-22 09:00:00', 'Heart palpitations', 'Completed', 'EKG normal; monitoring advised.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (30, 101, 16, '2025-12-05 13:30:00', 'Follow-up on cardiology visit', 'Completed', 'Symptoms improving.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (31, 105, 17, '2025-10-25 14:00:00', 'Routine GYN exam', 'Completed', 'Normal exam.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (32, 102, 17, '2025-11-15 09:15:00', 'Sinus infection', 'Completed', 'Prescribed antibiotics.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (33, 107, 18, '2025-11-03 08:30:00', 'Anxiety follow-up', 'Completed', 'Patient stable on treatment.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (34, 101, 18, '2025-12-10 12:45:00', 'Fatigue', 'Completed', 'Bloodwork ordered.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (35, 113, 19, '2025-10-30 11:45:00', 'Knee pain', 'Completed', 'Likely tendonitis; rest recommended.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (36, 109, 19, '2025-11-28 16:00:00', 'Skin mole review', 'Completed', 'Benign mole.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (37, 103, 20, '2025-10-14 15:00:00', 'Blood pressure check', 'Completed', 'BP slightly elevated; follow-up scheduled.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (38, 101, 20, '2025-12-01 09:00:00', 'Follow-up visit', 'Completed', 'Lifestyle changes discussed.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (39, 109, 21, '2025-11-07 13:15:00', 'Cosmetic consult', 'Completed', 'Botox options discussed.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (40, 113, 21, '2025-12-14 10:30:00', 'Shoulder strain', 'Completed', 'Recommended stretching exercises.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (41, 102, 22, '2025-10-29 08:45:00', 'Routine checkup', 'Completed', 'Vitals normal.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (42, 108, 22, '2025-12-18 14:45:00', 'Stress and mood concerns', 'Completed', 'Stress management techniques discussed.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (43, 104, 23, '2025-11-09 09:30:00', 'High cholesterol', 'Completed', 'Diet and exercise plan provided.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (44, 110, 23, '2025-12-21 13:00:00', 'Skin rash', 'Completed', 'Diagnosed as contact dermatitis.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (45, 106, 24, '2025-10-16 10:00:00', 'PMS symptoms', 'Completed', 'Discussed hormonal options.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (46, 101, 24, '2025-12-08 11:15:00', 'Cold symptoms', 'Completed', 'Viral illness; supportive care.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (47, 105, 25, '2025-11-11 09:00:00', 'Fertility consult', 'Completed', 'Ordered hormone panel.');
INSERT INTO appointment (appointment_id, doctor_id, patient_id, appointment_date, reason, status, notes)
VALUES (48, 108, 25, '2025-12-22 15:30:00', 'Anxiety', 'Completed', 'Started therapy plan.');

-- Table 5: Billing 
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (1, 1, 1, 150.00, 'Z00.00', 'Paid', 'Insurance', 'Aetna', '2025-09-11');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (2, 2, 3, 120.00, 'J11.1', 'Paid', 'Credit', 'Cigna', '2025-09-12');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (3, 3, 4, 200.00, 'I10', 'Paid', 'Insurance', 'Humana', '2025-09-14');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (4, 4, 8, 220.00, 'Z13.6', 'Paid', 'Insurance', 'UnitedHealthcare', '2025-09-15');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (5, 5, 5, 175.00, 'L70.0', 'Paid', 'Credit', 'Aetna', '2025-09-17');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (6, 6, 9, 140.00, 'Z48.89', 'Paid', 'Insurance', 'Blue Cross Blue Shield', '2025-09-18');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (7, 7, 10, 130.00, 'Z00.12', 'Paid', 'Cash', NULL, '2025-09-19');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (8, 8, 2, 200.00, 'F43.2', 'Pending', 'Insurance', 'UnitedHealthcare', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (9, 9, 11, 90.00, 'J20.9', 'Paid', 'Credit', 'Aetna', '2025-09-22');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (10, 10, 1, 210.00, 'I10', 'Paid', 'Insurance', 'Aetna', '2025-09-23');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (11, 11, 4, 225.00, 'E78.5', 'Pending', 'Insurance', 'Humana', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (12, 12, 5, 115.00, 'Z00.129', 'Paid', 'Insurance', 'Aetna', '2025-09-25');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (13, 13, 6, 160.00, 'L30.9', 'Paid', 'Credit', 'Blue Cross Blue Shield', '2025-09-26');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (14, 14, 9, 150.00, 'M25.519', 'Paid', 'Insurance', 'Blue Cross Blue Shield', '2025-09-27');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (15, 15, 3, 200.00, 'F41.9', 'Pending', 'Insurance', 'Cigna', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (16, 16, 7, 100.00, 'Z00.00', 'Paid', 'Credit', 'Cigna', '2025-09-29');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (17, 17, 2, 230.00, 'Z13.6', 'Paid', 'Insurance', 'UnitedHealthcare', '2025-09-30');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (18, 18, 8, 195.00, 'D23.9', 'Pending', 'Insurance', 'UnitedHealthcare', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (19, 19, 10, 125.00, 'H66.9', 'Paid', 'Insurance', 'Humana', '2025-10-02');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES (20, 20, 1, 175.00, 'F41.1', 'Paid', 'Credit', 'Aetna', '2025-10-03');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(21, 21, 12, 150.00, 'Z00.00', 'Paid', 'Insurance', 'Cigna', '2025-10-11');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(22, 22, 12, 165.00, 'L30.9', 'Paid', 'Insurance', 'Cigna', '2025-11-06');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(23, 23, 13, 225.00, 'F41.9', 'Pending', 'Insurance', 'Blue Cross Blue Shield', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(24, 24, 13, 140.00, 'Z00.00', 'Paid', 'Credit', 'Blue Cross Blue Shield', '2025-12-02');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(25, 25, 14, 180.00, 'Z12.83', 'Paid', 'Insurance', 'Aetna', '2025-10-16');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(26, 26, 14, 200.00, 'Z01.419', 'Paid', 'Insurance', 'Aetna', '2025-11-12');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(27, 27, 15, 220.00, 'F32.9', 'Pending', 'Insurance', 'Blue Cross Blue Shield', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(28, 28, 15, 165.00, 'L30.0', 'Paid', 'Insurance', 'Blue Cross Blue Shield', '2025-11-20');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(29, 29, 16, 230.00, 'R00.2', 'Paid', 'Insurance', 'Cigna', '2025-10-22');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(30, 30, 16, 140.00, 'Z09', 'Paid', 'Credit', 'Cigna', '2025-12-05');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(31, 31, 17, 175.00, 'Z01.411', 'Paid', 'Insurance', 'Cigna', '2025-10-26');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(32, 32, 17, 150.00, 'J01.90', 'Paid', 'Insurance', 'Cigna', '2025-11-15');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(33, 33, 18, 225.00, 'F41.9', 'Pending', 'Insurance', 'Cigna', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(34, 34, 18, 140.00, 'R53.83', 'Paid', 'Insurance', 'Cigna', '2025-12-10');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(35, 35, 19, 210.00, 'M76.50', 'Paid', 'Insurance', 'Blue Cross Blue Shield', '2025-10-30');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(36, 36, 19, 160.00, 'D22.9', 'Paid', 'Insurance', 'Blue Cross Blue Shield', '2025-11-28');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(37, 37, 20, 240.00, 'I10', 'Pending', 'Insurance', 'Cigna', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(38, 38, 20, 150.00, 'Z09', 'Paid', 'Credit', 'Cigna', '2025-12-01');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(39, 39, 21, 200.00, 'Z41.1', 'Paid', 'Credit', 'Aetna', '2025-11-07');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(40, 40, 21, 185.00, 'M25.519', 'Paid', 'Insurance', 'Aetna', '2025-12-14');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(41, 41, 22, 130.00, 'Z00.00', 'Paid', 'Insurance', 'UnitedHealthcare', '2025-10-29');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(42, 42, 22, 215.00, 'F41.9', 'Pending', 'Insurance', 'UnitedHealthcare', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(43, 43, 23, 235.00, 'E78.5', 'Paid', 'Insurance', 'Blue Cross Blue Shield', '2025-11-09');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(44, 44, 23, 165.00, 'L25.9', 'Paid', 'Insurance', 'Blue Cross Blue Shield', '2025-12-21');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(45, 45, 24, 180.00, 'N94.3', 'Paid', 'Insurance', 'Humana', '2025-10-16');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(46, 46, 24, 120.00, 'J06.9', 'Paid', 'Credit', 'Humana', '2025-12-08');
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(47, 47, 25, 200.00, 'N97.9', 'Pending', 'Insurance', 'Aetna', NULL);
INSERT INTO billing (bill_id, appointment_id, patient_id, amount, diagnostic_code, payment_status, payment_method, insurance_used, payment_date) 
VALUES(48, 48, 25, 220.00, 'F41.1', 'Paid', 'Insurance', 'Aetna', '2025-12-22');
-- Referrals
INSERT INTO referral (referral_id, patient_id, referring_doctor_id, receiving_dept_id, referral_date, reason, status)
VALUES (1, 4, 101, 2, '2025-09-13', 'Chest pain follow-up', 'Completed');
INSERT INTO referral (referral_id, patient_id, referring_doctor_id, receiving_dept_id, referral_date, reason, status)
VALUES (2, 2, 102, 3, '2025-09-20', 'Mental health evaluation', 'Completed');
INSERT INTO referral (referral_id, patient_id, referring_doctor_id, receiving_dept_id, referral_date, reason, status)
VALUES (3, 9, 103, 6, '2025-09-27', 'Post-surgery physical therapy', 'Pending');
INSERT INTO referral (referral_id, patient_id, referring_doctor_id, receiving_dept_id, referral_date, reason, status)
VALUES (4, 5, 101, 5, '2025-09-17', 'Skin check referral', 'Completed');
INSERT INTO referral (referral_id, patient_id, referring_doctor_id, receiving_dept_id, referral_date, reason, status)
VALUES (5, 10, 107, 2, '2025-10-02', 'Pediatric heart murmur review', 'Pending');
INSERT INTO referral (referral_id, patient_id, referring_doctor_id, receiving_dept_id, referral_date, reason, status)
VALUES (6, 16, 103, 1, '2025-10-22', 'Follow-up after palpitations evaluation', 'Pending');
INSERT INTO referral (referral_id, patient_id, referring_doctor_id, receiving_dept_id, referral_date, reason, status)
VALUES (7, 20, 103, 1, '2025-10-14', 'Primary care follow-up for hypertension', 'Pending');

-- Table 6: Medications 

-- Cardiology meds 
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (1, 'Amlodipine', 'Norvasc', 'Calcium channel blocker for hypertension');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (2, 'Losartan', 'Cozaar', 'ARB for hypertension');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (3, 'Rosuvastatin', 'Crestor', 'Statin for high cholesterol');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (4, 'Clopidogrel', 'Plavix', 'Anti-platelet to prevent blood clots');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (5, 'Warfarin', 'Coumadin', 'Anticoagulant (blood thinner)');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (6, 'Apixaban', 'Eliquis', 'Anticoagulant (blood thinner)');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (7, 'Ezetimibe', 'Zetia', 'Cholesterol absorption inhibitor');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (8, 'Furosemide', 'Lasix', 'Diuretic (water pill) for edema/hypertension');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (9, 'Spironolactone', 'Aldactone', 'Diuretic, potassium-sparing');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (10, 'Carvedilol', 'Coreg', 'Beta-blocker for heart failure');

-- Dermatology meds
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (11, 'Tretinoin', 'Retin-A', 'Topical retinoid for acne or aging');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (12, 'Hydrocortisone', 'Cortizone-10', 'Topical corticosteroid for eczema/itching');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (13, 'Mupirocin', 'Bactroban', 'Topical antibiotic for skin infections');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (14, 'Ketoconazole', 'Nizoral', 'Topical antifungal for dandruff');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (15, 'Clotrimazole-Betamethasone', 'Lotrisone', 'Antifungal/steroid combo for rashes');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (16, 'Isotretinoin', 'Accutane', 'Oral retinoid for severe acne');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (17, 'Botulinum Toxin Type A', 'Botox', 'Injectable neuromodulator for wrinkles/migraines/Hyperhydrosis');

-- Psychiatry meds
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (18, 'Sertraline', 'Zoloft', 'SSRI for Anxiety');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (19, 'Fluoxetine', 'Prozac', 'SSRI for Depression');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (20, 'Escitalopram', 'Lexapro', 'SSRI for depression/anxiety');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (21, 'Bupropion', 'Wellbutrin', 'Antidepressant (NDRI)');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (22, 'Aripiprazole', 'Abilify', 'Atypical antipsychotic');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (23, 'Quetiapine', 'Seroquel', 'Atypical antipsychotic');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (24, 'Methylphenidate', 'Ritalin/Concerta', 'Stimulant for ADHD');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (25, 'lisdexamfetamine dimesylate', 'Vyvanse', 'All Day Treatment Of ADHD');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (26, 'Lorazepam', 'Ativan', 'Benzodiazepine for anxiety (short-term)');
INSERT INTO medication (med_id, generic_name, brand_name, description) 
VALUES (27, 'Trazodone', 'Desyrel', 'Antidepressant, often used for sleep');

-- General meds
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (28, 'Naproxen', 'Aleve/Naprosyn', 'NSAID for pain relief');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (29, 'Meloxicam', 'Mobic', 'NSAID for arthritis');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (30, 'Celecoxib', 'Celebrex', 'COX-2 inhibitor NSAID');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (31, 'Acetaminophen', 'Tylenol', 'Pain and fever reducer');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (32, 'Tramadol', 'Ultram', 'Opioid analgesic for moderate pain');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (33, 'Oxycodone', 'OxyContin/Percocet', 'Opioid analgesic for severe pain');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (34, 'Gabapentin', 'Neurontin', 'Nerve pain medication');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (35, 'Pregabalin', 'Lyrica', 'Nerve pain and seizure control');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (36, 'Prednisone', 'Deltasone', 'Corticosteroid for inflammation');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (37, 'Tizanidine', 'Zanaflex', 'Muscle relaxant');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (38, 'Azithromycin', 'Zithromax (Z-Pak)', 'Macrolide antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (39, 'Doxycycline', 'Vibramycin', 'Tetracycline antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (40, 'Cephalexin', 'Keflex', 'Cephalosporin antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (41, 'Ciprofloxacin', 'Cipro', 'Fluoroquinolone antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (42, 'Levofloxacin', 'Levaquin', 'Fluoroquinolone antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (43, 'Clindamycin', 'Cleocin', 'Lincosamide antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (44, 'Metronidazole', 'Flagyl', 'Antibiotic and antiprotozoal');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (45, 'Sulfamethoxazole/Trimethoprim', 'Bactrim', 'Sulfa antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (46, 'Fluconazole', 'Diflucan', 'Antifungal medication');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (47, 'Oseltamivir', 'Tamiflu', 'Antiviral for influenza');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (48, 'Amoxicillin/Clavulanate', 'Augmentin', 'Broad-spectrum antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (49, 'Omeprazole', 'Prilosec', 'PPI for GERD or acid reflux');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (50, 'Pantoprazole', 'Protonix', 'Proton pump inhibitor for GERD');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (51, 'Vitamin D3', 'Cholecalciferol', 'Supplement for bone and immune health');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (52, 'Diclofenac', 'Voltaren', 'NSAID gel for joint pain');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (53, 'Cyclobenzaprine', 'Flexeril', 'Muscle relaxant');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (54, 'Methocarbamol', 'Robaxin', 'Muscle relaxant for injuries');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (55, 'Lidocaine', 'Lidoderm', 'Topical anesthetic patch');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (56, 'Levothyroxine', 'Synthroid', 'Thyroid hormone replacement');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (57, 'Insulin Glargine', 'Lantus', 'Long-acting insulin for diabetes');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (58, 'Empagliflozin', 'Jardiance', 'SGLT2 inhibitor for diabetes');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (59, 'Semaglutide', 'Ozempic/Wegovy', 'GLP-1 agonist for diabetes/weight loss');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (60, 'Sumatriptan', 'Imitrex', 'Triptan for migraines');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (61, 'Propranolol', 'Inderal', 'Beta-blocker for migraine prevention');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (62, 'Topiramate', 'Topamax', 'Anticonvulsant for migraine prevention');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (63, 'Gabapentin ER', 'Horizant', 'Extended-release nerve pain control');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (64, 'Rimegepant', 'Nurtec ODT', 'CGRP receptor antagonist for migraine relief');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (65, 'Amoxicillin', 'Amoxil', 'Penicillin antibiotic');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (66, 'Montelukast', 'Singulair', 'Asthma/allergy medication');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (67, 'Cetirizine', 'Zyrtec', 'Antihistamine for allergies');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (68, 'Albuterol', 'Ventolin/ProAir', 'Bronchodilator for asthma');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (69, 'Ibuprofen', 'Motrin/Advil', 'Pain and fever reducer');
-- Gyncecology meds
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (70, 'Prenatal Vitamins', 'One A Day Prenatal', 'Pregnancy multivitamin');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (71, 'Folic Acid', 'Folvite', 'Prevents neural tube defects');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (72, 'Ondansetron', 'Zofran', 'Anti-nausea medication');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (73, 'Metformin', 'Glucophage', 'Used for PCOS or gestational diabetes');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (74, 'Insulin Aspart', 'NovoLog', 'Fast-acting insulin');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (75, 'Labetalol', 'Trandate', 'Beta-blocker for hypertension in pregnancy');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (76, 'Nifedipine', 'Procardia', 'Used for preeclampsia or preterm labor');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (77, 'Magnesium Sulfate', 'N/A', 'IV infusion for preeclampsia');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (78, 'Clomiphene', 'Clomid', 'Fertility medication');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (79, 'Medroxyprogesterone', 'Provera/Depo-Provera', 'Hormone therapy');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (80, 'Ethinyl Estradiol/Norgestimate', 'Tri-Sprintec', 'Oral contraceptive');
INSERT INTO medication (med_id, generic_name, brand_name, description)
VALUES (81, 'Terbutaline', 'Brethine', 'Used to slow preterm labor');

-- Table 6: Medical Records
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (1, 1, 101, 1, 'Healthy', 'Routine physical. All vitals normal.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (2, 3, 102, 2, 'Influenza', 'Prescribed rest and fluids.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (3, 4, 103, 3, 'Hypertension', 'Patient chest pain due to high BP. Prescribed Losartan.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (4, 8, 104, 4, 'Healthy', 'Routine ECG normal.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (5, 5, 109, 5, 'Acne', 'Prescribed topical cream.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (6, 9, 113, 6, 'Knee Injury', 'Physical therapy follow-up.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (7, 10, 101, 7, 'Healthy', 'Routine physical. All vitals normal.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (8, 2, 108, 8, 'Adjustment Disorder', 'Discussed coping strategies. Prescribed Sertraline.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (9, 11, 101, 9, 'Acute Bronchitis', 'Prescribed Albuterol inhaler for cough.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (10, 1, 103, 10, 'Controlled BP', 'Patient reports no issues. Continue Carvedilol.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (11, 4, 104, 11, 'Hyperlipidemia', 'Discussed diet. Prescribed Rosuvastatin.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (12, 5, 101, 12, 'Healthy', 'Routine annual physical. Vitals normal.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (13, 6, 109, 13, 'Eczema', 'Prescribed topical steroid.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (14, 9, 114, 14, 'Shoulder Strain', 'Prescribed rest and Ibuprofen.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (15, 3, 108, 15, 'General Anxiety', 'Therapy session. Prescribed Fluoxetine.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (16, 7, 102, 16, 'Healthy', 'Routine checkup.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (17, 2, 103, 17, 'Healthy', 'Cardiac stress test normal.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (18, 8, 109, 18, 'Benign Nevus', 'Mole removed from back.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (19, 10, 102, 19, 'Otitis Media', 'Ear infection. Prescribed Amoxicillin.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes)
VALUES (20, 1, 108, 20, 'Anxiety', 'Follow-up session. Patient is responding well to Escitalopram.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (21, 12, 101, 21, 'Healthy', 'Routine physical. Labs normal. No medications needed.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (22, 12, 109, 22, 'Dermatitis', 'Mild rash treated. Recommended topical hydrocortisone cream.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(23, 13, 108, 23, 'Generalized Anxiety', 'Discussed coping strategies. Started Sertraline, low dose.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(24, 13, 102, 24, 'Stable','Anxiety improving. Continue Sertraline.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(25, 14, 109, 25, 'Normal Skin Exam', 'No concerning lesions. No medications needed.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(26, 14, 105, 26, 'Normal GYN Exam', 'Pap smear performed. Continue routine supplements.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(27, 15, 107, 27, 'Depression', 'Evaluated symptoms. Started Fluoxetine.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (28, 15, 110, 28, 'Eczema', 'Mild flare. Prescribed hydrocortisone cream.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(29, 16, 103, 29, 'Palpitations', 'EKG normal. No cardiac meds needed at this time.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (30, 16, 101, 30, 'Follow-up', 'Symptoms improving. Recommended lifestyle adjustments.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(31, 17, 105, 31, 'Routine Exam', 'Normal GYN exam. Continue current routine.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(32, 17, 102, 32, 'Acute Sinusitis', 'Prescribed Amoxicillin for infection.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(33, 18, 107, 33, 'Anxiety', 'Good response to treatment. Continue Fluoxetine.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (34, 18, 101, 34, 'Fatigue', 'Bloodwork ordered. No medications started yet.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (35, 19, 113, 35, 'Knee Tendonitis', 'Rest, stretching, and OTC Ibuprofen recommended.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (36, 19, 109, 36, 'Benign Mole', 'Monitoring recommended. No treatment needed.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (37, 20, 103, 37, 'Hypertension', 'BP slightly elevated. Restarted Losartan.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (38, 20, 101, 38, 'Follow-up','BP improved. Continue Losartan.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (39, 21, 109, 39, 'Cosmetic Consultation', 'Discussed Botox options. No medical treatment given.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(40, 21, 113, 40, 'Shoulder Strain', 'Recommended stretching + Ibuprofen as needed.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (41, 22, 102, 41, 'Healthy', 'Routine exam. No medications required.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (42, 22, 108, 42, 'Stress', 'Discussed relaxation techniques. Consider starting SSRI if needed.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (43, 23, 104, 43, 'Hyperlipidemia', 'Discussed diet. Started Rosuvastatin.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (44, 23, 110, 44, 'Contact Dermatitis', 'Prescribed topical steroid cream.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (45, 24, 106, 45, 'PMS', 'Hormonal options discussed; started low-dose oral contraceptive.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(46, 24, 101, 46, 'Viral URI','Supportive care only. No antibiotics.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES(47, 25, 105, 47, 'Fertility Concerns', 'Hormone panel ordered. Started prenatal vitamins.');
INSERT INTO medical_record (record_id, patient_id, doctor_id, appointment_id, condition, notes) 
VALUES (48, 25, 108, 48, 'Anxiety', 'Initiated low-dose SSRI therapy (Sertraline).');

-- Table 7: Prescriptions
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (1, 3, 2, '50mg', '1 tablet daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (2, 8, 18, '50mg', '1 tablet daily in AM');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (3, 9, 68, '90mcg', '2 puffs every 4-6 hours as needed');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (4, 10, 10, '25mg', '1 tablet twice daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (5, 11, 3, '20mg', '1 tablet at bedtime');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (6, 14, 69, '600mg', '1 tablet every 8 hours with food');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (7, 15, 19, '20mg', '1 tablet daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (8, 19, 65, '500mg', '1 tablet 3 times daily for 7 days');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (9, 20, 20, '10mg', '1 tablet twice daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (10, 22, 12, 'Apply thin layer', 'Apply hydrocortisone cream twice daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (11, 23, 18, '50mg', '1 tablet daily in the morning');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (12, 24, 18, '50mg', 'Continue 1 tablet daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (13, 27, 19, '20mg', '1 tablet daily'); 
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (14, 28, 12, 'Apply thin layer', 'Apply hydrocortisone cream twice daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (15, 32, 65, '500mg', 'Take 1 tablet 3 times daily for 7 days');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (16, 33, 19, '20mg', 'Continue 1 tablet daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (17, 35, 69, '600mg', 'Take 1 tablet every 8 hours as needed for pain');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (18, 37, 2, '50mg', '1 tablet daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (19, 38, 2, '50mg', 'Continue 1 tablet daily'); 
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (20, 42, 18, '50mg', '1 tablet daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (21, 43, 3, '10mg', '1 tablet nightly'); 
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (22, 44, 12, 'Apply thin layer', 'Apply steroid cream twice daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (23, 45, 80, '1 tablet', 'Take 1 tablet daily at the same time each day');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (24, 47, 70, '1 tablet', 'Take 1 prenatal vitamin daily');
INSERT INTO prescription (prescription_id, record_id, med_id, dosage, instructions)
VALUES (25, 48, 18, '50mg', 'Start 1 tablet daily');

-- The formulary by department what doctor can prescribe what.. make this the trigger.. 

-- PRIMARY CARE (Dept 1) primary care dept 1
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 1);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 2); 
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 3); 
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 28);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 31);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 69);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 65);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 38);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 47);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 66);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 67);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 68);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 49);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (1, 51);

-- CARDIOLOGY cardiology dept 2
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 1);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 2);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 3);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 4);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 5);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 6);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 7);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 8);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 9);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (2, 10);

-- psych meds dept 3
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 18); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 19); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 20); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 21);
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 22); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 23);
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 24);
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 25);
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 26);
INSERT INTO department_formulary (dept_id, med_id) VALUES (3, 27);

-- gynocology dept 4
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 70); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 71); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 72); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 73); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 74); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 75); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 76); 
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 77);
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 78);
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 79);
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 80);
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 46);
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 44);
INSERT INTO department_formulary (dept_id, med_id) VALUES (4, 81); 

-- dermatology dept 5
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 11);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 12);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 13);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 14);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 15);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 16);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 17);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 38);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 39);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 40);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 43);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 52);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (5, 55);

-- orthopedics dept 6 
INSERT INTO department_formulary (dept_id, med_id)
VALUES (6, 28);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 29);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 30);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 31);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 32);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 33);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 34);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 35);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 37);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 52);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 53);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 54);
INSERT INTO department_formulary (dept_id, med_id) 
VALUES (6, 69);

-- The user accounts

INSERT INTO user_account (username, password, role, doctor_id) 
VALUES ('admin_user', 'adminpass', 'Admin', NULL);
INSERT INTO user_account (username, password, role, doctor_id) 
VALUES ('front_desk', 'receptpass', 'Receptionist', NULL);
INSERT INTO user_account (username, password, role, doctor_id)
VALUES ('billing_staff', 'bill123', 'Billing', NULL);
INSERT INTO user_account (username, password, role, doctor_id) 
VALUES ('rsinger', 'doc123', 'Doctor', 101);
INSERT INTO user_account (username, password, role, doctor_id)
VALUES ('akroll', 'doc123', 'Doctor', 102);
INSERT INTO user_account (username, password, role, doctor_id)
VALUES ('ogrant', 'doc123', 'Doctor', 104);
INSERT INTO user_account (username, password, role, doctor_id)
VALUES ('kmoore', 'doc123', 'Doctor', 105);
INSERT INTO user_account (username, password, role, doctor_id)
VALUES ('mlecroy', 'doc123', 'Doctor', 107);
INSERT INTO user_account (username, password, role, doctor_id)
VALUES ('gbeauvais', 'doc123', 'Doctor', 109);
INSERT INTO user_account (username, password, role, doctor_id)
VALUES ('craover', 'ther123', 'Therapist', 111);
INSERT INTO user_account (username, password, role, doctor_id)
VALUES ('katden', 'ther123', 'Therapist', 112);

ALTER TRIGGER trg_no_past_appointments ENABLE;
COMMIT;
