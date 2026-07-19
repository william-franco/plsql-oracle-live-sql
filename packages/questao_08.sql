-- Questao 08: Constantes e excecoes no pacote

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios_q08';
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

CREATE OR REPLACE PACKAGE pkg_funcionarios_q08 IS
  c_salario_minimo CONSTANT NUMBER := 3000;
  salario_invalido_exc EXCEPTION;

  PROCEDURE prc_atualizar_salario (
    p_employee_id IN NUMBER,
    p_salary      IN NUMBER
  );
END pkg_funcionarios_q08;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionarios_q08 IS
  PROCEDURE prc_atualizar_salario (
    p_employee_id IN NUMBER,
    p_salary      IN NUMBER
  ) IS
  BEGIN
    IF p_salary < c_salario_minimo THEN
      RAISE salario_invalido_exc;
    END IF;

    UPDATE FUNCIONARIOS
       SET SALARY = p_salary
     WHERE EMPLOYEE_ID = p_employee_id;

    DBMS_OUTPUT.PUT_LINE('Salario atualizado com sucesso.');
  EXCEPTION
    WHEN salario_invalido_exc THEN
      DBMS_OUTPUT.PUT_LINE('Salario abaixo do minimo permitido: ' || c_salario_minimo);
  END prc_atualizar_salario;
END pkg_funcionarios_q08;
/

SET SERVEROUTPUT ON;

BEGIN
  pkg_funcionarios_q08.prc_atualizar_salario(100, 2000);
  ROLLBACK;
END;
/
