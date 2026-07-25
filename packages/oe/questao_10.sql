-- Questao 10: Pacote CRUD pkg_pedidos_crud

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_pedidos_crud';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_pedidos_crud IS
  PROCEDURE prc_inserir (p_order_id IN NUMBER, p_customer_id IN NUMBER, p_order_total IN NUMBER);
  PROCEDURE prc_atualizar (p_order_id IN NUMBER, p_order_total IN NUMBER);
  PROCEDURE prc_excluir (p_order_id IN NUMBER);
  FUNCTION fn_consultar (p_order_id IN NUMBER) RETURN NUMBER;
END pkg_pedidos_crud;
/
CREATE OR REPLACE PACKAGE BODY pkg_pedidos_crud IS
  PROCEDURE prc_inserir (p_order_id IN NUMBER, p_customer_id IN NUMBER, p_order_total IN NUMBER) IS
  BEGIN
    INSERT INTO PEDIDOS (ORDER_ID, ORDER_DATE, ORDER_MODE, CUSTOMER_ID, ORDER_STATUS, ORDER_TOTAL)
    VALUES (p_order_id, SYSDATE, 'direct', p_customer_id, 0, p_order_total);
  END;
  PROCEDURE prc_atualizar (p_order_id IN NUMBER, p_order_total IN NUMBER) IS
  BEGIN
    UPDATE PEDIDOS SET ORDER_TOTAL = p_order_total WHERE ORDER_ID = p_order_id;
  END;
  PROCEDURE prc_excluir (p_order_id IN NUMBER) IS
  BEGIN
    DELETE FROM PEDIDOS WHERE ORDER_ID = p_order_id;
  END;
  FUNCTION fn_consultar (p_order_id IN NUMBER) RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT ORDER_TOTAL INTO v_total FROM PEDIDOS WHERE ORDER_ID = p_order_id;
    RETURN v_total;
  END;
END pkg_pedidos_crud;
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
  pkg_pedidos_crud.prc_inserir(9906, 101, 800);
  pkg_pedidos_crud.prc_atualizar(9906, 900);
  v_resultado := 'CRUD OK total: ' || pkg_pedidos_crud.fn_consultar(9906);
  pkg_pedidos_crud.prc_excluir(9906);
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
