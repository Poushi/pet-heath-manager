set verify off;
set serveroutput on;

accept in_dept char prompt "Enter_department: "
accept in_loc char prompt "Enter_clinic_location: "

CREATE OR REPLACE FUNCTION S_Vet(cid IN VETERINARIAN.c_id%TYPE, theDept IN VETERINARIAN.v_dept%TYPE)
RETURN VETERINARIAN.v_name%TYPE
IS
    v_na VETERINARIAN.v_name%TYPE; 
    theVisitTime VETERINARIAN.v_in_time%TYPE;
    theVisitTime1 VETERINARIAN.v_out_time%TYPE;
BEGIN
    FOR R IN (SELECT * FROM VETERINARIAN WHERE v_dept = theDept AND c_id = cid) LOOP
        v_na := R.v_name;

        IF v_na IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('No veterinarian found for the given clinic and department.');
        ELSE
            SELECT v_in_time, v_out_time INTO theVisitTime,theVisitTime1 FROM VETERINARIAN WHERE v_name = v_na;
            DBMS_OUTPUT.PUT_LINE('VETERINARIAN Name: ' || v_na || ' | Visiting Time: ' || theVisitTime || ' to ' || theVisitTime1);
        END IF;
    END LOOP;
    RETURN v_na;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/
-- show ERRORS;

DECLARE
    theDepartment VETERINARIAN.v_dept%TYPE; 
    theClinicID VETERINARIAN.c_id%TYPE; 
    theClinicloc CLINIC.c_location%TYPE; 
    V_Name VETERINARIAN.v_name%TYPE;
BEGIN
    theDepartment:='&in_dept';
    theClinicloc:='&in_loc';

    select c_id into theClinicID from CLINIC where c_location = theClinicloc;

    V_Name := S_Vet(theClinicID, theDepartment);
END;
/
