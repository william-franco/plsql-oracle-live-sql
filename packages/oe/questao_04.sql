-- Questao 04: Sobrecarga calcular_desconto

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_desconto';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_desconto IS
  FUNCTION calcular_desconto (p_order_id IN NUMBER, p_percentual IN NUMBER DEFAULT 5) RETURN NUMBER;
  FUNCTION calcular_desconto (p_order_id IN NUMBER, p_valor_fixo IN NUMBER, p_fixo IN BOOLEAN) RETURN NUMBER;
END pkg_desconto;
/
CREATE OR REPLACE PACKAGE BODY pkg_desconto IS
  FUNCTION calcular_desconto (p_order_id IN NUMBER, p_percentual IN NUMBER DEFAULT 5) RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT ORDER_TOTAL INTO v_total FROM PEDIDOS WHERE ORDER_ID = p_order_id;
    RETURN ROUND(v_total * (1 - p_percentual / 100), 2);
  END;
  FUNCTION calcular_desconto (p_order_id IN NUMBER, p_valor_fixo IN NUMBER, p_fixo IN BOOLEAN) RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT ORDER_TOTAL INTO v_total FROM PEDIDOS WHERE ORDER_ID = p_order_id;
    RETURN GREATEST(v_total - p_valor_fixo, 0);
  END;
END pkg_desconto;
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
  v_resultado := 'Desconto %: ' || pkg_desconto.calcular_desconto(2459)
    || ' | fixo: ' || pkg_desconto.calcular_desconto(2459, 50, TRUE);
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
