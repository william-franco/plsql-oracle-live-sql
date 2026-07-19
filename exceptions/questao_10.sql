-- Questao 10: Excecao de regra de negocio

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP PROCEDURE prc_inserir_funcionario_q10';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

CREATE OR REPLACE PROCEDURE prc_inserir_funcionario_q10 (
  p_employee_id IN FUNCIONARIOS.EMPLOYEE_ID%TYPE,
  p_first_name  IN FUNCIONARIOS.FIRST_NAME%TYPE,
  p_last_name   IN FUNCIONARIOS.LAST_NAME%TYPE,
  p_email       IN FUNCIONARIOS.EMAIL%TYPE,
  p_hire_date   IN FUNCIONARIOS.HIRE_DATE%TYPE,
  p_job_id      IN FUNCIONARIOS.JOB_ID%TYPE,
  p_salary      IN FUNCIONARIOS.SALARY%TYPE
) IS
  c_salario_minimo CONSTANT NUMBER := 3000;
  salario_abaixo_minimo_exc EXCEPTION;
BEGIN
  IF p_salary < c_salario_minimo THEN
    RAISE salario_abaixo_minimo_exc;
  END IF;

  INSERT INTO FUNCIONARIOS (
    EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL,
    HIRE_DATE, JOB_ID, SALARY
  ) VALUES (
    p_employee_id, p_first_name, p_last_name, p_email,
    p_hire_date, p_job_id, p_salary
  );
EXCEPTION
  WHEN salario_abaixo_minimo_exc THEN
    RAISE_APPLICATION_ERROR(-20010, 'Salario informado e inferior ao minimo permitido de ' || c_salario_minimo);
END;
/

SET SERVEROUTPUT ON;

BEGIN
  prc_inserir_funcionario_q10(
    p_employee_id => 99997,
    p_first_name  => 'Joao',
    p_last_name   => 'Silva',
    p_email       => 'joao.silva@teste.com',
    p_hire_date   => SYSDATE,
    p_job_id      => 'IT_PROG',
    p_salary      => 2000
  );
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/
