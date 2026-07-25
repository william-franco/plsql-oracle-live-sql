-- Questao 09: Elemento privado - validador de status

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_status_ped';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_status_ped IS
  PROCEDURE prc_atualizar (p_order_id IN NUMBER, p_order_status IN NUMBER);
END pkg_status_ped;
/
CREATE OR REPLACE PACKAGE BODY pkg_status_ped IS
  PROCEDURE validar_status (p_order_status IN NUMBER) IS
  BEGIN
    IF p_order_status NOT BETWEEN 0 AND 4 THEN
      RAISE_APPLICATION_ERROR(-20023, 'Status invalido');
    END IF;
  END;
  PROCEDURE prc_atualizar (p_order_id IN NUMBER, p_order_status IN NUMBER) IS
  BEGIN
    validar_status(p_order_status);
    UPDATE PEDIDOS SET ORDER_STATUS = p_order_status WHERE ORDER_ID = p_order_id;
  END;
END pkg_status_ped;
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
  pkg_status_ped.prc_atualizar(2459, 1);
  v_resultado := 'Status atualizado com validacao privada';
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
