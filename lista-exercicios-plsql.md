# Lista de Exercícios de PL/SQL (Oracle Live SQL)

Lista de exercícios de PL/SQL para praticar no Oracle Live SQL, organizada em 7 tópicos. Cada tópico é dividido em duas subpastas, **hr** (baseada em HR.EMPLOYEES) e **oe** (baseada em OE.ORDERS), com 10 exercícios cada — totalizando 20 exercícios por tópico e 140 exercícios ao todo.

## Regras

- O código completo de cada questão deve ficar somente em um único arquivo, sem depender de outros arquivos.

## Tabelas Base

Todos os exercícios utilizam duas tabelas locais, criadas a partir dos schemas de exemplo do Oracle Live SQL (HR e OE). Os exercícios da subpasta `hr` utilizam apenas a tabela FUNCIONARIOS, e os da subpasta `oe` utilizam apenas a tabela PEDIDOS:

```sql
CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;
CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;
```

- **FUNCIONARIOS** (baseada em HR.EMPLOYEES): EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID.
- **PEDIDOS** (baseada em OE.ORDERS): ORDER_ID, ORDER_DATE, ORDER_MODE, CUSTOMER_ID, ORDER_STATUS, ORDER_TOTAL, SALES_REP_ID, PROMOTION_ID.

## Estrutura de Projeto

```
plsql-oracle-live-sql/
├── exceptions/
│   ├── hr/
│   │   ├── questao_01.sql
│   │   ├── questao_02.sql
│   │   ├── questao_03.sql
│   │   ├── questao_04.sql
│   │   ├── questao_05.sql
│   │   ├── questao_06.sql
│   │   ├── questao_07.sql
│   │   ├── questao_08.sql
│   │   ├── questao_09.sql
│   │   └── questao_10.sql
│   └── oe/
│       ├── questao_01.sql
│       ├── questao_02.sql
│       ├── questao_03.sql
│       ├── questao_04.sql
│       ├── questao_05.sql
│       ├── questao_06.sql
│       ├── questao_07.sql
│       ├── questao_08.sql
│       ├── questao_09.sql
│       └── questao_10.sql
├── functions/
│   ├── hr/
│   │   ├── questao_01.sql
│   │   ├── questao_02.sql
│   │   ├── questao_03.sql
│   │   ├── questao_04.sql
│   │   ├── questao_05.sql
│   │   ├── questao_06.sql
│   │   ├── questao_07.sql
│   │   ├── questao_08.sql
│   │   ├── questao_09.sql
│   │   └── questao_10.sql
│   └── oe/
│       ├── questao_01.sql
│       ├── questao_02.sql
│       ├── questao_03.sql
│       ├── questao_04.sql
│       ├── questao_05.sql
│       ├── questao_06.sql
│       ├── questao_07.sql
│       ├── questao_08.sql
│       ├── questao_09.sql
│       └── questao_10.sql
├── packages/
│   ├── hr/
│   │   ├── questao_01.sql
│   │   ├── questao_02.sql
│   │   ├── questao_03.sql
│   │   ├── questao_04.sql
│   │   ├── questao_05.sql
│   │   ├── questao_06.sql
│   │   ├── questao_07.sql
│   │   ├── questao_08.sql
│   │   ├── questao_09.sql
│   │   └── questao_10.sql
│   └── oe/
│       ├── questao_01.sql
│       ├── questao_02.sql
│       ├── questao_03.sql
│       ├── questao_04.sql
│       ├── questao_05.sql
│       ├── questao_06.sql
│       ├── questao_07.sql
│       ├── questao_08.sql
│       ├── questao_09.sql
│       └── questao_10.sql
├── procedures/
│   ├── hr/
│   │   ├── questao_01.sql
│   │   ├── questao_02.sql
│   │   ├── questao_03.sql
│   │   ├── questao_04.sql
│   │   ├── questao_05.sql
│   │   ├── questao_06.sql
│   │   ├── questao_07.sql
│   │   ├── questao_08.sql
│   │   ├── questao_09.sql
│   │   └── questao_10.sql
│   └── oe/
│       ├── questao_01.sql
│       ├── questao_02.sql
│       ├── questao_03.sql
│       ├── questao_04.sql
│       ├── questao_05.sql
│       ├── questao_06.sql
│       ├── questao_07.sql
│       ├── questao_08.sql
│       ├── questao_09.sql
│       └── questao_10.sql
├── stored-procedures/
│   ├── hr/
│   │   ├── questao_01.sql
│   │   ├── questao_02.sql
│   │   ├── questao_03.sql
│   │   ├── questao_04.sql
│   │   ├── questao_05.sql
│   │   ├── questao_06.sql
│   │   ├── questao_07.sql
│   │   ├── questao_08.sql
│   │   ├── questao_09.sql
│   │   └── questao_10.sql
│   └── oe/
│       ├── questao_01.sql
│       ├── questao_02.sql
│       ├── questao_03.sql
│       ├── questao_04.sql
│       ├── questao_05.sql
│       ├── questao_06.sql
│       ├── questao_07.sql
│       ├── questao_08.sql
│       ├── questao_09.sql
│       └── questao_10.sql
├── triggers/
│   ├── hr/
│   │   ├── questao_01.sql
│   │   ├── questao_02.sql
│   │   ├── questao_03.sql
│   │   ├── questao_04.sql
│   │   ├── questao_05.sql
│   │   ├── questao_06.sql
│   │   ├── questao_07.sql
│   │   ├── questao_08.sql
│   │   ├── questao_09.sql
│   │   └── questao_10.sql
│   └── oe/
│       ├── questao_01.sql
│       ├── questao_02.sql
│       ├── questao_03.sql
│       ├── questao_04.sql
│       ├── questao_05.sql
│       ├── questao_06.sql
│       ├── questao_07.sql
│       ├── questao_08.sql
│       ├── questao_09.sql
│       └── questao_10.sql
└── views/
    ├── hr/
    │   ├── questao_01.sql
    │   ├── questao_02.sql
    │   ├── questao_03.sql
    │   ├── questao_04.sql
    │   ├── questao_05.sql
    │   ├── questao_06.sql
    │   ├── questao_07.sql
    │   ├── questao_08.sql
    │   ├── questao_09.sql
    │   └── questao_10.sql
    └── oe/
        ├── questao_01.sql
        ├── questao_02.sql
        ├── questao_03.sql
        ├── questao_04.sql
        ├── questao_05.sql
        ├── questao_06.sql
        ├── questao_07.sql
        ├── questao_08.sql
        ├── questao_09.sql
        └── questao_10.sql
```

