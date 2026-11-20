create table department (
  Dept_ID     number(3) primary key,
  Dept_Name   varchar2(50) not null unique
);

create table doctor (
  doctor_id      number(5) primary key,
  first_name     varchar2(30) not null,
  last_name      varchar2(30) not null,
  dept_id        number(3) not null,
  room_number    varchar2(10),
  specialization varchar2(50),
  can_prescribe  char(1) default 'Y' check (can_prescribe in ('Y', 'N')), -- ADD THIS LINE
  constraint fk_doctor_dept foreign key (dept_id)
    references department(dept_id)
);

create table patient (
  patient_id          number(6) primary key,
  first_name          varchar2(30) not null,
  last_name           varchar2(30) not null,
  date_of_birth       date not null,
  gender              varchar2(10),
  phone_number        varchar2(15),
  address             varchar2(100),
  insurance_provider  varchar2(50),
  insurance_policy_no varchar2(30),
  insurance_group_no  varchar2(30),
  insurance_expiration date,
  constraint uq_patient_phone unique (phone_number)
);

create table appointment (
  appointment_id   number(7) primary key,
  doctor_id        number(5) not null,
  patient_id       number(6) not null,
  appointment_date timestamp not null,
  reason           varchar2(100),
  status           varchar2(20) default 'Scheduled'
                   check (status in ('Scheduled','Completed','Cancelled')),
  notes            varchar2(400),
  constraint fk_appt_doctor foreign key (doctor_id)
    references doctor(doctor_id),
  constraint fk_appt_patient foreign key (patient_id)
    references patient(patient_id)
);

create table medication (
  med_id       number(6) primary key,
  generic_name varchar2(100) not null,
  brand_name   varchar2(100),          
  description  varchar2(200)
);

create table billing (
  bill_id         number(7) primary key,
  appointment_id  number(7) not null,
  patient_id      number(6) not null,
  amount          number(8,2) not null check (amount >= 0),
  diagnostic_code varchar2(10),
  payment_status  varchar2(20) default 'Pending'
                   check (payment_status in ('Paid','Pending','Denied')),
  payment_method  varchar2(20) check (payment_method in ('Insurance','Self-Pay','Credit','Cash')),
  insurance_used  varchar2(50),
  payment_date    date,
  constraint fk_bill_appt foreign key (appointment_id)
    references appointment(appointment_id),
  constraint fk_bill_patient foreign key (patient_id)
    references patient(patient_id)
);

create table user_account (
  username    varchar2(30) primary key,
  password    varchar2(100) not null,
  -- Add 'Therapist' to the check constraint
  role        varchar2(20) check (role in ('Doctor','Admin','Receptionist','Therapist','Billing')),
  doctor_id   number(5),
  constraint fk_user_doctor foreign key (doctor_id)
    references doctor(doctor_id)
);

create table medical_record (
  record_id     number(6) primary key,
  patient_id    number(6) not null,
  doctor_id     number(5) not null,
  appointment_id number(7),
  condition     varchar2(100),
  notes         varchar2(400),
  constraint fk_record_patient foreign key (patient_id)
    references patient(patient_id),
  constraint fk_record_doctor foreign key (doctor_id)
    references doctor(doctor_id),
  constraint fk_record_appt foreign key (appointment_id)
    references appointment(appointment_id)
);

create table prescription (
  prescription_id  number(8) primary key,
  record_id        number(6) not null,
  med_id           number(6) not null,
  dosage           varchar2(50),  -- Specific dosage for this prescription
  instructions     varchar2(200), -- Specific instructions for this patient
  constraint fk_presc_record foreign key (record_id)
    references medical_record(record_id),
  constraint fk_presc_med foreign key (med_id)
    references medication(med_id)
);

create table referral (
  referral_id         number(7) primary key,
  patient_id          number(6) not null,
  referring_doctor_id number(5) not null,
  receiving_dept_id   number(3) not null,
  referral_date       date default SYSDATE,
  reason              varchar2(200),
  status              varchar2(20) default 'Pending'
                      check (status in ('Pending', 'Completed', 'Cancelled')),
  constraint fk_ref_patient foreign key (patient_id)
    references patient(patient_id),
  constraint fk_ref_doctor foreign key (referring_doctor_id)
    references doctor(doctor_id),
  constraint fk_ref_dept foreign key (receiving_dept_id)
    references department(dept_id)
);

create table department_formulary (
  dept_id number(3) not null,
  med_id  number(6) not null,
  constraint pk_formulary primary key (dept_id, med_id),
  constraint fk_form_dept foreign key (dept_id)
    references department(dept_id),
  constraint fk_form_med foreign key (med_id)
    references medication(med_id)
);