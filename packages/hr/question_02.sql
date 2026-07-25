-- Question 02: Global variable - query counter

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_contador_func';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_contador_func IS
  g_consultas NUMBER := 0;
  FUNCTION fn_buscar_nome (p_employee_id IN NUMBER) RETURN VARCHAR2;
END pkg_contador_func;
/
CREATE OR REPLACE PACKAGE BODY pkg_contador_func IS
  FUNCTION fn_buscar_nome (p_employee_id IN NUMBER) RETURN VARCHAR2 IS
    v_nome VARCHAR2(200);
  BEGIN
    g_consultas := g_consultas + 1;
    SELECT FIRST_NAME || ' ' || LAST_NAME INTO v_nome FROM FUNCIONARIOS WHERE EMPLOYEE_ID = p_employee_id;
    RETURN v_nome;
  END;
END pkg_contador_func;
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
  v_resultado := pkg_contador_func.fn_buscar_nome(100);
  v_resultado := v_resultado || ' | consultas: ' || pkg_contador_func.g_consultas;
  v_resultado := v_resultado || ' | ' || pkg_contador_func.fn_buscar_nome(101);
  v_resultado := v_resultado || ' | consultas: ' || pkg_contador_func.g_consultas;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
