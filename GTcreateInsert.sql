clear screen;

DROP TABLE CLINIC CASCADE CONSTRAINTS;
DROP TABLE PETOWNER CASCADE CONSTRAINTS;
DROP TABLE RECEPTIONIST CASCADE CONSTRAINTS;
DROP TABLE VETERINARIAN CASCADE CONSTRAINTS;
DROP TABLE APPOINTMENT CASCADE CONSTRAINTS;


CREATE TABLE PETOWNER
(
	po_id int not null,
	po_name varchar2(20) not null,
	po_pass varchar2(20) not null,
    po_email varchar2(20) null,
	po_address varchar2(20) not null,
	po_phn number(11) not null,
	primary key(po_id)
);

CREATE TABLE CLINIC 
(
	c_id int not null,
	c_address varchar2(20) not null,
	c_location varchar2(10) not null,
	c_phn number(11) not null,
	primary key(c_id)
);

CREATE TABLE RECEPTIONIST
(
	recep_id int not null,
	pass VARCHAR2(20) not null,
	r_type varchar2(20) not null,
	start_work varchar2(20) not null,
	end_work varchar2(20) not null,
	primary key(recep_id)
);

CREATE TABLE VETERINARIAN
(
	v_id int not null,
    v_name varchar2(20) not null,
	c_id int not null,
	v_qual varchar2(20) not null,
	v_dept varchar2(20) not null,
	v_in_time DATE not null,
    v_out_time DATE not null,
	v_phn number(11) not null,
	foreign key(c_id) references clinic(c_id),
	primary key(v_id)
);


CREATE TABLE APPOINTMENT
(
	app_id int not null,
	po_id int not null,
	v_id int not null,
	appoint_time date not null, 
	out_time date not null,
	--status varchar2(20),
	paymentAmnt number(10,2) not null,
	discount number(10,2) not null,
	primary key(app_id),
    foreign key(v_id) references VETERINARIAN(v_id),
	foreign key(po_id) references PETOWNER(po_id)
);


INSERT INTO PETOWNER VALUES (1, 'John Doe','123', 'a@gmail.com','123 Main St', '1234567890');

INSERT INTO PETOWNER VALUES (2, 'Jane Smith','123', 'a@gmail.com',  '456 Elm St', '9876543210');

INSERT INTO PETOWNER VALUES (3, 'Bianca Anne','123', 'a@gmail.com',  '49 Old Kent', '7776543217');

INSERT INTO PETOWNER VALUES (4, 'William Martin','123', 'a@gmail.com', '78 Pall Mall', '9234567810');

INSERT INTO PETOWNER VALUES (5, 'Coco','123', 'a@gmail.com',  '78 Pall Mall', '9934567810');


INSERT INTO CLINIC VALUES (1, '123 Main St','Dhanmondi', '1234567890');

INSERT INTO CLINIC VALUES (2,   '456 Elm St','Gulshan', '9876543210');

--INSERT INTO CLINIC VALUES (3,   '49 Old Kent','Dhanmondi', '7776543217');

--INSERT INTO CLINIC VALUES (4,  '78 Pall Mall','Gulshan', '9234567810');

--INSERT INTO CLINIC VALUES (5,   '78 Pall Mall','Dhanmondi', '9934567810');


INSERT INTO VETERINARIAN VALUES (1, 'Dr. Andrew Kevin',2,'DVM', 'mammal',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'),'5551234567');

INSERT INTO VETERINARIAN VALUES (2, 'Dr. Robert Johnson',2,'DVM','amphibian',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'),'5551234567');

INSERT INTO VETERINARIAN VALUES (3, 'Dr. Sara Rahman',1, 'DVM','fish',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'),'5551234567');

INSERT INTO VETERINARIAN VALUES (4, 'Dr. Kevin parkoan', 1,'DVM', 'bird',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'),'5551234567');

INSERT INTO VETERINARIAN VALUES (5, 'Dr. A kevin',2,'DVM', 'mammal',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'),'5551234567');

INSERT INTO VETERINARIAN VALUES (6, 'Dr. R Johnson',2, 'DVM','reptiles',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'),'5551234567');

INSERT INTO VETERINARIAN VALUES (7, 'Dr. S Rahman',1,'DVM', 'fish',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'),'5551234567');

INSERT INTO VETERINARIAN VALUES (8, 'Dr. Jimin ', 2, 'DVM','fish',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'),'5551234567');



INSERT INTO RECEPTIONIST VALUES (4, '123', 'full-time', '9am', '8pm');

INSERT INTO RECEPTIONIST VALUES (5, '123', 'part-time', '10am', '2pm');



INSERT INTO Appointment VALUES (1, 1, 1, TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-07-27 14:45:00', 'YYYY-MM-DD HH24:MI:SS'),2000.00,250.00);

INSERT INTO Appointment VALUES (2, 2, 2, TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),2000.00,250.00);

INSERT INTO Appointment VALUES (3, 3, 3, TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),2000.00,250.00);

INSERT INTO Appointment VALUES (4, 4, 1, TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),2000.00,250.00);



COMMIT;

SELECT * FROM PETOWNER;
SELECT * FROM  RECEPTIONIST;
SELECT * FROM Appointment;
SELECT * FROM CLINIC;
SELECT * FROM  VETERINARIAN;