## Exceptions — HR (FUNCIONARIOS)

### 1. Tratamento de NO_DATA_FOUND
**Arquivo:** `exceptions/hr/questao_01.sql`

Escreva um bloco PL/SQL que tente buscar em FUNCIONARIOS um EMPLOYEE_ID inexistente usando SELECT INTO e trate a exceção NO_DATA_FOUND, exibindo uma mensagem amigável ao invés de deixar o erro estourar.

### 2. Tratamento de TOO_MANY_ROWS
**Arquivo:** `exceptions/hr/questao_02.sql`

Escreva um bloco PL/SQL que execute um SELECT INTO buscando em FUNCIONARIOS pelo LAST_NAME (que pode se repetir) e trate a exceção TOO_MANY_ROWS quando mais de um registro for retornado.

### 3. Exceção definida pelo usuário
**Arquivo:** `exceptions/hr/questao_03.sql`

Declare uma exceção customizada (ex: salario_invalido_exc) em um bloco PL/SQL que tente atualizar o SALARY de um funcionário em FUNCIONARIOS para um valor negativo, lançando e capturando essa exceção.

### 4. RAISE_APPLICATION_ERROR
**Arquivo:** `exceptions/hr/questao_04.sql`

Crie um procedimento que valide o SALARY informado ao inserir um novo funcionário em FUNCIONARIOS e, caso o valor seja menor que um mínimo definido, utilize RAISE_APPLICATION_ERROR para retornar um erro customizado (número entre -20000 e -20999) com uma mensagem clara.

### 5. WHEN OTHERS
**Arquivo:** `exceptions/hr/questao_05.sql`

Escreva um bloco PL/SQL que execute múltiplas operações sobre FUNCIONARIOS que podem falhar por motivos diferentes, tratando as exceções específicas separadamente e utilizando WHEN OTHERS como cláusula de captura genérica ao final.

### 6. PRAGMA EXCEPTION_INIT
**Arquivo:** `exceptions/hr/questao_06.sql`

Utilize PRAGMA EXCEPTION_INIT para associar o erro ORA-02291 (violação de chave estrangeira) a uma exceção nomeada, provocado ao tentar inserir em FUNCIONARIOS um MANAGER_ID que não corresponda a nenhum EMPLOYEE_ID existente, e trate-a de forma legível.

### 7. Propagação de exceção entre blocos
**Arquivo:** `exceptions/hr/questao_07.sql`

Escreva um bloco PL/SQL com um sub-bloco aninhado que consulta FUNCIONARIOS e lança uma exceção sem tratá-la localmente, permitindo que ela se propague e seja tratada no bloco externo.

### 8. SQLCODE e SQLERRM
**Arquivo:** `exceptions/hr/questao_08.sql`

Escreva um bloco PL/SQL que tente atualizar um registro em FUNCIONARIOS, capture uma exceção genérica em WHEN OTHERS e exiba o código e a mensagem do erro utilizando as funções SQLCODE e SQLERRM.

### 9. DUP_VAL_ON_INDEX
**Arquivo:** `exceptions/hr/questao_09.sql`

Escreva um bloco PL/SQL que tente inserir em FUNCIONARIOS um registro com um EMPLOYEE_ID já existente e trate a exceção predefinida DUP_VAL_ON_INDEX.

### 10. Exceção de regra de negócio
**Arquivo:** `exceptions/hr/questao_10.sql`

Crie um procedimento que valide, ao atualizar um funcionário em FUNCIONARIOS, se o COMMISSION_PCT informado está dentro de uma faixa válida (entre 0 e 1), lançando uma exceção customizada quando a regra for violada.

## Exceptions — OE (PEDIDOS)

### 1. Tratamento de NO_DATA_FOUND
**Arquivo:** `exceptions/oe/questao_01.sql`

Escreva um bloco PL/SQL que tente buscar em PEDIDOS um ORDER_ID inexistente usando SELECT INTO e trate a exceção NO_DATA_FOUND, exibindo uma mensagem amigável ao invés de deixar o erro estourar.

### 2. Tratamento de TOO_MANY_ROWS
**Arquivo:** `exceptions/oe/questao_02.sql`

Escreva um bloco PL/SQL que execute um SELECT INTO buscando em PEDIDOS pelo CUSTOMER_ID (que pode ter múltiplos pedidos) e trate a exceção TOO_MANY_ROWS quando mais de um registro for retornado.

### 3. Exceção definida pelo usuário
**Arquivo:** `exceptions/oe/questao_03.sql`

Declare uma exceção customizada (ex: valor_invalido_exc) em um bloco PL/SQL que tente atualizar o ORDER_TOTAL de um pedido em PEDIDOS para um valor negativo, lançando e capturando essa exceção.

### 4. RAISE_APPLICATION_ERROR
**Arquivo:** `exceptions/oe/questao_04.sql`

Crie um procedimento que valide o ORDER_STATUS informado ao inserir um novo registro em PEDIDOS e, caso o valor não esteja entre os status permitidos, utilize RAISE_APPLICATION_ERROR para retornar um erro customizado (número entre -20000 e -20999) com uma mensagem clara.

### 5. WHEN OTHERS
**Arquivo:** `exceptions/oe/questao_05.sql`

Escreva um bloco PL/SQL que execute múltiplas operações sobre PEDIDOS que podem falhar por motivos diferentes, tratando as exceções específicas separadamente e utilizando WHEN OTHERS como cláusula de captura genérica ao final.

### 6. PRAGMA EXCEPTION_INIT
**Arquivo:** `exceptions/oe/questao_06.sql`

Utilize PRAGMA EXCEPTION_INIT para associar o erro ORA-02290 (violação de check constraint) a uma exceção nomeada, provocado ao tentar inserir em PEDIDOS um ORDER_TOTAL negativo (supondo uma constraint CHECK definida na tabela), e trate-a de forma legível.

### 7. Propagação de exceção entre blocos
**Arquivo:** `exceptions/oe/questao_07.sql`

Escreva um bloco PL/SQL com um sub-bloco aninhado que consulta PEDIDOS e lança uma exceção sem tratá-la localmente, permitindo que ela se propague e seja tratada no bloco externo.

### 8. SQLCODE e SQLERRM
**Arquivo:** `exceptions/oe/questao_08.sql`

Escreva um bloco PL/SQL que tente atualizar um registro em PEDIDOS, capture uma exceção genérica em WHEN OTHERS e exiba o código e a mensagem do erro utilizando as funções SQLCODE e SQLERRM.

