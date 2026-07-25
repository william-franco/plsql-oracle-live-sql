-- Questao 02: Variavel global - contador de consultas

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_contador_ped';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_contador_ped IS
  g_consultas NUMBER := 0;
  FUNCTION fn_buscar_total (p_order_id IN NUMBER) RETURN NUMBER;
END pkg_contador_ped;
/
CREATE OR REPLACE PACKAGE BODY pkg_contador_ped IS
  FUNCTION fn_buscar_total (p_order_id IN NUMBER) RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    g_consultas := g_consultas + 1;
    SELECT ORDER_TOTAL INTO v_total FROM PEDIDOS WHERE ORDER_ID = p_order_id;
    RETURN v_total;
  END;
END pkg_contador_ped;
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
  v_resultado := 'Total: ' || pkg_contador_ped.fn_buscar_total(2459)
    || ' | consultas: ' || pkg_contador_ped.g_consultas;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
