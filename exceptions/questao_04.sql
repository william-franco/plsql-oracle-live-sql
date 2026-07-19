-- Questao 04: RAISE_APPLICATION_ERROR

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_inserir_pedido_q04';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

CREATE OR REPLACE PROCEDURE prc_inserir_pedido_q04 (
  p_order_id     IN PEDIDOS.ORDER_ID%TYPE,
  p_order_date   IN PEDIDOS.ORDER_DATE%TYPE,
  p_order_mode   IN PEDIDOS.ORDER_MODE%TYPE,
  p_customer_id  IN PEDIDOS.CUSTOMER_ID%TYPE,
  p_order_status IN PEDIDOS.ORDER_STATUS%TYPE,
  p_order_total  IN PEDIDOS.ORDER_TOTAL%TYPE
) IS
BEGIN
  IF p_order_total < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'ORDER_TOTAL nao pode ser negativo.');
  END IF;

  INSERT INTO PEDIDOS (
    ORDER_ID, ORDER_DATE, ORDER_MODE, CUSTOMER_ID,
    ORDER_STATUS, ORDER_TOTAL
  ) VALUES (
    p_order_id, p_order_date, p_order_mode, p_customer_id,
    p_order_status, p_order_total
  );
END;
/

SET SERVEROUTPUT ON;

BEGIN
  prc_inserir_pedido_q04(
    p_order_id     => 99999,
    p_order_date   => SYSDATE,
    p_order_mode   => 'direct',
    p_customer_id  => 101,
    p_order_status => 'PENDING',
    p_order_total  => -500
  );
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro capturado: ' || SQLERRM);
END;
/