### 9. DUP_VAL_ON_INDEX
**Arquivo:** `exceptions/oe/questao_09.sql`

Escreva um bloco PL/SQL que tente inserir em PEDIDOS um registro com um ORDER_ID já existente e trate a exceção predefinida DUP_VAL_ON_INDEX.

### 10. Exceção de regra de negócio
**Arquivo:** `exceptions/oe/questao_10.sql`

Crie um procedimento que valide, ao inserir um novo pedido em PEDIDOS, se o ORDER_DATE informado não é uma data futura, lançando uma exceção customizada quando a regra for violada.

## Functions — HR (FUNCIONARIOS)

### 1. Função escalar simples
**Arquivo:** `functions/hr/questao_01.sql`

Crie uma função que receba um EMPLOYEE_ID e retorne o tempo de casa do funcionário em FUNCIONARIOS, em anos completos, com base na coluna HIRE_DATE.

### 2. Função com parâmetros IN
**Arquivo:** `functions/hr/questao_02.sql`

Crie uma função que receba um EMPLOYEE_ID como parâmetro IN e retorne o nome completo do funcionário (FIRST_NAME concatenado com LAST_NAME) a partir de FUNCIONARIOS.

### 3. Função que retorna booleano
**Arquivo:** `functions/hr/questao_03.sql`

Crie uma função que receba um EMPLOYEE_ID e retorne TRUE se o funcionário correspondente em FUNCIONARIOS recebe comissão (COMMISSION_PCT não nulo), ou FALSE caso contrário.

### 4. Função com tratamento de exceção
**Arquivo:** `functions/hr/questao_04.sql`

Crie uma função que busque o SALARY de um funcionário em FUNCIONARIOS pelo EMPLOYEE_ID e retorne 0 caso o funcionário não seja encontrado, tratando a exceção NO_DATA_FOUND internamente.

### 5. Função com cursor interno
**Arquivo:** `functions/hr/questao_05.sql`

Crie uma função que receba um DEPARTMENT_ID e retorne, por meio de um cursor interno, a soma do SALARY de todos os funcionários de FUNCIONARIOS naquele departamento.

### 6. Função DETERMINISTIC
**Arquivo:** `functions/hr/questao_06.sql`

Crie uma função DETERMINISTIC que receba o FIRST_NAME e o LAST_NAME de um funcionário e retorne o nome formatado no padrão título (primeira letra de cada palavra em maiúscula).

### 7. Função com parâmetro padrão
**Arquivo:** `functions/hr/questao_07.sql`

Crie uma função que calcule um bônus sobre o SALARY de um funcionário em FUNCIONARIOS, recebendo o percentual de bônus como parâmetro com valor padrão (DEFAULT) de 10%.

### 8. Função que retorna coleção
**Arquivo:** `functions/hr/questao_08.sql`

Crie uma função que receba um MANAGER_ID e retorne uma coleção (tabela PL/SQL) contendo os EMPLOYEE_ID de todos os subordinados diretos desse gerente em FUNCIONARIOS.

### 9. Função recursiva
**Arquivo:** `functions/hr/questao_09.sql`

Crie uma função recursiva que receba um EMPLOYEE_ID e conte, com base na coluna MANAGER_ID de FUNCIONARIOS, quantos subordinados diretos e indiretos esse funcionário possui na hierarquia.

### 10. Função em cláusula SELECT
**Arquivo:** `functions/hr/questao_10.sql`

Crie uma função escalar que formate o PHONE_NUMBER de um funcionário e demonstre seu uso diretamente em uma cláusula SELECT sobre a tabela FUNCIONARIOS.

## Functions — OE (PEDIDOS)

### 1. Função escalar simples
**Arquivo:** `functions/oe/questao_01.sql`

Crie uma função que receba um ORDER_ID e retorne a quantidade de dias decorridos desde o ORDER_DATE até a data atual, consultando a tabela PEDIDOS.

### 2. Função com parâmetros IN
**Arquivo:** `functions/oe/questao_02.sql`

Crie uma função que receba um ORDER_ID como parâmetro IN e retorne uma descrição textual do status do pedido (ex: 'Pedido Concluído', 'Pedido Pendente') a partir de PEDIDOS.

### 3. Função que retorna booleano
**Arquivo:** `functions/oe/questao_03.sql`

Crie uma função que receba um ORDER_ID e retorne TRUE se o pedido correspondente em PEDIDOS possui ORDER_STATUS igual a 'COMPLETE', ou FALSE caso contrário.

### 4. Função com tratamento de exceção
**Arquivo:** `functions/oe/questao_04.sql`

Crie uma função que busque o ORDER_TOTAL de um pedido em PEDIDOS pelo ORDER_ID e retorne 0 caso o pedido não seja encontrado, tratando a exceção NO_DATA_FOUND internamente.

### 5. Função com cursor interno
**Arquivo:** `functions/oe/questao_05.sql`

Crie uma função que receba um CUSTOMER_ID e retorne, por meio de um cursor interno, a soma do ORDER_TOTAL de todos os pedidos desse cliente em PEDIDOS.

### 6. Função DETERMINISTIC
**Arquivo:** `functions/oe/questao_06.sql`

Crie uma função DETERMINISTIC que receba o ORDER_MODE de um pedido e retorne seu valor formatado no padrão título (primeira letra em maiúscula).

### 7. Função com parâmetro padrão
**Arquivo:** `functions/oe/questao_07.sql`

Crie uma função que aplique um desconto sobre o ORDER_TOTAL de um pedido em PEDIDOS, recebendo o percentual de desconto como parâmetro com valor padrão (DEFAULT) de 5%.

### 8. Função que retorna coleção
**Arquivo:** `functions/oe/questao_08.sql`

Crie uma função que receba um SALES_REP_ID e retorne uma coleção (tabela PL/SQL) contendo os ORDER_ID de todos os pedidos em PEDIDOS associados a esse vendedor.

### 9. Função recursiva
**Arquivo:** `functions/oe/questao_09.sql`

Crie uma função recursiva que calcule o valor de comissão de um pedido aplicando faixas percentuais progressivas sobre o ORDER_TOTAL (por exemplo, percentuais diferentes a cada faixa de valor), somando o resultado recursivamente por faixa.

### 10. Função em cláusula SELECT
**Arquivo:** `functions/oe/questao_10.sql`

