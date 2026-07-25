-- Question 07: RECORD and TABLE OF types in package

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_tipos_ped';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_tipos_ped IS
  TYPE tipo_pedido IS RECORD (
    order_id     NUMBER,
    order_status NUMBER,
    order_total  NUMBER
  );
  TYPE tabela_pedidos IS TABLE OF tipo_pedido;
  FUNCTION fn_listar_cliente (p_customer_id IN NUMBER) RETURN tabela_pedidos;
END pkg_tipos_ped;
/
CREATE OR REPLACE PACKAGE BODY pkg_tipos_ped IS
  FUNCTION fn_listar_cliente (p_customer_id IN NUMBER) RETURN tabela_pedidos IS
    v_lista tabela_pedidos := tabela_pedidos();
  BEGIN
    FOR r IN (SELECT ORDER_ID, ORDER_STATUS, ORDER_TOTAL FROM PEDIDOS WHERE CUSTOMER_ID = p_customer_id) LOOP
      v_lista.EXTEND;
      v_lista(v_lista.COUNT).order_id := r.ORDER_ID;
      v_lista(v_lista.COUNT).order_status := r.ORDER_STATUS;
      v_lista(v_lista.COUNT).order_total := r.ORDER_TOTAL;
    END LOOP;
    RETURN v_lista;
  END;
END pkg_tipos_ped;
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
  DECLARE v_lista pkg_tipos_ped.tabela_pedidos := pkg_tipos_ped.fn_listar_cliente(101); BEGIN
    v_resultado := 'Pedidos retornados: ' || v_lista.COUNT;
  END;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
