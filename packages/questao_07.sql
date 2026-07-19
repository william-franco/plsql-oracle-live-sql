-- Questao 07: Tipos definidos no pacote

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_funcionarios_q07';
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

CREATE OR REPLACE PACKAGE pkg_funcionarios_q07 IS
  TYPE tipo_funcionario IS RECORD (
    employee_id NUMBER,
    nome        VARCHAR2(200),
    salary      NUMBER
  );

  TYPE lista_funcionarios IS TABLE OF tipo_funcionario;

  FUNCTION fn_listar_por_departamento (
    p_department_id IN NUMBER
  ) RETURN lista_funcionarios;
END pkg_funcionarios_q07;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionarios_q07 IS
  FUNCTION fn_listar_por_departamento (
    p_department_id IN NUMBER
  ) RETURN lista_funcionarios IS
    v_lista lista_funcionarios := lista_funcionarios();
  BEGIN
    SELECT EMPLOYEE_ID,
           FIRST_NAME || ' ' || LAST_NAME,
           SALARY
      BULK COLLECT INTO v_lista
      FROM FUNCIONARIOS
     WHERE DEPARTMENT_ID = p_department_id;

    RETURN v_lista;
  END fn_listar_por_departamento;
END pkg_funcionarios_q07;
/

SET SERVEROUTPUT ON;

DECLARE
  v_funcionarios pkg_funcionarios_q07.lista_funcionarios;
BEGIN
  v_funcionarios := pkg_funcionarios_q07.fn_listar_por_departamento(60);

  FOR i IN 1 .. v_funcionarios.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(
      v_funcionarios(i).employee_id || ' - ' ||
      v_funcionarios(i).nome || ' - ' ||
      v_funcionarios(i).salary
    );
  END LOOP;
END;
/
