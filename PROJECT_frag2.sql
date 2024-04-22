SET SERVEROUTPUT ON;

BEGIN
    FOR R IN (SELECT * FROM CLINIC WHERE c_location = 'Gulshan') LOOP
        INSERT INTO CLINIC_2@site2 VALUES (
            R.c_id, R.c_address, R.c_location, R.c_phn
        ); 
    END LOOP;

    FOR R1 IN (SELECT * FROM RECEPTIONIST WHERE r_type = 'part-time') LOOP 
        INSERT INTO RECEPTIONIST_2@site2 VALUES (
            R1.recep_id, R1.pass,  R1.r_type, R1.start_work, R1.end_work
        ); 
    END LOOP;  

    FOR R2 IN (SELECT v_id, c_id, v_dept, v_in_time, v_out_time FROM VETERINARIAN WHERE v_dept = 'mammal') LOOP 
        INSERT INTO VETERINARIAN_1@site2 VALUES (
            R2.v_id, R2.c_id, R2.v_dept, R2.v_in_time, R2.v_out_time
        );
    END LOOP;

    FOR R3 IN (SELECT v_id, c_id, v_dept, v_in_time, v_out_time FROM VETERINARIAN WHERE v_dept = 'fish') LOOP 
        INSERT INTO VETERINARIAN_3@site2 VALUES (
            R3.v_id, R3.c_id, R3.v_dept, R3.v_in_time, R3.v_out_time
        );
    END LOOP;

    FOR R4 IN (SELECT v_id, c_id, v_dept, v_in_time, v_out_time FROM VETERINARIAN WHERE v_dept = 'reptiles') LOOP 
        INSERT INTO VETERINARIAN_4@site2 VALUES (
            R4.v_id, R4.c_id, R4.v_dept, R4.v_in_time, R4.v_out_time
        );
    END LOOP;

    FOR R5 IN (SELECT v_id, v_name, v_qual, v_phn FROM VETERINARIAN) LOOP 
        INSERT INTO VETERINARIAN_6@site2 VALUES (
            R5.v_id, R5.v_name, R5.v_qual, R5.v_phn
        );
    END LOOP;

    FOR R6 IN (SELECT po_id, po_email, po_pass FROM PETOWNER) LOOP 
        INSERT INTO PETOWNER_1@site2 VALUES (
            R6.po_id, R6.po_pass, R6.po_email
        );
    END LOOP;


    FOR R7 IN (SELECT * FROM APPOINTMENT WHERE v_id IN (SELECT v_id FROM VETERINARIAN 
                                                      WHERE c_id IN (SELECT c_id FROM CLINIC WHERE c_location = 'Gulshan'))) LOOP
        INSERT INTO APPOINTMENT_2@site2 VALUES (
           R7.app_id, R7.po_id, R7.v_id, R7.appoint_time, R7.out_time, R7.paymentAmnt, R7.discount
        ); 
    END LOOP;

END;
/
commit;