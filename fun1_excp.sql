SET SERVEROUTPUT ON;

DECLARE
    V_Name VETERINARIAN.v_name%TYPE;
    theDepartment VETERINARIAN.v_dept%TYPE := 'mammal'; 
    theClinicID VETERINARIAN.c_id%TYPE := 2; 
    theVisitTime VETERINARIAN.v_in_time%TYPE;
BEGIN
    V_Name := S_Vet(theClinicID, theDepartment);
    
    IF V_Name IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('No veterinarian found for the given clinic and department.');
    ELSE
        SELECT v_in_time INTO theVisitTime FROM VETERINARIAN WHERE v_name = V_Name;
        DBMS_OUTPUT.PUT_LINE('VETERINARIAN Name: ' || V_Name || ' | Visiting Time: ' || theVisitTime);
    END IF;
--EXCEPTION
  --  WHEN OTHERS THEN
    --    DBMS_OUTPUT.PUT_LINE('An error occurred in the function call.');
END;
/