Crie uma função escalar que formate o ORDER_TOTAL de um pedido como valor monetário e demonstre seu uso diretamente em uma cláusula SELECT sobre a tabela PEDIDOS.

## Packages — HR (FUNCIONARIOS)

### 1. Pacote simples
**Arquivo:** `packages/hr/questao_01.sql`

Crie um pacote chamado pkg_funcionarios contendo uma função que calcule o tempo de casa de um funcionário (com base em HIRE_DATE) e um procedimento que exiba o resultado formatado, ambos consultando a tabela FUNCIONARIOS.

### 2. Variáveis globais no pacote
**Arquivo:** `packages/hr/questao_02.sql`

Crie um pacote com uma variável global (contador de consultas) que seja incrementada a cada chamada de uma função de busca de funcionário em FUNCIONARIOS, demonstrando o estado compartilhado durante a sessão.

### 3. Especificação e corpo separados
**Arquivo:** `packages/hr/questao_03.sql`

Crie a especificação (PACKAGE) e o corpo (PACKAGE BODY) de um pacote pkg_funcionarios, com a assinatura de uma função de busca de funcionário por EMPLOYEE_ID na especificação e sua implementação completa no corpo, consultando FUNCIONARIOS.

### 4. Sobrecarga em pacote
**Arquivo:** `packages/hr/questao_04.sql`

Crie um pacote com duas versões sobrecarregadas de uma função calcular_bonus: uma recebendo um percentual sobre o SALARY e outra recebendo um valor fixo a ser somado, ambas operando sobre dados de FUNCIONARIOS.

### 5. Cursor no pacote
**Arquivo:** `packages/hr/questao_05.sql`

Crie um pacote que declare um cursor no PACKAGE BODY e exponha um procedimento que o percorra, listando via DBMS_OUTPUT todos os funcionários de um determinado DEPARTMENT_ID em FUNCIONARIOS.

### 6. Seção de inicialização do pacote
**Arquivo:** `packages/hr/questao_06.sql`

Crie um pacote com uma seção de inicialização (bloco BEGIN/END ao final do package body) que carregue em uma variável de estado o total de funcionários cadastrados em FUNCIONARIOS assim que o pacote for referenciado pela primeira vez na sessão.

### 7. Tipos definidos no pacote
**Arquivo:** `packages/hr/questao_07.sql`

Crie um pacote que defina um tipo RECORD (ex: tipo_funcionario, com EMPLOYEE_ID, nome e SALARY) e um tipo TABLE OF baseado nesse record, utilizados por uma função que retorna vários funcionários de FUNCIONARIOS.

### 8. Constantes e exceções no pacote
**Arquivo:** `packages/hr/questao_08.sql`

Crie um pacote com uma constante (ex: salário mínimo padrão) e uma exceção customizada, utilizadas por um procedimento que valida o SALARY antes de atualizar um registro em FUNCIONARIOS.

### 9. Elementos privados e públicos
**Arquivo:** `packages/hr/questao_09.sql`

Crie um pacote com um procedimento auxiliar declarado apenas no PACKAGE BODY (privado) que valida o formato do EMAIL, e um procedimento público que o utiliza internamente antes de inserir um registro em FUNCIONARIOS.

### 10. Pacote de CRUD
**Arquivo:** `packages/hr/questao_10.sql`

Crie um pacote pkg_funcionarios_crud com procedimentos para inserir, atualizar e excluir registros, e uma função para consultar funcionários, todos operando sobre a tabela FUNCIONARIOS.

## Packages — OE (PEDIDOS)

### 1. Pacote simples
**Arquivo:** `packages/oe/questao_01.sql`

Crie um pacote chamado pkg_pedidos contendo uma função que calcule os dias decorridos desde o ORDER_DATE e um procedimento que exiba o resultado formatado, ambos consultando a tabela PEDIDOS.

### 2. Variáveis globais no pacote
**Arquivo:** `packages/oe/questao_02.sql`

Crie um pacote com uma variável global (contador de consultas) que seja incrementada a cada chamada de uma função de busca de pedido em PEDIDOS, demonstrando o estado compartilhado durante a sessão.

### 3. Especificação e corpo separados
**Arquivo:** `packages/oe/questao_03.sql`

Crie a especificação (PACKAGE) e o corpo (PACKAGE BODY) de um pacote pkg_pedidos, com a assinatura de uma função de busca de pedido por ORDER_ID na especificação e sua implementação completa no corpo, consultando PEDIDOS.

### 4. Sobrecarga em pacote
**Arquivo:** `packages/oe/questao_04.sql`

Crie um pacote com duas versões sobrecarregadas de uma função calcular_desconto: uma recebendo um percentual sobre o ORDER_TOTAL e outra recebendo um valor fixo a ser descontado, ambas operando sobre dados de PEDIDOS.

### 5. Cursor no pacote
**Arquivo:** `packages/oe/questao_05.sql`

Crie um pacote que declare um cursor no PACKAGE BODY e exponha um procedimento que o percorra, listando via DBMS_OUTPUT todos os pedidos de um determinado CUSTOMER_ID em PEDIDOS.

### 6. Seção de inicialização do pacote
**Arquivo:** `packages/oe/questao_06.sql`

Crie um pacote com uma seção de inicialização (bloco BEGIN/END ao final do package body) que carregue em uma variável de estado o total de pedidos cadastrados em PEDIDOS assim que o pacote for referenciado pela primeira vez na sessão.

### 7. Tipos definidos no pacote
**Arquivo:** `packages/oe/questao_07.sql`

Crie um pacote que defina um tipo RECORD (ex: tipo_pedido, com ORDER_ID, ORDER_STATUS e ORDER_TOTAL) e um tipo TABLE OF baseado nesse record, utilizados por uma função que retorna vários pedidos de PEDIDOS.

### 8. Constantes e exceções no pacote
**Arquivo:** `packages/oe/questao_08.sql`

Crie um pacote com uma constante (ex: valor mínimo de pedido padrão) e uma exceção customizada, utilizadas por um procedimento que valida o ORDER_TOTAL antes de inserir um registro em PEDIDOS.

### 9. Elementos privados e públicos
**Arquivo:** `packages/oe/questao_09.sql`

Crie um pacote com um procedimento auxiliar declarado apenas no PACKAGE BODY (privado) que valida o ORDER_STATUS informado, e um procedimento público que o utiliza internamente antes de atualizar um registro em PEDIDOS.

### 10. Pacote de CRUD
**Arquivo:** `packages/oe/questao_10.sql`

