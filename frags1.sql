clear screen;

DROP TABLE PETOWNER_1 CASCADE CONSTRAINTS;
DROP TABLE PETOWNER_2 CASCADE CONSTRAINTS;
DROP TABLE CLINIC_1 CASCADE CONSTRAINTS;
DROP TABLE RECEPTIONIST_1 CASCADE CONSTRAINTS;
DROP TABLE VETERINARIAN_1 CASCADE CONSTRAINTS;
DROP TABLE VETERINARIAN_3 CASCADE CONSTRAINTS;
DROP TABLE VETERINARIAN_2 CASCADE CONSTRAINTS;
DROP TABLE VETERINARIAN_5 CASCADE CONSTRAINTS;
DROP TABLE VETERINARIAN_6 CASCADE CONSTRAINTS;
DROP TABLE APPOINTMENT_1 CASCADE CONSTRAINTS;



CREATE TABLE PETOWNER_1
(
	po_id int not null,
	po_pass varchar2(20) not null,
    po_email varchar2(20) null,
	primary key(po_id)
);
CREATE TABLE PETOWNER_2
(
	po_id int not null,
	po_name varchar2(20) not null,
	po_address varchar2(20) not null,
	po_phn number(11) not null,
	primary key(po_id)
);

CREATE TABLE CLINIC_1
(
	c_id int not null,
	c_address varchar2(20) not null,
	c_location varchar2(20) not null,
	c_phn number(11) not null,
	primary key(c_id)
);

CREATE TABLE RECEPTIONIST_1
(
	recep_id int not null,
	pass VARCHAR2(20) not null,
	r_type varchar2(20) not null,
	start_work varchar2(20) not null,
	end_work varchar2(20) not null,
	primary key(recep_id)
);

CREATE TABLE VETERINARIAN_1
(
	v_id int not null,
	c_id int not null,
	v_dept varchar2(20) not null,
	v_in_time DATE not null,
    v_out_time DATE not null,
	foreign key(c_id) references clinic(c_id),
	primary key(v_id)
);

CREATE TABLE VETERINARIAN_3
(
	v_id int not null,
	c_id int not null,
	v_dept varchar2(20) not null,
	v_in_time DATE not null,
    v_out_time DATE not null,
	foreign key(c_id) references clinic(c_id),
	primary key(v_id)
);

CREATE TABLE VETERINARIAN_2
(
	v_id int not null,
	c_id int not null,
	v_dept varchar2(20) not null,
	v_in_time DATE not null,
    v_out_time DATE not null,
	foreign key(c_id) references clinic(c_id),
	primary key(v_id)
);

CREATE TABLE VETERINARIAN_5
(
    v_id int not null,
	c_id int not null,
	v_dept varchar2(20) not null,
	v_in_time DATE not null,
    v_out_time DATE not null,
	foreign key(c_id) references clinic(c_id),
	primary key(v_id)
);


CREATE TABLE VETERINARIAN_6
(
	v_id int not null,
    v_name varchar2(20) not null,
	v_qual varchar2(20) not null,
	v_phn number(11) not null,
	primary key(v_id)
);



CREATE TABLE APPOINTMENT_1
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

INSERT INTO PETOWNER_1 VALUES (1,'123', 'a@gmail.com');
INSERT INTO PETOWNER_1 VALUES (2,'123', 'a@gmail.com');
INSERT INTO PETOWNER_1 VALUES (3,'123', 'a@gmail.com');


INSERT INTO PETOWNER_2 VALUES (1, 'Jane Smith',  '456 Elm St', '9876543210');

INSERT INTO PETOWNER_2 VALUES (2, 'Bianca Anne',  '49 Old Kent', '7776543217');

INSERT INTO PETOWNER_2 VALUES (3, 'W Martin', '78 Pall Mall', '9234567810');
INSERT INTO PETOWNER_2 VALUES (4, 'J Smith',  '456 Elm St', '9876543219');

INSERT INTO PETOWNER_2 VALUES (5, 'B Anne',  '49 Old Kent', '7776543218');

INSERT INTO PETOWNER_2 VALUES (6, 'Willi Martin', '78 Pall Mall', '9234567816');

--INSERT INTO PETOWNER VALUES (5, 'Coco','123', 'a@gmail.com',  '78 Pall Mall', '9934567810'); 



INSERT INTO CLINIC_1 VALUES (1, '123 Main St','Dhanmondi', '1234567890');



--INSERT INTO CLINIC VALUES (3,   '49 Old Kent','Dhanmondi', '7776543217');

--INSERT INTO CLINIC VALUES (4,  '78 Pall Mall','Gulshan', '9234567810');

--INSERT INTO CLINIC VALUES (5,   '78 Pall Mall','Dhanmondi', '9934567810');

INSERT INTO VETERINARIAN_1 VALUES (1,1,'mammal',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'));
INSERT INTO VETERINARIAN_2 VALUES (2, 1,'amphibian',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'));
INSERT INTO VETERINARIAN_3 VALUES (3, 1,'fish',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'));
INSERT INTO VETERINARIAN_5 VALUES (4, 1, 'bird',TO_DATE('14:30:00','HH24:MI:SS'),TO_DATE('14:30:00','HH24:MI:SS'));

INSERT INTO VETERINARIAN_6 VALUES (1, 'Dr. Andrew Kevin', 'DVM','5551234567');

INSERT INTO VETERINARIAN_6 VALUES (2, 'Dr. Robert Johnson','DVM', '5551234567');

INSERT INTO VETERINARIAN_6 VALUES (3, 'Dr. Sara Rahman', 'DVM','5551234567');

INSERT INTO VETERINARIAN_6 VALUES (4, 'Dr. Kevin parkoan','DVM','5551234567');




INSERT INTO RECEPTIONIST_1 VALUES (1, '123', 'full-time', '9am', '8pm');

--INSERT INTO RECEPTIONIST VALUES (5, '123', 'part-time', '10am', '2pm');



INSERT INTO Appointment_1 VALUES (1, 1, 1, TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-07-27 14:45:00', 'YYYY-MM-DD HH24:MI:SS'),2000.00,250.00);

--INSERT INTO Appointment VALUES (2, 2, 2, TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),2000.00,250.00);

--INSERT INTO Appointment VALUES (3, 3, 3, TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),2000.00,250.00);

--INSERT INTO Appointment VALUES (4, 4, 1, TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-07-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),2000.00,250.00);



COMMIT;

SELECT * FROM PETOWNER_1;
SELECT * FROM PETOWNER_2;
SELECT * FROM  RECEPTIONIST_1;
SELECT * FROM APPOINTMENT_1;
SELECT * FROM CLINIC_1;
SELECT * FROM  VETERINARIAN_1;
SELECT * FROM  VETERINARIAN_2;
SELECT * FROM  VETERINARIAN_3;
SELECT * FROM  VETERINARIAN_5;
SELECT * FROM  VETERINARIAN_6;