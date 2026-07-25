-- Questao 09: Elemento privado - validador de email

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_email_func';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_email_func IS
  PROCEDURE prc_inserir (p_employee_id IN NUMBER, p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_salary IN NUMBER, p_department_id IN NUMBER);
END pkg_email_func;
/
CREATE OR REPLACE PACKAGE BODY pkg_email_func IS
  PROCEDURE validar_email (p_email IN VARCHAR2) IS
  BEGIN
    IF p_email IS NULL OR INSTR(p_email, '@') = 0 THEN
      RAISE_APPLICATION_ERROR(-20021, 'Email invalido');
    END IF;
  END;
  PROCEDURE prc_inserir (p_employee_id IN NUMBER, p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_salary IN NUMBER, p_department_id IN NUMBER) IS
  BEGIN
    validar_email(p_email);
    INSERT INTO FUNCIONARIOS (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
    VALUES (p_employee_id, p_first_name, p_last_name, p_email, SYSDATE, 'IT_PROG', p_salary, p_department_id);
  END;
END pkg_email_func;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE RESULTADO_DEMO PURGE';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE RESULTADO_DEMO (RESULTADO VARCHAR2(4000));

DECLARE
  v_resultado VARCHAR2(4000);
BEGIN
  pkg_email_func.prc_inserir(9903, 'Carla', 'Lima', 'carla@test.com', 3000, 60);
  v_resultado := 'Funcionario inserido com email validado';
  DELETE FROM FUNCIONARIOS WHERE EMPLOYEE_ID = 9903;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
