-- Questao 09: Procedimento com cursor explicito

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_listar_pedidos_q09';
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

CREATE OR REPLACE PROCEDURE prc_listar_pedidos_q09 (
  p_sales_rep_id IN PEDIDOS.SALES_REP_ID%TYPE
) IS
  CURSOR c_pedidos IS
    SELECT ORDER_ID, ORDER_DATE, ORDER_STATUS, ORDER_TOTAL
      FROM PEDIDOS
     WHERE SALES_REP_ID = p_sales_rep_id
     ORDER BY ORDER_ID;

  r_pedido c_pedidos%ROWTYPE;
BEGIN
  OPEN c_pedidos;
  LOOP
    FETCH c_pedidos INTO r_pedido;
    EXIT WHEN c_pedidos%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(
      'Pedido ' || r_pedido.ORDER_ID ||
      ' | Data: ' || TO_CHAR(r_pedido.ORDER_DATE, 'DD/MM/YYYY') ||
      ' | Status: ' || r_pedido.ORDER_STATUS ||
      ' | Total: ' || r_pedido.ORDER_TOTAL
    );
  END LOOP;
  CLOSE c_pedidos;
END;
/

SET SERVEROUTPUT ON;

BEGIN
  prc_listar_pedidos_q09(153);
END;
/
