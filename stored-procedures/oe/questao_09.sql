-- Questao 09: Relatorio DBMS_OUTPUT + resumo RESULTADO_DEMO

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE PEDIDOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE sp_relatorio_vendedor';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PROCEDURE sp_relatorio_vendedor IS
  v_total_geral NUMBER := 0;
  v_qtd_geral   NUMBER := 0;
  v_grupos      NUMBER := 0;
BEGIN
  DBMS_OUTPUT.PUT_LINE('=== Relatorio de Pedidos por Vendedor ===');
  DBMS_OUTPUT.PUT_LINE(RPAD('VEND', 6) || RPAD('QTD', 6) || RPAD('TOTAL', 15) || 'MEDIA');
  DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
  FOR r IN (
    SELECT SALES_REP_ID, COUNT(*) qtd, SUM(ORDER_TOTAL) total, ROUND(AVG(ORDER_TOTAL), 2) media
      FROM PEDIDOS WHERE SALES_REP_ID IS NOT NULL
      GROUP BY SALES_REP_ID ORDER BY SALES_REP_ID
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(NVL(TO_CHAR(r.SALES_REP_ID), 'N/A'), 6)
      || RPAD(r.qtd, 6) || RPAD(r.total, 15) || r.media);
    v_total_geral := v_total_geral + r.total;
    v_qtd_geral   := v_qtd_geral + r.qtd;
    v_grupos      := v_grupos + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
  DBMS_OUTPUT.PUT_LINE('Total pedidos: ' || v_qtd_geral || ' | Valor total: ' || v_total_geral);
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES ('Vendedores: ' || v_grupos || ' grupos | Pedidos: ' || v_qtd_geral);
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE RESULTADO_DEMO PURGE';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE RESULTADO_DEMO (RESULTADO VARCHAR2(4000));

BEGIN
  sp_relatorio_vendedor;
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