Crie um pacote pkg_pedidos_crud com procedimentos para inserir, atualizar e excluir registros, e uma função para consultar pedidos, todos operando sobre a tabela PEDIDOS.

## Procedures — HR (FUNCIONARIOS)

### 1. Procedimento sem parâmetros
**Arquivo:** `procedures/hr/questao_01.sql`

Crie um procedimento que exiba, via DBMS_OUTPUT.PUT_LINE, a quantidade total de funcionários cadastrados na tabela FUNCIONARIOS.

### 2. Procedimento com parâmetros IN
**Arquivo:** `procedures/hr/questao_02.sql`

Crie um procedimento que receba um EMPLOYEE_ID e um novo SALARY como parâmetros IN e exiba uma mensagem formatada informando o funcionário e o novo salário a ser aplicado em FUNCIONARIOS.

### 3. Procedimento com parâmetro OUT
**Arquivo:** `procedures/hr/questao_03.sql`

Crie um procedimento que receba um EMPLOYEE_ID como parâmetro IN e retorne o SALARY correspondente em FUNCIONARIOS através de um parâmetro OUT.

### 4. Procedimento com parâmetro IN OUT
**Arquivo:** `procedures/hr/questao_04.sql`

Crie um procedimento que receba um SALARY através de um parâmetro IN OUT e aplique um reajuste percentual, alterando o valor da variável original ao final da execução.

### 5. Procedimento com INSERT
**Arquivo:** `procedures/hr/questao_05.sql`

Crie um procedimento que receba os dados de um novo funcionário como parâmetros e realize a inserção de um registro na tabela FUNCIONARIOS.

### 6. Procedimento com UPDATE condicional
**Arquivo:** `procedures/hr/questao_06.sql`

Crie um procedimento que receba um EMPLOYEE_ID e um percentual de aumento, atualizando o SALARY em FUNCIONARIOS apenas se o funcionário possuir COMMISSION_PCT definido.

### 7. Procedimento com tratamento de exceção
**Arquivo:** `procedures/hr/questao_07.sql`

Crie um procedimento que atualize o JOB_ID de um registro em FUNCIONARIOS e trate possíveis exceções (como registro inexistente), realizando ROLLBACK em caso de erro.

### 8. Procedimento que chama outro procedimento
**Arquivo:** `procedures/hr/questao_08.sql`

Crie dois procedimentos, onde o primeiro valida se um DEPARTMENT_ID informado é válido e o segundo, ao ser chamado, invoca o primeiro antes de inserir um novo funcionário em FUNCIONARIOS.

### 9. Procedimento com cursor explícito
**Arquivo:** `procedures/hr/questao_09.sql`

Crie um procedimento que declare e percorra um cursor explícito para listar, via DBMS_OUTPUT, todos os funcionários de um determinado DEPARTMENT_ID em FUNCIONARIOS.

### 10. Procedimento com parâmetro padrão
**Arquivo:** `procedures/hr/questao_10.sql`

Crie um procedimento que receba um EMPLOYEE_ID e um JOB_ID como parâmetros, sendo o JOB_ID um parâmetro opcional com valor padrão 'ST_CLERK', atualizando o cargo correspondente em FUNCIONARIOS.

## Procedures — OE (PEDIDOS)

### 1. Procedimento sem parâmetros
**Arquivo:** `procedures/oe/questao_01.sql`

Crie um procedimento que exiba, via DBMS_OUTPUT.PUT_LINE, a quantidade total de pedidos cadastrados na tabela PEDIDOS.

### 2. Procedimento com parâmetros IN
**Arquivo:** `procedures/oe/questao_02.sql`

Crie um procedimento que receba um ORDER_ID e um novo ORDER_STATUS como parâmetros IN e exiba uma mensagem formatada informando o pedido e o novo status a ser aplicado em PEDIDOS.

### 3. Procedimento com parâmetro OUT
**Arquivo:** `procedures/oe/questao_03.sql`

Crie um procedimento que receba um ORDER_ID como parâmetro IN e retorne o ORDER_TOTAL correspondente em PEDIDOS através de um parâmetro OUT.

### 4. Procedimento com parâmetro IN OUT
**Arquivo:** `procedures/oe/questao_04.sql`

Crie um procedimento que receba um ORDER_TOTAL através de um parâmetro IN OUT e aplique um desconto percentual, alterando o valor da variável original ao final da execução.

### 5. Procedimento com INSERT
**Arquivo:** `procedures/oe/questao_05.sql`

Crie um procedimento que receba os dados de um novo pedido como parâmetros e realize a inserção de um registro na tabela PEDIDOS.

### 6. Procedimento com UPDATE condicional
**Arquivo:** `procedures/oe/questao_06.sql`

Crie um procedimento que receba um ORDER_ID e um novo status, atualizando o ORDER_STATUS em PEDIDOS apenas se o pedido ainda não estiver com status 'COMPLETE'.

### 7. Procedimento com tratamento de exceção
**Arquivo:** `procedures/oe/questao_07.sql`

Crie um procedimento que atualize o ORDER_TOTAL de um registro em PEDIDOS e trate possíveis exceções (como registro inexistente), realizando ROLLBACK em caso de erro.

### 8. Procedimento que chama outro procedimento
**Arquivo:** `procedures/oe/questao_08.sql`

Crie dois procedimentos, onde o primeiro valida se um CUSTOMER_ID informado é válido e o segundo, ao ser chamado, invoca o primeiro antes de inserir um novo pedido em PEDIDOS.

### 9. Procedimento com cursor explícito
**Arquivo:** `procedures/oe/questao_09.sql`

Crie um procedimento que declare e percorra um cursor explícito para listar, via DBMS_OUTPUT, todos os pedidos de um determinado SALES_REP_ID em PEDIDOS.

### 10. Procedimento com parâmetro padrão
**Arquivo:** `procedures/oe/questao_10.sql`

Crie um procedimento que receba um ORDER_ID e um status como parâmetros, sendo o status um parâmetro opcional com valor padrão 'PENDING', atualizando o ORDER_STATUS correspondente em PEDIDOS.

## Stored Procedures — HR (FUNCIONARIOS)

### 1. Controle transacional
**Arquivo:** `stored-procedures/hr/questao_01.sql`

Crie uma stored procedure que realize múltiplas operações de escrita em sequência sobre a tabela FUNCIONARIOS, utilizando COMMIT ao final, ou ROLLBACK caso qualquer uma das operações falhe.

### 2. AUTONOMOUS_TRANSACTION
**Arquivo:** `stored-procedures/hr/questao_02.sql`

