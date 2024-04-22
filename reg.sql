set verify off;
set serveroutput on;

accept po_name char prompt "Enter_name: "
accept po_email char prompt "Enter_email: "
accept po_pass char prompt "Enter_password: "
accept po_phn char prompt "Enter_phone: "
accept po_address char prompt "Enter_address: "
accept email char prompt "Login_email: "
accept passwd char prompt "Login_password: "

CREATE OR REPLACE PACKAGE pkg_petOwner AS
    PROCEDURE register_petOwner(inp_name IN PETOWNER.po_name%TYPE,inp_email IN PETOWNER.po_email%TYPE,inp_pass IN PETOWNER.po_pass%TYPE,
    inp_phn IN PETOWNER.po_phn%TYPE,inp_address IN PETOWNER.po_address%TYPE);

    PROCEDURE login_petOwner(
    inp_email in PETOWNER.po_email%TYPE,
    inp_pass in PETOWNER.po_pass%TYPE
    );

END;
/
-- show ERRORS;

CREATE OR REPLACE PACKAGE BODY pkg_petOwner AS

    PROCEDURE register_petOwner(inp_name IN PETOWNER.po_name%TYPE,inp_email IN PETOWNER.po_email%TYPE,inp_pass IN PETOWNER.po_pass%TYPE,
    inp_phn IN PETOWNER.po_phn%TYPE,inp_address IN PETOWNER.po_address%TYPE)
    IS
        row_cnt int;
        name_limit_crossed EXCEPTION;
        invalid_email EXCEPTION;
        invalid_password EXCEPTION;
        invalid_phoneNo EXCEPTION;
        has_upper BOOLEAN := FALSE;
        has_lower BOOLEAN := FALSE;
        has_digit BOOLEAN := FALSE;
    BEGIN
        SELECT count(*) into row_cnt from PETOWNER;
        IF LENGTH(inp_name) > 20 THEN
            RAISE name_limit_crossed;
        ELSIF INSTR(inp_email, '@') = 0 THEN
            RAISE invalid_email;
        ELSIF LENGTH(inp_phn) > 11 THEN
            RAISE invalid_phoneNo;
        ELSE        
            FOR i IN 1..LENGTH(inp_pass) LOOP
                IF SUBSTR(inp_pass, i, 1) BETWEEN 'A' AND 'Z' THEN
                    has_upper := TRUE;
                ELSIF SUBSTR(inp_pass, i, 1) BETWEEN 'a' AND 'z' THEN
                    has_lower := TRUE;
                ELSIF SUBSTR(inp_pass, i, 1) BETWEEN '0' AND '9' THEN
                    has_digit := TRUE;
                END IF;
                IF has_upper AND has_lower AND has_digit AND LENGTH(inp_pass) >= 8 THEN
                    INSERT INTO PETOWNER VALUES (row_cnt + 1, inp_name, inp_pass, inp_email, inp_address, inp_phn);
                    RETURN;
                END IF;
            END LOOP;
            RAISE invalid_password;
        END IF;
        
    EXCEPTION
        WHEN name_limit_crossed THEN
            DBMS_OUTPUT.PUT_LINE('Name limit crossed');
        WHEN invalid_email THEN
            DBMS_OUTPUT.PUT_LINE('Invalid email format');
        WHEN invalid_password THEN
            DBMS_OUTPUT.PUT_LINE('Invalid password format');
        WHEN invalid_phoneNo THEN
            DBMS_OUTPUT.PUT_LINE('Invalid phone number');
    END register_petOwner;

    PROCEDURE login_petOwner(
    inp_email in PETOWNER.po_email%type,
    inp_pass in PETOWNER.po_pass%type
    )
    IS
        count_rec int := 0;
        name PETOWNER.po_name%type;
        no_match_found EXCEPTION;
    BEGIN
        select count(*) into count_rec from PETOWNER where po_email = inp_email and po_pass = inp_pass;
        if count_rec !=0 THEN	
            select po_name into name from PETOWNER where po_email = inp_email and po_pass = inp_pass;
            DBMS_OUTPUT.PUT_LINE('Welcome '|| name);
        ELSE
            raise no_match_found;
        end if;
    
    EXCEPTION
        when no_match_found THEN
            DBMS_OUTPUT.PUT_LINE('Email or Password Incorrect');
    end login_petOwner;
END;
/
show ERRORS;

-- BEGIN

--  --insert into PETOWNER values(11, 'John Doe','123', 'a@gmail.com','123 Main St', 1234567890);
--     pkg_petOwner.register_petOwner('p','xyz@.com', '123Aa678', 01552888888,'nai');
--     pkg_petOwner.register_petOwner('maria','aa@a.com', 'Awd12dws', 21,'zxc');
-- END;
-- /

DECLARE
    inp_name PETOWNER.po_name%TYPE;
    inp_pass PETOWNER.po_pass%TYPE;
    inp_email PETOWNER.po_email%TYPE;
    inp_address PETOWNER.po_address%TYPE;
    inp_phn PETOWNER.po_phn%TYPE;
	email PETOWNER.po_email%TYPE;
	passwd PETOWNER.po_pass%TYPE;

BEGIN	
    inp_name := '&po_name' ;
    inp_email := '&po_email';
    inp_pass := '&po_pass';
    inp_phn := &po_phn ;
    inp_address := '&po_address';
    pkg_petOwner.register_petOwner(inp_name, inp_email, inp_pass, inp_phn, inp_address);
    email:='&email';
    passwd:='&passwd';
    pkg_petOwner.login_petOwner(email, passwd);
END;
/
