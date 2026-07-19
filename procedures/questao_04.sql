-- Questao 04: Procedimento com parametro IN OUT

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_reajustar_salario_q04';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

CREATE OR REPLACE PROCEDURE prc_reajustar_salario_q04 (
  p_salary           IN OUT NUMBER,
  p_percentual       IN     NUMBER DEFAULT 10
) IS
BEGIN
  p_salary := p_salary * (1 + (p_percentual / 100));
END;
/

SET SERVEROUTPUT ON;

DECLARE
  v_salary NUMBER := 5000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Salario antes: ' || v_salary);
  prc_reajustar_salario_q04(v_salary, 15);
  DBMS_OUTPUT.PUT_LINE('Salario depois: ' || v_salary);
END;
/