Crie uma stored procedure de log de auditoria que utilize PRAGMA AUTONOMOUS_TRANSACTION para registrar em uma tabela de log toda alteração de SALARY realizada em FUNCIONARIOS, independentemente do sucesso ou falha da transação principal que a chamou.

### 3. EXECUTE IMMEDIATE
**Arquivo:** `stored-procedures/hr/questao_03.sql`

Crie uma stored procedure que receba o nome de uma coluna de FUNCIONARIOS como parâmetro e utilize EXECUTE IMMEDIATE para construir e executar dinamicamente uma consulta de contagem de valores distintos dessa coluna.

### 4. Retorno via REF CURSOR
**Arquivo:** `stored-procedures/hr/questao_04.sql`

Crie uma stored procedure que receba um DEPARTMENT_ID como parâmetro e retorne, através de um parâmetro OUT do tipo SYS_REFCURSOR, todos os funcionários de FUNCIONARIOS daquele departamento.

### 5. Log de erros em tabela de auditoria
**Arquivo:** `stored-procedures/hr/questao_05.sql`

Crie uma stored procedure que, ao capturar uma exceção durante uma atualização em FUNCIONARIOS, registre o código do erro, a mensagem e a data/hora em uma tabela de log de erros antes de tratar a exceção.

### 6. Agendamento com DBMS_SCHEDULER
**Arquivo:** `stored-procedures/hr/questao_06.sql`

Escreva o script de uma stored procedure que gere um relatório periódico de aniversariantes de empresa (funcionários cujo HIRE_DATE completa aniversário no mês corrente) a partir de FUNCIONARIOS, e o comando DBMS_SCHEDULER.CREATE_JOB necessário para agendá-la para execução mensal.

### 7. Processamento em lote (BULK COLLECT/FORALL)
**Arquivo:** `stored-procedures/hr/questao_07.sql`

Crie uma stored procedure que utilize BULK COLLECT para carregar em uma coleção os EMPLOYEE_ID de FUNCIONARIOS de um departamento e FORALL para aplicar um reajuste de SALARY em lote de forma otimizada.

### 8. Parâmetro do tipo coleção
**Arquivo:** `stored-procedures/hr/questao_08.sql`

Crie um tipo de coleção (TABLE OF NUMBER, por exemplo) no nível de schema e uma stored procedure que receba uma lista de EMPLOYEE_ID como parâmetro, aplicando um bônus a cada funcionário informado em FUNCIONARIOS.

### 9. Relatório com DBMS_OUTPUT
**Arquivo:** `stored-procedures/hr/questao_09.sql`

Crie uma stored procedure que gere um relatório simples formatado (cabeçalho, linhas de dados e rodapé com totais) sobre os funcionários de FUNCIONARIOS agrupados por DEPARTMENT_ID, exibido via DBMS_OUTPUT.PUT_LINE.

### 10. Uso de SAVEPOINT
**Arquivo:** `stored-procedures/hr/questao_10.sql`

Crie uma stored procedure que execute uma série de atualizações em FUNCIONARIOS, defina um SAVEPOINT antes de uma etapa arriscada e realize ROLLBACK TO SAVEPOINT caso essa etapa específica falhe, mantendo as operações anteriores confirmadas.

## Stored Procedures — OE (PEDIDOS)

### 1. Controle transacional
**Arquivo:** `stored-procedures/oe/questao_01.sql`

Crie uma stored procedure que realize múltiplas operações de escrita em sequência sobre a tabela PEDIDOS, utilizando COMMIT ao final, ou ROLLBACK caso qualquer uma das operações falhe.

### 2. AUTONOMOUS_TRANSACTION
**Arquivo:** `stored-procedures/oe/questao_02.sql`

Crie uma stored procedure de log de auditoria que utilize PRAGMA AUTONOMOUS_TRANSACTION para registrar em uma tabela de log toda alteração de ORDER_STATUS realizada em PEDIDOS, independentemente do sucesso ou falha da transação principal que a chamou.

### 3. EXECUTE IMMEDIATE
**Arquivo:** `stored-procedures/oe/questao_03.sql`

Crie uma stored procedure que receba o nome de uma coluna de PEDIDOS como parâmetro e utilize EXECUTE IMMEDIATE para construir e executar dinamicamente uma consulta de contagem de valores distintos dessa coluna.

### 4. Retorno via REF CURSOR
**Arquivo:** `stored-procedures/oe/questao_04.sql`

Crie uma stored procedure que receba um SALES_REP_ID como parâmetro e retorne, através de um parâmetro OUT do tipo SYS_REFCURSOR, todos os pedidos em PEDIDOS associados a esse vendedor.

### 5. Log de erros em tabela de auditoria
**Arquivo:** `stored-procedures/oe/questao_05.sql`

Crie uma stored procedure que, ao capturar uma exceção durante uma atualização em PEDIDOS, registre o código do erro, a mensagem e a data/hora em uma tabela de log de erros antes de tratar a exceção.

### 6. Agendamento com DBMS_SCHEDULER
**Arquivo:** `stored-procedures/oe/questao_06.sql`

Escreva o script de uma stored procedure que arquive pedidos antigos (ORDER_DATE anterior a determinada data) da tabela PEDIDOS, e o comando DBMS_SCHEDULER.CREATE_JOB necessário para agendá-la para execução diária.

### 7. Processamento em lote (BULK COLLECT/FORALL)
**Arquivo:** `stored-procedures/oe/questao_07.sql`

Crie uma stored procedure que utilize BULK COLLECT para carregar em uma coleção os ORDER_ID de PEDIDOS com status 'PENDING' e FORALL para atualizar o status desses pedidos em lote de forma otimizada.

### 8. Parâmetro do tipo coleção
**Arquivo:** `stored-procedures/oe/questao_08.sql`

Crie um tipo de coleção (TABLE OF NUMBER, por exemplo) no nível de schema e uma stored procedure que receba uma lista de ORDER_ID como parâmetro, cancelando cada pedido informado em PEDIDOS.

### 9. Relatório com DBMS_OUTPUT
**Arquivo:** `stored-procedures/oe/questao_09.sql`

Crie uma stored procedure que gere um relatório simples formatado (cabeçalho, linhas de dados e rodapé com totais) sobre os pedidos de PEDIDOS agrupados por SALES_REP_ID, exibido via DBMS_OUTPUT.PUT_LINE.

### 10. Uso de SAVEPOINT
**Arquivo:** `stored-procedures/oe/questao_10.sql`

