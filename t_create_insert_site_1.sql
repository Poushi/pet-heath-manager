clear screen;

DROP TABLE CLINIC_1 CASCADE CONSTRAINTS;
DROP TABLE PETOWNER_1 CASCADE CONSTRAINTS;
DROP TABLE RECEPTIONIST_1 CASCADE CONSTRAINTS;
DROP TABLE RECEPTIONIST_2 CASCADE CONSTRAINTS;
DROP TABLE EMERGENCY_1 CASCADE CONSTRAINTS;
DROP TABLE EMERGENCY_3 CASCADE CONSTRAINTS;
DROP TABLE VET_1 CASCADE CONSTRAINTS;
DROP TABLE VET_2 CASCADE CONSTRAINTS;
DROP TABLE VET_3 CASCADE CONSTRAINTS;
DROP TABLE VET_5 CASCADE CONSTRAINTS;
DROP TABLE APPOINTMENT_1 CASCADE CONSTRAINTS;


CREATE TABLE PETOWNER_1
(
	user_id number,
	user_name varchar2(70),
	email_id varchar2(70),
	primary key(user_id)
);

CREATE TABLE HOSPITAL_1
(
	hospital_id number,
	hospital_name varchar2(150),
	address varchar2(300),
	location varchar2(170),
	phn_no varchar2(20),
	primary key(hospital_id)
);

CREATE TABLE PHARMACY_1
(
	pharmacy_id number,
	pharmacy_name varchar2(150),
	address varchar2(300),
	location varchar2(170),
	phn_no varchar2(20),
	primary key(pharmacy_id)
);

CREATE TABLE PHARMACY_3
(
	pharmacy_id number,
	pharmacy_name varchar2(150),
	address varchar2(300),
	location varchar2(170),
	phn_no varchar2(20),
	primary key(pharmacy_id)
);

CREATE TABLE ADMINTABLE_1
(
	admin_id number,
	password varchar2(30),
	primary key(admin_id)
);

CREATE TABLE RECEPTIONIST_1
(
	recep_id number,
	recep_type varchar2(20),
	start_work varchar2(30),
	end_work varchar2(30),
	primary key(recep_id)
);

CREATE TABLE RECEPTIONIST_2
(
	recep_id number,
	recep_type varchar2(20),
	start_work varchar2(30),
	end_work varchar2(30),
	primary key(recep_id)
);

CREATE TABLE EMERGENCY_1
(
	emergency_id number,
	emergency_name varchar2(30),
	location varchar2(100),
	phn_no VARCHAR2(20),
	primary key(emergency_id)
);

CREATE TABLE EMERGENCY_3
(
	emergency_id number,
	emergency_name varchar2(30),
	location varchar2(100),
	phn_no VARCHAR2(20),
	primary key(emergency_id)
);

CREATE TABLE VET_1
(
	doc_id number,
	hospital_id number,
	dept varchar2(30),
	visit_time varchar2(30),
	primary key(doc_id)
);

CREATE TABLE VET_2
(
	doc_id number,
	hospital_id number,
	dept varchar2(30),
	visit_time varchar2(30),
	primary key(doc_id)
);

CREATE TABLE VET_3
(
	doc_id number,
	hospital_id number,
	dept varchar2(30),
	visit_time varchar2(30),
	primary key(doc_id)
);

CREATE TABLE VET_5
(
	doc_id number,
	hospital_id number,
	dept varchar2(30),
	visit_time varchar2(30),
	primary key(doc_id)
);

CREATE TABLE APPOINTMENT_1
(
	appoint_id number,
	user_id number,
	doc_id number,
	appoint_time varchar2(30),
	status varchar2(20),
	primary key(appoint_id),
	foreign key(user_id) references USERTABLE_1(user_id)
);

INSERT INTO Patient VALUES (1, 'John Doe', 35, 'Male', '123 Main St', '1234567890');

INSERT INTO Patient VALUES (2, 'Jane Smith', 25, 'Female', '456 Elm St', '9876543210');

INSERT INTO Patient VALUES (3, 'Bianca Anne', 25, 'Female', '49 Old Kent', '7776543217');

INSERT INTO Patient VALUES (4, 'William Martin', 40, 'Male', '78 Pall Mall', '9234567810');

INSERT INTO Patient VALUES (5, 'Coco', 25, 'Female', '78 Pall Mall', '9934567810');


INSERT INTO VET VALUES (1, 'Dr. Robert Johnson', 'Cardiology', '5551234567');

INSERT INTO VET VALUES (2, 'Dr. Sarah Williams', 'Orthopedics', '5559876543');

INSERT INTO VET VALUES (3, 'Dr. Andrew Kevin', 'Medicine', '5551873544');

INSERT INTO VET VALUES (4, 'Dr. Jesica John', 'Orthopedics', '5551873524');



INSERT INTO Appointment VALUES (1, 1, 1, DATE '2023-06-16');

INSERT INTO Appointment VALUES (2, 2, 2, DATE '2023-06-16');

INSERT INTO Appointment VALUES (3, 3, 3, DATE '2023-05-26');

INSERT INTO Appointment VALUES (4, 4, 1, DATE '2023-06-16');



COMMIT;

SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointment;
