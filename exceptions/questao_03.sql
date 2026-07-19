-- Questao 03: Excecao definida pelo usuario

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

DECLARE
  salario_invalido_exc EXCEPTION;
  v_salary FUNCIONARIOS.SALARY%TYPE := -1000;
BEGIN
  IF v_salary < 0 THEN
    RAISE salario_invalido_exc;
  END IF;

  UPDATE FUNCIONARIOS
     SET SALARY = v_salary
   WHERE EMPLOYEE_ID = 100;
EXCEPTION
  WHEN salario_invalido_exc THEN
    DBMS_OUTPUT.PUT_LINE('Salario invalido: nao e permitido valor negativo.');
END;
/
