-- Questao 08: Funcao que retorna colecao

BEGIN
  EXECUTE IMMEDIATE 'DROP FUNCTION fn_pedidos_funcionario_q08';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TYPE lista_order_ids_q08';
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

CREATE OR REPLACE TYPE lista_order_ids_q08 AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION fn_pedidos_funcionario_q08 (
  p_employee_id IN PEDIDOS.SALES_REP_ID%TYPE
) RETURN lista_order_ids_q08 IS
  v_pedidos lista_order_ids_q08 := lista_order_ids_q08();
BEGIN
  SELECT ORDER_ID
    BULK COLLECT INTO v_pedidos
    FROM PEDIDOS
   WHERE SALES_REP_ID = p_employee_id
   ORDER BY ORDER_ID;

  RETURN v_pedidos;
END;
/

SET SERVEROUTPUT ON;

DECLARE
  v_pedidos lista_order_ids_q08;
BEGIN
  v_pedidos := fn_pedidos_funcionario_q08(153);

  FOR i IN 1 .. v_pedidos.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('ORDER_ID: ' || v_pedidos(i));
  END LOOP;
END;
/
