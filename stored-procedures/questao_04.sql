-- Questao 04: Retorno via REF CURSOR

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE sp_pedidos_rep_q04';
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

CREATE OR REPLACE PROCEDURE sp_pedidos_rep_q04 (
  p_sales_rep_id IN  PEDIDOS.SALES_REP_ID%TYPE,
  p_cursor       OUT SYS_REFCURSOR
) IS
BEGIN
  OPEN p_cursor FOR
    SELECT ORDER_ID, ORDER_DATE, ORDER_STATUS, ORDER_TOTAL
      FROM PEDIDOS
     WHERE SALES_REP_ID = p_sales_rep_id
     ORDER BY ORDER_ID;
END;
/

SET SERVEROUTPUT ON;

DECLARE
  v_cursor SYS_REFCURSOR;
  v_order_id     PEDIDOS.ORDER_ID%TYPE;
  v_order_date   PEDIDOS.ORDER_DATE%TYPE;
  v_order_status PEDIDOS.ORDER_STATUS%TYPE;
  v_order_total  PEDIDOS.ORDER_TOTAL%TYPE;
BEGIN
  sp_pedidos_rep_q04(153, v_cursor);

  LOOP
    FETCH v_cursor INTO v_order_id, v_order_date, v_order_status, v_order_total;
    EXIT WHEN v_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Pedido ' || v_order_id || ' - Total: ' || v_order_total);
  END LOOP;

  CLOSE v_cursor;
END;
/
