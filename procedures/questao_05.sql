-- Questao 05: Procedimento com INSERT

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_inserir_pedido_q05';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

CREATE OR REPLACE PROCEDURE prc_inserir_pedido_q05 (
  p_order_id     IN PEDIDOS.ORDER_ID%TYPE,
  p_order_date   IN PEDIDOS.ORDER_DATE%TYPE,
  p_order_mode   IN PEDIDOS.ORDER_MODE%TYPE,
  p_customer_id  IN PEDIDOS.CUSTOMER_ID%TYPE,
  p_order_status IN PEDIDOS.ORDER_STATUS%TYPE,
  p_order_total  IN PEDIDOS.ORDER_TOTAL%TYPE,
  p_sales_rep_id IN PEDIDOS.SALES_REP_ID%TYPE DEFAULT NULL
) IS
BEGIN
  INSERT INTO PEDIDOS (
    ORDER_ID, ORDER_DATE, ORDER_MODE, CUSTOMER_ID,
    ORDER_STATUS, ORDER_TOTAL, SALES_REP_ID
  ) VALUES (
    p_order_id, p_order_date, p_order_mode, p_customer_id,
    p_order_status, p_order_total, p_sales_rep_id
  );

  DBMS_OUTPUT.PUT_LINE('Pedido ' || p_order_id || ' inserido com sucesso.');
END;
/

SET SERVEROUTPUT ON;

BEGIN
  prc_inserir_pedido_q05(
    p_order_id     => 99996,
    p_order_date   => SYSDATE,
    p_order_mode   => 'direct',
    p_customer_id  => 101,
    p_order_status => 'PENDING',
    p_order_total  => 1500,
    p_sales_rep_id => 153
  );
  ROLLBACK;
END;
/
