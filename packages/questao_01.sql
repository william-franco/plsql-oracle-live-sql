-- Questao 01: Pacote simples

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios_q01';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

CREATE OR REPLACE PACKAGE pkg_funcionarios_q01 IS
  FUNCTION fn_tempo_casa (p_employee_id IN NUMBER) RETURN NUMBER;
  PROCEDURE prc_exibir_tempo_casa (p_employee_id IN NUMBER);
END pkg_funcionarios_q01;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionarios_q01 IS
  FUNCTION fn_tempo_casa (p_employee_id IN NUMBER) RETURN NUMBER IS
    v_hire_date DATE;
  BEGIN
    SELECT HIRE_DATE
      INTO v_hire_date
      FROM FUNCIONARIOS
     WHERE EMPLOYEE_ID = p_employee_id;

    RETURN FLOOR(MONTHS_BETWEEN(SYSDATE, v_hire_date) / 12);
  END fn_tempo_casa;

  PROCEDURE prc_exibir_tempo_casa (p_employee_id IN NUMBER) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(
      'Funcionario ' || p_employee_id || ' possui ' ||
      fn_tempo_casa(p_employee_id) || ' ano(s) de casa.'
    );
  END prc_exibir_tempo_casa;
END pkg_funcionarios_q01;
/

SET SERVEROUTPUT ON;

BEGIN
  pkg_funcionarios_q01.prc_exibir_tempo_casa(100);
END;
/