Crie uma stored procedure que execute uma série de atualizações em PEDIDOS, defina um SAVEPOINT antes de uma etapa arriscada e realize ROLLBACK TO SAVEPOINT caso essa etapa específica falhe, mantendo as operações anteriores confirmadas.

## Triggers — HR (FUNCIONARIOS)

### 1. Trigger BEFORE INSERT
**Arquivo:** `triggers/hr/questao_01.sql`

Crie um trigger BEFORE INSERT na tabela FUNCIONARIOS que preencha automaticamente a coluna HIRE_DATE (:NEW.HIRE_DATE) com a data atual, caso ela não tenha sido informada.

### 2. Trigger AFTER INSERT para auditoria
**Arquivo:** `triggers/hr/questao_02.sql`

Crie um trigger AFTER INSERT na tabela FUNCIONARIOS que registre em uma tabela de auditoria os dados do novo funcionário inserido.

### 3. Trigger BEFORE UPDATE para validação
**Arquivo:** `triggers/hr/questao_03.sql`

Crie um trigger BEFORE UPDATE na tabela FUNCIONARIOS que impeça a redução do SALARY (:NEW.SALARY menor que :OLD.SALARY), lançando uma exceção com RAISE_APPLICATION_ERROR.

### 4. Trigger AFTER DELETE para log
**Arquivo:** `triggers/hr/questao_04.sql`

Crie um trigger AFTER DELETE na tabela FUNCIONARIOS que registre em uma tabela de log os dados do funcionário excluído, incluindo usuário e data/hora da exclusão.

### 5. Trigger INSTEAD OF em view
**Arquivo:** `triggers/hr/questao_05.sql`

Crie uma view simples sobre a tabela FUNCIONARIOS que exponha apenas parte das colunas (não atualizável diretamente por conter expressões) e um trigger INSTEAD OF INSERT que direcione a inserção para a tabela base corretamente.

### 6. Trigger de linha com :OLD e :NEW
**Arquivo:** `triggers/hr/questao_06.sql`

Crie um trigger FOR EACH ROW na tabela FUNCIONARIOS que registre em uma tabela de histórico tanto o SALARY anterior (:OLD.SALARY) quanto o novo SALARY (:NEW.SALARY) a cada atualização.

### 7. Trigger de nível de comando (statement-level)
**Arquivo:** `triggers/hr/questao_07.sql`

Crie um trigger de nível de comando (sem FOR EACH ROW) na tabela FUNCIONARIOS, que registre em uma tabela de log apenas uma linha por comando de UPDATE executado, independentemente da quantidade de linhas afetadas.

### 8. Trigger para geração automática de sequence
**Arquivo:** `triggers/hr/questao_08.sql`

Crie uma sequence e um trigger BEFORE INSERT na tabela FUNCIONARIOS que preencha automaticamente a coluna EMPLOYEE_ID utilizando o próximo valor da sequence, caso ela não seja informada.

### 9. Trigger composto (compound trigger)
**Arquivo:** `triggers/hr/questao_09.sql`

Crie um compound trigger na tabela FUNCIONARIOS que utilize as seções BEFORE STATEMENT, BEFORE EACH ROW, AFTER EACH ROW e AFTER STATEMENT para validar e consolidar as alterações de SALARY durante operações em lote.

### 10. Trigger para restringir horário de operações
**Arquivo:** `triggers/hr/questao_10.sql`

Crie um trigger BEFORE INSERT OR UPDATE OR DELETE na tabela FUNCIONARIOS que impeça qualquer modificação fora do horário comercial (dias úteis, entre 8h e 18h), lançando uma exceção customizada quando violado.

## Triggers — OE (PEDIDOS)

### 1. Trigger BEFORE INSERT
**Arquivo:** `triggers/oe/questao_01.sql`

Crie um trigger BEFORE INSERT na tabela PEDIDOS que preencha automaticamente a coluna ORDER_DATE (:NEW.ORDER_DATE) com a data atual, caso ela não tenha sido informada.

### 2. Trigger AFTER INSERT para auditoria
**Arquivo:** `triggers/oe/questao_02.sql`

Crie um trigger AFTER INSERT na tabela PEDIDOS que registre em uma tabela de auditoria os dados do novo pedido inserido.

### 3. Trigger BEFORE UPDATE para validação
**Arquivo:** `triggers/oe/questao_03.sql`

Crie um trigger BEFORE UPDATE na tabela PEDIDOS que impeça a redução do ORDER_TOTAL (:NEW.ORDER_TOTAL menor que :OLD.ORDER_TOTAL), lançando uma exceção com RAISE_APPLICATION_ERROR.

### 4. Trigger AFTER DELETE para log
**Arquivo:** `triggers/oe/questao_04.sql`

Crie um trigger AFTER DELETE na tabela PEDIDOS que registre em uma tabela de log os dados do pedido excluído, incluindo usuário e data/hora da exclusão.

### 5. Trigger INSTEAD OF em view
**Arquivo:** `triggers/oe/questao_05.sql`

Crie uma view simples sobre a tabela PEDIDOS que exponha apenas parte das colunas (não atualizável diretamente por conter expressões) e um trigger INSTEAD OF INSERT que direcione a inserção para a tabela base corretamente.

### 6. Trigger de linha com :OLD e :NEW
**Arquivo:** `triggers/oe/questao_06.sql`

Crie um trigger FOR EACH ROW na tabela PEDIDOS que registre em uma tabela de histórico tanto o ORDER_STATUS anterior (:OLD.ORDER_STATUS) quanto o novo status (:NEW.ORDER_STATUS) a cada atualização.

### 7. Trigger de nível de comando (statement-level)
**Arquivo:** `triggers/oe/questao_07.sql`

Crie um trigger de nível de comando (sem FOR EACH ROW) na tabela PEDIDOS, que registre em uma tabela de log apenas uma linha por comando de UPDATE executado, independentemente da quantidade de linhas afetadas.

### 8. Trigger para geração automática de sequence
**Arquivo:** `triggers/oe/questao_08.sql`

Crie uma sequence e um trigger BEFORE INSERT na tabela PEDIDOS que preencha automaticamente a coluna ORDER_ID utilizando o próximo valor da sequence, caso ela não seja informada.

### 9. Trigger composto (compound trigger)
**Arquivo:** `triggers/oe/questao_09.sql`

