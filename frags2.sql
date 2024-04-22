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

CREATE TABLE CLINIC_2
(
	c_id int not null,
	c_address varchar2(20) not null,
	c_location varchar2(20) not null,
	c_phn number(11) not null,
	primary key(c_id)
);

CREATE TABLE RECEPTIONIST_2
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

CREATE TABLE VETERINARIAN_4
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



CREATE TABLE APPOINTMENT_2
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
