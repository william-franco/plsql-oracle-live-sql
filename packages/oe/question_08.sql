-- Question 08: Package constants and custom exception

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_validacao_total';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_validacao_total IS
  c_total_minimo CONSTANT NUMBER := 100;
  total_invalido_exc EXCEPTION;
  PRAGMA EXCEPTION_INIT(total_invalido_exc, -20022);
  PROCEDURE prc_inserir (p_order_id IN NUMBER, p_customer_id IN NUMBER, p_order_total IN NUMBER);
END pkg_validacao_total;
/
CREATE OR REPLACE PACKAGE BODY pkg_validacao_total IS
  PROCEDURE prc_inserir (p_order_id IN NUMBER, p_customer_id IN NUMBER, p_order_total IN NUMBER) IS
  BEGIN
    IF p_order_total < c_total_minimo THEN
      RAISE total_invalido_exc;
    END IF;
    INSERT INTO PEDIDOS (ORDER_ID, ORDER_DATE, ORDER_MODE, CUSTOMER_ID, ORDER_STATUS, ORDER_TOTAL)
    VALUES (p_order_id, SYSDATE, 'direct', p_customer_id, 0, p_order_total);
  END;
END pkg_validacao_total;
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
    pkg_validacao_total.prc_inserir(9905, 101, 50);
  EXCEPTION
    WHEN pkg_validacao_total.total_invalido_exc THEN
      v_resultado := 'Total abaixo do minimo permitido (100)';
  END;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
