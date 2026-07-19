-- Questao 05: Cursor no pacote

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_pedidos_q05';
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

CREATE OR REPLACE PACKAGE pkg_pedidos_q05 IS
  PROCEDURE prc_listar_pedidos (p_sales_rep_id IN NUMBER);
END pkg_pedidos_q05;
/

CREATE OR REPLACE PACKAGE BODY pkg_pedidos_q05 IS
  CURSOR c_pedidos (p_sales_rep_id IN NUMBER) IS
    SELECT ORDER_ID, ORDER_DATE, ORDER_STATUS, ORDER_TOTAL
      FROM PEDIDOS
     WHERE SALES_REP_ID = p_sales_rep_id
     ORDER BY ORDER_ID;

  PROCEDURE prc_listar_pedidos (p_sales_rep_id IN NUMBER) IS
  BEGIN
    FOR r_pedido IN c_pedidos(p_sales_rep_id) LOOP
      DBMS_OUTPUT.PUT_LINE(
        'Pedido ' || r_pedido.ORDER_ID ||
        ' | Total: ' || r_pedido.ORDER_TOTAL
      );
    END LOOP;
  END prc_listar_pedidos;
END pkg_pedidos_q05;
/

SET SERVEROUTPUT ON;

BEGIN
  pkg_pedidos_q05.prc_listar_pedidos(153);
END;
/
