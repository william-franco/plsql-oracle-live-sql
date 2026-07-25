-- Questao 09: Relatorio DBMS_OUTPUT + resumo RESULTADO_DEMO

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE sp_relatorio_depto';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PROCEDURE sp_relatorio_depto IS
  v_total_geral NUMBER := 0;
  v_qtd_geral   NUMBER := 0;
  v_grupos      NUMBER := 0;
BEGIN
  DBMS_OUTPUT.PUT_LINE('=== Relatorio Salarial por Departamento ===');
  DBMS_OUTPUT.PUT_LINE(RPAD('DEPT', 6) || RPAD('QTD', 6) || RPAD('TOTAL', 15) || 'MEDIA');
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
  FOR r IN (
    SELECT DEPARTMENT_ID, COUNT(*) qtd, SUM(SALARY) total, ROUND(AVG(SALARY), 2) media
      FROM FUNCIONARIOS GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(NVL(TO_CHAR(r.DEPARTMENT_ID), 'N/A'), 6)
      || RPAD(r.qtd, 6) || RPAD(r.total, 15) || r.media);
    v_total_geral := v_total_geral + r.total;
    v_qtd_geral   := v_qtd_geral + r.qtd;
    v_grupos      := v_grupos + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('Total funcionarios: ' || v_qtd_geral || ' | Folha total: ' || v_total_geral);
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES ('Departamentos: ' || v_grupos || ' grupos | Funcionarios: ' || v_qtd_geral);
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
  sp_relatorio_depto;
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
