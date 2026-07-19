-- Questao 02: Procedimento com parametros IN

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_informar_salario_q02';
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

CREATE OR REPLACE PROCEDURE prc_informar_salario_q02 (
  p_employee_id IN FUNCIONARIOS.EMPLOYEE_ID%TYPE,
  p_salary      IN FUNCIONARIOS.SALARY%TYPE
) IS
  v_nome VARCHAR2(200);
BEGIN
  SELECT FIRST_NAME || ' ' || LAST_NAME
    INTO v_nome
    FROM FUNCIONARIOS
   WHERE EMPLOYEE_ID = p_employee_id;

  DBMS_OUTPUT.PUT_LINE(
    'Funcionario ' || v_nome || ' (ID ' || p_employee_id || ') recebera novo salario de ' || p_salary
  );
END;
/

SET SERVEROUTPUT ON;

BEGIN
  prc_informar_salario_q02(100, 12000);
END;
/
