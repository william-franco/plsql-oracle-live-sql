-- Questao 07: Procedimento com tratamento de excecao

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_atualizar_status_q07';
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

CREATE OR REPLACE PROCEDURE prc_atualizar_status_q07 (
  p_order_id     IN PEDIDOS.ORDER_ID%TYPE,
  p_order_status IN PEDIDOS.ORDER_STATUS%TYPE
) IS
  v_rows NUMBER;
BEGIN
  UPDATE PEDIDOS
     SET ORDER_STATUS = p_order_status
   WHERE ORDER_ID = p_order_id;

  v_rows := SQL%ROWCOUNT;

  IF v_rows = 0 THEN
    RAISE NO_DATA_FOUND;
  END IF;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Status atualizado com sucesso.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Pedido nao encontrado. Transacao revertida.');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM || '. Transacao revertida.');
END;
/

SET SERVEROUTPUT ON;

BEGIN
  prc_atualizar_status_q07(99999, 'COMPLETE');
END;
/
