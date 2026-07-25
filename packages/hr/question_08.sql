-- Question 08: Package constants and custom exception

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_validacao_salary';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_validacao_salary IS
  c_salario_minimo CONSTANT NUMBER := 3000;
  salario_invalido_exc EXCEPTION;
  PRAGMA EXCEPTION_INIT(salario_invalido_exc, -20020);
  PROCEDURE prc_atualizar_salary (p_employee_id IN NUMBER, p_salary IN NUMBER);
END pkg_validacao_salary;
/
CREATE OR REPLACE PACKAGE BODY pkg_validacao_salary IS
  PROCEDURE prc_atualizar_salary (p_employee_id IN NUMBER, p_salary IN NUMBER) IS
  BEGIN
    IF p_salary < c_salario_minimo THEN
      RAISE salario_invalido_exc;
    END IF;
    UPDATE FUNCIONARIOS SET SALARY = p_salary WHERE EMPLOYEE_ID = p_employee_id;
  END;
END pkg_validacao_salary;
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
  BEGIN
    pkg_validacao_salary.prc_atualizar_salary(100, 3000);
    v_resultado := 'Salario atualizado com sucesso';
  EXCEPTION
    WHEN pkg_validacao_salary.salario_invalido_exc THEN
      v_resultado := 'Salario abaixo do minimo 3000';
  END;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
