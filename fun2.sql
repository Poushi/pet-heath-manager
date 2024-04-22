set verify off;
set serveroutput on;

accept inp_name char prompt "Enter_name: "
accept inp_loc char prompt "Enter_clinic_location: "
accept inp_qual char prompt "Enter_clinic_qualification: "
accept inp_dept char prompt "Enter_clinic_department: "
accept inp_in char prompt "Enter_clinic_in_time (DD-MON-YY): "
accept inp_out char prompt "Enter_clinic_out_time (DD-MON-YY): "
accept inp_phn char prompt "Enter_clinic_phone: "

DROP TRIGGER doc_add;

CREATE OR REPLACE TRIGGER doc_add
AFTER INSERT ON VETERINARIAN
BEGIN
    DBMS_OUTPUT.PUT_LINE('Table e doctor dhukse.');
END;
/

CREATE OR REPLACE FUNCTION add_vet(
    vt_name IN VETERINARIAN.v_name%TYPE,
    vt_cid IN VETERINARIAN.c_id%TYPE,
    vt_qual IN VETERINARIAN.v_qual%TYPE,
    vt_dept IN VETERINARIAN.v_dept%TYPE,
    vt_in IN VETERINARIAN.v_in_time%TYPE,
    vt_out IN VETERINARIAN.v_out_time%TYPE,
    vt_phn IN VETERINARIAN.v_phn%TYPE)
RETURN VETERINARIAN.v_name%TYPE
IS
    count_row int;
    not_found EXCEPTION;
BEGIN
    Select count(*) into count_row from VETERINARIAN where v_name = vt_name and v_qual = vt_qual and v_phn = vt_phn;
    DBMS_OUTPUT.PUT_LINE('count: ' || count_row);
    if count_row = 0 then
        RAISE not_found;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Vet already exists in the table.');
        RETURN 'zero';
    END IF;
EXCEPTION
    WHEN not_found THEN
        Select count(*) into count_row from VETERINARIAN;
        Insert into VETERINARIAN values (count_row+1, vt_name, vt_cid, vt_qual, vt_dept, vt_in, vt_out, vt_phn);
        RETURN vt_name;
END;
/
show ERRORS;

DECLARE
    vt_name VETERINARIAN.v_name%TYPE;
    vt_cid VETERINARIAN.c_id%TYPE; 
    vt_loc CLINIC.c_location%TYPE;
    vt_qual VETERINARIAN.v_qual%TYPE;
    vt_dept VETERINARIAN.v_dept%TYPE;
    vt_in VETERINARIAN.v_in_time%TYPE;
    vt_out VETERINARIAN.v_out_time%TYPE;
    vt_phn VETERINARIAN.v_phn%TYPE;
    V_Name VETERINARIAN.v_name%TYPE;
BEGIN
    vt_name :='&inp_name';
    vt_loc :='&inp_loc';
    vt_qual := '&inp_qual';
    vt_dept := '&inp_dept';
    vt_in := TO_DATE('&inp_in', 'DD-MON-YY');
    vt_out := TO_DATE('&inp_out', 'DD-MON-YY');
    vt_phn := '&inp_phn';

    select c_id into vt_cid from CLINIC where c_location = vt_loc;

    V_Name := add_vet(vt_name, vt_cid,vt_qual,vt_dept,vt_in,vt_out,vt_phn);
END;
/

select * from VETERINARIAN;