Crie um compound trigger na tabela PEDIDOS que utilize as seções BEFORE STATEMENT, BEFORE EACH ROW, AFTER EACH ROW e AFTER STATEMENT para validar e consolidar as alterações de ORDER_TOTAL durante operações em lote.

### 10. Trigger para restringir horário de operações
**Arquivo:** `triggers/oe/questao_10.sql`

Crie um trigger BEFORE INSERT OR UPDATE OR DELETE na tabela PEDIDOS que impeça qualquer modificação fora do horário comercial (dias úteis, entre 8h e 18h), lançando uma exceção customizada quando violado.

## Views — HR (FUNCIONARIOS)

### 1. View simples
**Arquivo:** `views/hr/questao_01.sql`

Crie uma view que selecione apenas as colunas EMPLOYEE_ID, FIRST_NAME, LAST_NAME e JOB_ID da tabela FUNCIONARIOS, ocultando as demais colunas.

### 2. View com JOIN (self-join)
**Arquivo:** `views/hr/questao_02.sql`

Crie uma view que relacione, através de um self-join na tabela FUNCIONARIOS, cada funcionário com o nome do seu respectivo gerente (relacionando MANAGER_ID ao EMPLOYEE_ID do gerente).

### 3. View com filtro (WHERE)
**Arquivo:** `views/hr/questao_03.sql`

Crie uma view que exiba apenas os funcionários de FUNCIONARIOS com SALARY acima de um determinado valor, aplicando uma condição WHERE.

### 4. View com agregação
**Arquivo:** `views/hr/questao_04.sql`

Crie uma view que exiba o total e a média de SALARY por DEPARTMENT_ID, utilizando GROUP BY e funções agregadas (SUM, AVG) sobre a tabela FUNCIONARIOS.

### 5. View com WITH CHECK OPTION
**Arquivo:** `views/hr/questao_05.sql`

Crie uma view sobre a tabela FUNCIONARIOS filtrando apenas os funcionários de um DEPARTMENT_ID específico, utilizando WITH CHECK OPTION para impedir que inserções/atualizações através da view violem esse filtro.

### 6. View atualizável vs somente leitura
**Arquivo:** `views/hr/questao_06.sql`

Crie uma view simples e atualizável sobre a tabela FUNCIONARIOS, e outra view com agregação (portanto somente leitura) sobre a mesma tabela, demonstrando a diferença ao tentar realizar um UPDATE em cada uma.

### 7. View materializada
**Arquivo:** `views/hr/questao_07.sql`

Crie uma MATERIALIZED VIEW que armazene o resumo de SALARY por DEPARTMENT_ID a partir da tabela FUNCIONARIOS, definindo uma cláusula de atualização (REFRESH) apropriada.

### 8. View com subquery correlacionada
**Arquivo:** `views/hr/questao_08.sql`

Crie uma view que liste, a partir de FUNCIONARIOS, os funcionários cujo SALARY é maior que a média salarial do seu próprio DEPARTMENT_ID, utilizando uma subquery correlacionada.

### 9. View com UNION
**Arquivo:** `views/hr/questao_09.sql`

Crie uma view que combine, através de UNION ALL, os funcionários que recebem comissão (COMMISSION_PCT não nulo) e os que não recebem, a partir da tabela FUNCIONARIOS, padronizando as colunas exibidas.

### 10. View com colunas calculadas
**Arquivo:** `views/hr/questao_10.sql`

Crie uma view sobre a tabela FUNCIONARIOS que exiba, além das colunas originais, uma coluna calculada com o salário anual do funcionário (SALARY multiplicado por 12).

## Views — OE (PEDIDOS)

### 1. View simples
**Arquivo:** `views/oe/questao_01.sql`

Crie uma view que selecione apenas as colunas ORDER_ID, ORDER_DATE, ORDER_STATUS e ORDER_TOTAL da tabela PEDIDOS, ocultando as demais colunas.

### 2. View com JOIN (self-join)
**Arquivo:** `views/oe/questao_02.sql`

Crie uma view que relacione, através de um self-join na tabela PEDIDOS, cada pedido de um cliente com o pedido imediatamente anterior do mesmo CUSTOMER_ID, comparando as respectivas datas.

### 3. View com filtro (WHERE)
**Arquivo:** `views/oe/questao_03.sql`

Crie uma view que exiba apenas os pedidos de PEDIDOS com ORDER_TOTAL acima de um determinado valor, aplicando uma condição WHERE.

### 4. View com agregação
**Arquivo:** `views/oe/questao_04.sql`

Crie uma view que exiba o total e a média de ORDER_TOTAL por SALES_REP_ID, utilizando GROUP BY e funções agregadas (SUM, AVG) sobre a tabela PEDIDOS.

### 5. View com WITH CHECK OPTION
**Arquivo:** `views/oe/questao_05.sql`

Crie uma view sobre a tabela PEDIDOS filtrando apenas os pedidos de um ORDER_MODE específico, utilizando WITH CHECK OPTION para impedir que inserções/atualizações através da view violem esse filtro.

### 6. View atualizável vs somente leitura
**Arquivo:** `views/oe/questao_06.sql`

Crie uma view simples e atualizável sobre a tabela PEDIDOS, e outra view com agregação (portanto somente leitura) sobre a mesma tabela, demonstrando a diferença ao tentar realizar um UPDATE em cada uma.

### 7. View materializada
**Arquivo:** `views/oe/questao_07.sql`

Crie uma MATERIALIZED VIEW que armazene o resumo diário do total de pedidos (soma de ORDER_TOTAL por ORDER_DATE) a partir da tabela PEDIDOS, definindo uma cláusula de atualização (REFRESH) apropriada.

### 8. View com subquery correlacionada
**Arquivo:** `views/oe/questao_08.sql`

Crie uma view que liste, a partir de PEDIDOS, os pedidos cujo ORDER_TOTAL é maior que a média de ORDER_TOTAL do mesmo SALES_REP_ID, utilizando uma subquery correlacionada.

### 9. View com UNION
**Arquivo:** `views/oe/questao_09.sql`

Crie uma view que combine, através de UNION ALL, os pedidos com ORDER_STATUS igual a 'COMPLETE' e os pedidos com ORDER_STATUS igual a 'PENDING' a partir da tabela PEDIDOS, padronizando as colunas exibidas.

### 10. View com colunas calculadas
**Arquivo:** `views/oe/questao_10.sql`

Crie uma view sobre a tabela PEDIDOS que exiba, além das colunas originais, uma coluna calculada com o valor do pedido com um desconto percentual aplicado sobre ORDER_TOTAL.
