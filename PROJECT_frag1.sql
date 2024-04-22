SET VERIFY OFF;
SET SERVEROUTPUT ON;

BEGIN
    FOR R IN (Select * from CLINIC where c_location = 'Dhanmondi') LOOP
        insert into CLINIC_1@site1 values (
            R.c_id, R.c_name, R,c_address, R.c_location, R.c_phn
        ); 
    END LOOP;

    FOR R IN (Select * from RECEPTIONIST where r_type = 'full-time') LOOP
        insert into RECEPTIONIST_1@site1 values (
            R.recep_id, R.pass, R,recep_type, R.start_work, R.r_type, R.end_work
        );
    END LOOP;  

    FOR R IN (Select v_id, c_id, v_dept, v_in_time, v_out_time from VETERINARIAN where v_dept = 'fish') LOOP 
        insert into VETERINARIAN_1@site1 values (
            R.v_id, R.c_id, R.v_dept, R.v_in_time, R.v_out_time
        ); 
    END LOOP;  

    FOR R IN (Select v_id, c_id, v_dept, v_in_time, v_out_time from VETERINARIAN where v_dept = 'mammal') LOOP 
        insert into VETERINARIAN_1@site1 values (
            R.v_id, R.c_id, R.v_dept, R.v_in_time, R.v_out_time
        );
    END LOOP;

    FOR R IN (Select v_id, c_id, v_dept, v_in_time, v_out_time from VETERINARIAN where v_dept = 'fish') LOOP 
        insert into VETERINARIAN_3@site1 values (
            R.v_id, R.c_id, R.v_dept, R.v_in_time, R.v_out_time
        );
    END LOOP;

    FOR R IN (Select v_id, c_id, v_dept, v_in_time, v_out_time from VETERINARIAN where v_dept = 'amphibian') LOOP 
        insert into VETERINARIAN_2@site1 values (
            R.v_id, R.c_id, R.v_dept, R.v_in_time, R.v_out_time
        );
    END LOOP;


    FOR R IN (Select v_id, c_id, v_dept, v_in_time, v_out_time from VETERINARIAN where v_dept = 'bird') LOOP 
        insert into VETERINARIAN_5@site1 values (
            R.v_id, R.c_id, R.v_dept, R.v_in_time, R.v_out_time
        );
    END LOOP;

    FOR R IN (Select v_id, v_name, c_qual, v_phn from VETERINARIAN) LOOP 
        insert into VETERINARIAN_6@site1 values (
            R.v_id, R.v_name, R,c_qual, R.v_phn
        );
    END LOOP;

    FOR R IN (Select po_id, po_email, po_pass from PETOWNER) LOOP 
        insert into PETOWNER_1@site1 values (
            R.po_id, R.po_email, R.po_pass
        );
    END LOOP;

    FOR R IN (Select * from APPOINTMENT where v_id IN (select v_id from VETERINARIAN 
                                        where c_id IN (select c_id from CLINIC
                                        where c_location = 'Dhanmondi'))
            )LOOP
        insert into APPOINTMENT_1@site1 values (
            R.c_id, R.c_name, R,c_address, R.c_location, R.c_phn
        ); 
    END LOOP;

END;
/