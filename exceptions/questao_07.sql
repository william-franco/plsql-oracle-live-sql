-- Questao 07: Propagacao de excecao entre blocos

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE FUNCIONARIOS CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

DECLARE
  funcionario_nao_encontrado EXCEPTION;
BEGIN
  BEGIN
    DECLARE
      v_nome FUNCIONARIOS.FIRST_NAME%TYPE;
    BEGIN
      SELECT FIRST_NAME
        INTO v_nome
        FROM FUNCIONARIOS
       WHERE EMPLOYEE_ID = 99999;

      DBMS_OUTPUT.PUT_LINE('Funcionario: ' || v_nome);
    END;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE funcionario_nao_encontrado;
  END;
EXCEPTION
  WHEN funcionario_nao_encontrado THEN
    DBMS_OUTPUT.PUT_LINE('Excecao propagada e tratada no bloco externo: funcionario inexistente.');
END;
/
