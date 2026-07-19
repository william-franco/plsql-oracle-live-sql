-- Questao 06: Procedimento com UPDATE condicional

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_aumentar_salario_q06';
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

CREATE OR REPLACE PROCEDURE prc_aumentar_salario_q06 (
  p_employee_id IN FUNCIONARIOS.EMPLOYEE_ID%TYPE,
  p_percentual  IN NUMBER
) IS
  v_rows NUMBER;
BEGIN
  UPDATE FUNCIONARIOS
     SET SALARY = SALARY * (1 + (p_percentual / 100))
   WHERE EMPLOYEE_ID = p_employee_id
     AND COMMISSION_PCT IS NOT NULL;

  v_rows := SQL%ROWCOUNT;

  IF v_rows = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Nenhum registro atualizado. Funcionario sem comissao ou inexistente.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salario atualizado para funcionario ' || p_employee_id);
  END IF;
END;
/

SET SERVEROUTPUT ON;

BEGIN
  prc_aumentar_salario_q06(100, 10);
  ROLLBACK;
END;
/
