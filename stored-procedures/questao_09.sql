-- Questao 09: Relatorio com DBMS_OUTPUT

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE sp_relatorio_pedidos_q09';
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

CREATE OR REPLACE PROCEDURE sp_relatorio_pedidos_q09 IS
  v_total_geral NUMBER := 0;
  v_qtd_geral   NUMBER := 0;
BEGIN
  DBMS_OUTPUT.PUT_LINE(RPAD('=', 60, '='));
  DBMS_OUTPUT.PUT_LINE('RELATORIO DE PEDIDOS POR REPRESENTANTE');
  DBMS_OUTPUT.PUT_LINE(RPAD('=', 60, '='));
  DBMS_OUTPUT.PUT_LINE(
    RPAD('SALES_REP_ID', 15) ||
    RPAD('QTD_PEDIDOS', 15) ||
    RPAD('TOTAL', 15)
  );
  DBMS_OUTPUT.PUT_LINE(RPAD('-', 60, '-'));

  FOR r IN (
    SELECT SALES_REP_ID,
           COUNT(*) AS qtd_pedidos,
           SUM(ORDER_TOTAL) AS total_pedidos
      FROM PEDIDOS
     WHERE SALES_REP_ID IS NOT NULL
     GROUP BY SALES_REP_ID
     ORDER BY SALES_REP_ID
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(
      RPAD(NVL(TO_CHAR(r.SALES_REP_ID), 'N/A'), 15) ||
      RPAD(TO_CHAR(r.qtd_pedidos), 15) ||
      RPAD(TO_CHAR(r.total_pedidos), 15)
    );

    v_total_geral := v_total_geral + r.total_pedidos;
    v_qtd_geral   := v_qtd_geral + r.qtd_pedidos;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE(RPAD('-', 60, '-'));
  DBMS_OUTPUT.PUT_LINE(
    RPAD('TOTAL GERAL', 15) ||
    RPAD(TO_CHAR(v_qtd_geral), 15) ||
    RPAD(TO_CHAR(v_total_geral), 15)
  );
  DBMS_OUTPUT.PUT_LINE(RPAD('=', 60, '='));
END;
/

SET SERVEROUTPUT ON;

BEGIN
  sp_relatorio_pedidos_q09;
END;
/
