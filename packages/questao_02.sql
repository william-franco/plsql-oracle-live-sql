-- Questao 02: Variaveis globais no pacote

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios_q02';
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

CREATE OR REPLACE PACKAGE pkg_funcionarios_q02 IS
  g_contador_consultas NUMBER := 0;

  FUNCTION fn_buscar_nome (p_employee_id IN NUMBER) RETURN VARCHAR2;
END pkg_funcionarios_q02;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionarios_q02 IS
  FUNCTION fn_buscar_nome (p_employee_id IN NUMBER) RETURN VARCHAR2 IS
    v_nome VARCHAR2(200);
  BEGIN
    g_contador_consultas := g_contador_consultas + 1;

    SELECT FIRST_NAME || ' ' || LAST_NAME
      INTO v_nome
      FROM FUNCIONARIOS
     WHERE EMPLOYEE_ID = p_employee_id;

    RETURN v_nome;
  END fn_buscar_nome;
END pkg_funcionarios_q02;
/

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE(pkg_funcionarios_q02.fn_buscar_nome(100));
  DBMS_OUTPUT.PUT_LINE(pkg_funcionarios_q02.fn_buscar_nome(101));
  DBMS_OUTPUT.PUT_LINE('Total de consultas: ' || pkg_funcionarios_q02.g_contador_consultas);
END;
/
