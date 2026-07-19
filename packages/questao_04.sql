-- Questao 04: Sobrecarga em pacote

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios_q04';
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

CREATE OR REPLACE PACKAGE pkg_funcionarios_q04 IS
  FUNCTION calcular_bonus (
    p_employee_id IN NUMBER,
    p_percentual  IN NUMBER
  ) RETURN NUMBER;

  FUNCTION calcular_bonus (
    p_employee_id IN NUMBER,
    p_valor_fixo  IN NUMBER,
    p_fixo        IN BOOLEAN
  ) RETURN NUMBER;
END pkg_funcionarios_q04;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionarios_q04 IS
  FUNCTION obter_salario (p_employee_id IN NUMBER) RETURN NUMBER IS
    v_salary NUMBER;
  BEGIN
    SELECT SALARY INTO v_salary FROM FUNCIONARIOS WHERE EMPLOYEE_ID = p_employee_id;
    RETURN v_salary;
  END obter_salario;

  FUNCTION calcular_bonus (
    p_employee_id IN NUMBER,
    p_percentual  IN NUMBER
  ) RETURN NUMBER IS
  BEGIN
    RETURN obter_salario(p_employee_id) * (p_percentual / 100);
  END calcular_bonus;

  FUNCTION calcular_bonus (
    p_employee_id IN NUMBER,
    p_valor_fixo  IN NUMBER,
    p_fixo        IN BOOLEAN
  ) RETURN NUMBER IS
  BEGIN
    RETURN obter_salario(p_employee_id) + p_valor_fixo;
  END calcular_bonus;
END pkg_funcionarios_q04;
/

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Bonus percentual: ' || pkg_funcionarios_q04.calcular_bonus(100, 10));
  DBMS_OUTPUT.PUT_LINE('Bonus fixo: ' || pkg_funcionarios_q04.calcular_bonus(100, 500, TRUE));
END;
/
