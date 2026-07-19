-- Questao 10: Pacote de CRUD

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_pedidos_q10';
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

CREATE OR REPLACE PACKAGE pkg_pedidos_q10 IS
  PROCEDURE prc_inserir (
    p_order_id     IN NUMBER,
    p_customer_id  IN NUMBER,
    p_order_total  IN NUMBER,
    p_order_status IN VARCHAR2 DEFAULT 'PENDING'
  );

  PROCEDURE prc_atualizar (
    p_order_id     IN NUMBER,
    p_order_status IN VARCHAR2,
    p_order_total  IN NUMBER
  );

  PROCEDURE prc_excluir (p_order_id IN NUMBER);

  FUNCTION fn_consultar (p_order_id IN NUMBER) RETURN PEDIDOS%ROWTYPE;
END pkg_pedidos_q10;
/

CREATE OR REPLACE PACKAGE BODY pkg_pedidos_q10 IS
  PROCEDURE prc_inserir (
    p_order_id     IN NUMBER,
    p_customer_id  IN NUMBER,
    p_order_total  IN NUMBER,
    p_order_status IN VARCHAR2 DEFAULT 'PENDING'
  ) IS
  BEGIN
    INSERT INTO PEDIDOS (
      ORDER_ID, ORDER_DATE, ORDER_MODE, CUSTOMER_ID,
      ORDER_STATUS, ORDER_TOTAL
    ) VALUES (
      p_order_id, SYSDATE, 'direct', p_customer_id,
      p_order_status, p_order_total
    );
  END prc_inserir;

  PROCEDURE prc_atualizar (
    p_order_id     IN NUMBER,
    p_order_status IN VARCHAR2,
    p_order_total  IN NUMBER
  ) IS
  BEGIN
    UPDATE PEDIDOS
       SET ORDER_STATUS = p_order_status,
           ORDER_TOTAL  = p_order_total
     WHERE ORDER_ID = p_order_id;
  END prc_atualizar;

  PROCEDURE prc_excluir (p_order_id IN NUMBER) IS
  BEGIN
    DELETE FROM PEDIDOS WHERE ORDER_ID = p_order_id;
  END prc_excluir;

  FUNCTION fn_consultar (p_order_id IN NUMBER) RETURN PEDIDOS%ROWTYPE IS
    v_pedido PEDIDOS%ROWTYPE;
  BEGIN
    SELECT *
      INTO v_pedido
      FROM PEDIDOS
     WHERE ORDER_ID = p_order_id;

    RETURN v_pedido;
  END fn_consultar;
END pkg_pedidos_q10;
/

SET SERVEROUTPUT ON;

DECLARE
  v_pedido PEDIDOS%ROWTYPE;
BEGIN
  pkg_pedidos_q10.prc_inserir(99993, 101, 4200, 'PENDING');
  pkg_pedidos_q10.prc_atualizar(99993, 'COMPLETE', 4500);
  v_pedido := pkg_pedidos_q10.fn_consultar(99993);
  DBMS_OUTPUT.PUT_LINE('Pedido consultado: ' || v_pedido.ORDER_ID || ' - ' || v_pedido.ORDER_STATUS);
  pkg_pedidos_q10.prc_excluir(99993);
  ROLLBACK;
END;
/
