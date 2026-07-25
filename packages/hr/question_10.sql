-- Question 10: CRUD package pkg_funcionarios_crud

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios_crud';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_funcionarios_crud IS
  PROCEDURE prc_inserir (p_employee_id IN NUMBER, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2,
    p_email IN VARCHAR2, p_salary IN NUMBER, p_department_id IN NUMBER);
  PROCEDURE prc_atualizar (p_employee_id IN NUMBER, p_salary IN NUMBER);
  PROCEDURE prc_excluir (p_employee_id IN NUMBER);
  FUNCTION fn_consultar (p_employee_id IN NUMBER) RETURN VARCHAR2;
END pkg_funcionarios_crud;
/
CREATE OR REPLACE PACKAGE BODY pkg_funcionarios_crud IS
  PROCEDURE prc_inserir (p_employee_id IN NUMBER, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2,
    p_email IN VARCHAR2, p_salary IN NUMBER, p_department_id IN NUMBER) IS
  BEGIN
    INSERT INTO FUNCIONARIOS (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
    VALUES (p_employee_id, p_first_name, p_last_name, p_email, SYSDATE, 'IT_PROG', p_salary, p_department_id);
  END;
  PROCEDURE prc_atualizar (p_employee_id IN NUMBER, p_salary IN NUMBER) IS
  BEGIN
    UPDATE FUNCIONARIOS SET SALARY = p_salary WHERE EMPLOYEE_ID = p_employee_id;
  END;
  PROCEDURE prc_excluir (p_employee_id IN NUMBER) IS
  BEGIN
    DELETE FROM FUNCIONARIOS WHERE EMPLOYEE_ID = p_employee_id;
  END;
  FUNCTION fn_consultar (p_employee_id IN NUMBER) RETURN VARCHAR2 IS
    v_nome VARCHAR2(200);
  BEGIN
    SELECT FIRST_NAME || ' ' || LAST_NAME INTO v_nome FROM FUNCIONARIOS WHERE EMPLOYEE_ID = p_employee_id;
    RETURN v_nome;
  END;
END pkg_funcionarios_crud;
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
  pkg_funcionarios_crud.prc_inserir(9904, 'Diana', 'Rocha', 'diana@test.com', 3000, 60);
  pkg_funcionarios_crud.prc_atualizar(9904, 3500);
  v_resultado := pkg_funcionarios_crud.fn_consultar(9904);
  pkg_funcionarios_crud.prc_excluir(9904);
  v_resultado := 'CRUD OK: ' || v_resultado;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
