-- Questao 09: Elementos privados e publicos

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_pedidos_q09';
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

CREATE OR REPLACE PACKAGE pkg_pedidos_q09 IS
  PROCEDURE prc_inserir_pedido (
    p_order_id     IN NUMBER,
    p_customer_id  IN NUMBER,
    p_order_total  IN NUMBER,
    p_order_status IN VARCHAR2 DEFAULT 'PENDING'
  );
END pkg_pedidos_q09;
/

CREATE OR REPLACE PACKAGE BODY pkg_pedidos_q09 IS
  PROCEDURE validar_pedido (
    p_order_total  IN NUMBER,
    p_order_status IN VARCHAR2
  ) IS
  BEGIN
    IF p_order_total < 0 THEN
      RAISE_APPLICATION_ERROR(-20009, 'ORDER_TOTAL nao pode ser negativo.');
    END IF;

    IF p_order_status NOT IN ('PENDING', 'COMPLETE', 'CANCELLED') THEN
      RAISE_APPLICATION_ERROR(-20009, 'ORDER_STATUS invalido.');
    END IF;
  END validar_pedido;

  PROCEDURE prc_inserir_pedido (
    p_order_id     IN NUMBER,
    p_customer_id  IN NUMBER,
    p_order_total  IN NUMBER,
    p_order_status IN VARCHAR2 DEFAULT 'PENDING'
  ) IS
  BEGIN
    validar_pedido(p_order_total, p_order_status);

    INSERT INTO PEDIDOS (
      ORDER_ID, ORDER_DATE, ORDER_MODE, CUSTOMER_ID,
      ORDER_STATUS, ORDER_TOTAL
    ) VALUES (
      p_order_id, SYSDATE, 'direct', p_customer_id,
      p_order_status, p_order_total
    );

    DBMS_OUTPUT.PUT_LINE('Pedido ' || p_order_id || ' inserido.');
  END prc_inserir_pedido;
END pkg_pedidos_q09;
/

SET SERVEROUTPUT ON;

BEGIN
  pkg_pedidos_q09.prc_inserir_pedido(99994, 101, 3500);
  ROLLBACK;
END;
/
