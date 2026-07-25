-- Questao 07: Tipos RECORD e TABLE OF no pacote

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

BEGIN
  EXECUTE IMMEDIATE 'DROP PACKAGE pkg_tipos_func';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE OR REPLACE PACKAGE pkg_tipos_func IS
  TYPE tipo_funcionario IS RECORD (
    employee_id NUMBER,
    nome        VARCHAR2(200),
    salary      NUMBER
  );
  TYPE tabela_funcionarios IS TABLE OF tipo_funcionario;
  FUNCTION fn_listar_depto (p_department_id IN NUMBER) RETURN tabela_funcionarios;
END pkg_tipos_func;
/
CREATE OR REPLACE PACKAGE BODY pkg_tipos_func IS
  FUNCTION fn_listar_depto (p_department_id IN NUMBER) RETURN tabela_funcionarios IS
    v_lista tabela_funcionarios := tabela_funcionarios();
  BEGIN
    FOR r IN (SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS nome, SALARY
                FROM FUNCIONARIOS WHERE DEPARTMENT_ID = p_department_id) LOOP
      v_lista.EXTEND;
      v_lista(v_lista.COUNT).employee_id := r.EMPLOYEE_ID;
      v_lista(v_lista.COUNT).nome := r.nome;
      v_lista(v_lista.COUNT).salary := r.SALARY;
    END LOOP;
    RETURN v_lista;
  END;
END pkg_tipos_func;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE RESULTADO_DEMO PURGE';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE RESULTADO_DEMO (RESULTADO VARCHAR2(4000));

DECLARE
  v_resultado VARCHAR2(4000);
BEGIN
  DECLARE
    v_lista pkg_tipos_func.tabela_funcionarios := pkg_tipos_func.fn_listar_depto(60);
  BEGIN
    v_resultado := 'Funcionarios retornados: ' || v_lista.COUNT;
  END;
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
