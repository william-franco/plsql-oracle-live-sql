-- Questao 08: Procedimento que chama outro procedimento

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_validar_departamento';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_inserir_funcionario_validado';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PROCEDURE prc_validar_departamento (p_department_id IN NUMBER) IS
  v_qtd NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_qtd FROM FUNCIONARIOS WHERE DEPARTMENT_ID = p_department_id;
  IF v_qtd = 0 THEN
    RAISE_APPLICATION_ERROR(-20010, 'Departamento invalido ou sem funcionarios');
  END IF;
END;
/
CREATE OR REPLACE PROCEDURE prc_inserir_funcionario_validado (
  p_employee_id   IN NUMBER,
  p_first_name    IN VARCHAR2,
  p_last_name     IN VARCHAR2,
  p_email         IN VARCHAR2,
  p_department_id IN NUMBER
) IS
BEGIN
  prc_validar_departamento(p_department_id);
  INSERT INTO FUNCIONARIOS (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID)
  VALUES (p_employee_id, p_first_name, p_last_name, p_email, SYSDATE, 'IT_PROG', 3000, p_department_id);
END;
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
  prc_inserir_funcionario_validado(9902, 'Bruno', 'Costa', 'bruno@test.com', 60);
  v_resultado := 'Insercao validada no departamento 60';
  DELETE FROM FUNCIONARIOS WHERE EMPLOYEE_ID = 9902;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
