CREATE DATABASE clinicDB;


CREATE TABLE patient (
patient_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
patient_fname varchar(20),
patient_lname varchar(20),
patient_MI char(2),
patient_age int(3),
patient_yearlevel int(2),
patient_sex ENUM('M','F') ,
patient_birthdate date,
patient_address varchar(20),
patient_bloodtype char(20),
patient_weight int(10),
patient_height int(10)
);


CREATE TABLE pastIllness( 
past_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
illness varchar (20),
patient_id int
);

CREATE TABLE vitalSign(
vsign_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
patient_temp varchar(20),
pulse_rate varchar(20),
blood_press varchar(20),
vsign_sched timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
nurse_id int,
patient_id int

);

CREATE TABLE consultation(
con_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
complaint varchar(20),
vsign_id int,
patient_id int,
doctor_id int,
diag_id int
);



CREATE TABLE diagnosis(
diag_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
findings varchar(100),
description varchar(100),
treatment varchar(100)
);

CREATE TABLE nurse(
nurse_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
nurse_fname varchar(20),
nurse_lname varchar(20),
nurse_MI char(2)
);

CREATE TABLE doctor(
doctor_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
doctor_fname varchar(20),
doctor_lname varchar(20),
doctor_MI char(2),
specialization varchar(20)


);

CREATE TABLE schedule(
sched_id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
hour_in  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
hour_out  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
doctor_id int,
nurse_id int
);




ALTER TABLE `pastIllness`

	ADD CONSTRAINT `FK_PatientP` FOREIGN KEY(`patient_id`) REFERENCES `patient`(`patient_id`);


ALTER TABLE `vitalSign`
	ADD CONSTRAINT `FK_PatientV` FOREIGN KEY(`patient_id`) REFERENCES `patient`(`patient_id`),
	ADD CONSTRAINT `FK_NurseV`  FOREIGN KEY(`nurse_id`) REFERENCES `nurse`(`nurse_id`);


ALTER TABLE `consultation`

	ADD CONSTRAINT `FK_VitalSignC` FOREIGN KEY(`vsign_id`) REFERENCES `vitalSign`(`vsign_id`),
	ADD CONSTRAINT `FK_PatientC`  FOREIGN KEY(`patient_id`) REFERENCES `patient`(`patient_id`),
	ADD CONSTRAINT `FK_DoctorC` FOREIGN KEY(`doctor_id`) REFERENCES `doctor`(`doctor_id`),
	ADD CONSTRAINT `FK_DiagnosisC`  FOREIGN KEY(`diag_id`) REFERENCES `diagnosis`(`diag_id`);



ALTER TABLE `schedule`
	ADD CONSTRAINT `FK_DoctorS` FOREIGN KEY(`doctor_id`) REFERENCES `doctor`(`doctor_id`),
	ADD CONSTRAINT `FK_NurseS` FOREIGN KEY(`nurse_id`) REFERENCES `nurse`(`nurse_id`);

