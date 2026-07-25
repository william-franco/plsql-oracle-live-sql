-- Questao 01: Pacote simples pkg_funcionarios

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_funcionarios IS
  FUNCTION fn_tempo_casa (p_employee_id IN NUMBER) RETURN NUMBER;
  PROCEDURE prc_exibir_tempo (p_employee_id IN NUMBER);
END pkg_funcionarios;
/
CREATE OR REPLACE PACKAGE BODY pkg_funcionarios IS
  FUNCTION fn_tempo_casa (p_employee_id IN NUMBER) RETURN NUMBER IS
    v_hire_date DATE;
  BEGIN
    SELECT HIRE_DATE INTO v_hire_date FROM FUNCIONARIOS WHERE EMPLOYEE_ID = p_employee_id;
    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, v_hire_date) / 12);
  END;
  PROCEDURE prc_exibir_tempo (p_employee_id IN NUMBER) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Tempo de casa: ' || fn_tempo_casa(p_employee_id) || ' ano(s)');
  END;
END pkg_funcionarios;
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
  pkg_funcionarios.prc_exibir_tempo(100);
  v_resultado := 'Tempo de casa: ' || pkg_funcionarios.fn_tempo_casa(100) || ' ano(s)';
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
