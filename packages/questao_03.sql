-- Questao 03: Especificacao e corpo separados

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios_q03';
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

CREATE OR REPLACE PACKAGE pkg_funcionarios_q03 IS
  FUNCTION fn_buscar_funcionario (
    p_employee_id IN FUNCIONARIOS.EMPLOYEE_ID%TYPE
  ) RETURN VARCHAR2;
END pkg_funcionarios_q03;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionarios_q03 IS
  FUNCTION fn_buscar_funcionario (
    p_employee_id IN FUNCIONARIOS.EMPLOYEE_ID%TYPE
  ) RETURN VARCHAR2 IS
    v_nome VARCHAR2(200);
  BEGIN
    SELECT FIRST_NAME || ' ' || LAST_NAME
      INTO v_nome
      FROM FUNCIONARIOS
     WHERE EMPLOYEE_ID = p_employee_id;

    RETURN v_nome;
  END fn_buscar_funcionario;
END pkg_funcionarios_q03;
/

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE(pkg_funcionarios_q03.fn_buscar_funcionario(100));
END;
/
