-- Questao 06: Secao de inicializacao do pacote

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios_q06';
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

CREATE OR REPLACE PACKAGE pkg_funcionarios_q06 IS
  g_total_funcionarios NUMBER;

  FUNCTION fn_obter_total RETURN NUMBER;
END pkg_funcionarios_q06;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionarios_q06 IS
  FUNCTION fn_obter_total RETURN NUMBER IS
  BEGIN
    RETURN g_total_funcionarios;
  END fn_obter_total;
BEGIN
  SELECT COUNT(*)
    INTO g_total_funcionarios
    FROM FUNCIONARIOS;
END pkg_funcionarios_q06;
/

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Total carregado na inicializacao: ' || pkg_funcionarios_q06.fn_obter_total);
END;
/
