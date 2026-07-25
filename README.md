# PL/SQL Oracle Live SQL

A collection of hands-on PL/SQL exercises for [Oracle Live SQL](https://livesql.oracle.com/). Self-contained scripts organized by topic and data domain, ready to run in your session.

## Project structure

```
plsql-oracle-live-sql/
├── exceptions/          (20 exercises: hr/ + oe/)
├── functions/           (20 exercises: hr/ + oe/)
├── packages/            (20 exercises: hr/ + oe/)
├── procedures/          (20 exercises: hr/ + oe/)
├── stored-procedures/   (20 exercises: hr/ + oe/)
├── triggers/            (20 exercises: hr/ + oe/)
├── views/               (20 exercises: hr/ + oe/)
├── lista-exercicios-plsql.md
├── LICENSE
└── README.md
```

Each topic folder contains two subfolders:

- **`hr/`** — 10 exercises using **FUNCIONARIOS** (from `HR.EMPLOYEES`)
- **`oe/`** — 10 exercises using **PEDIDOS** (from `OE.ORDERS`)

**Total: 140 exercises** (7 topics × 2 domains × 10 questions).

## Topics covered

| Folder | Main concepts |
|---|---|
| `exceptions/` | NO_DATA_FOUND, TOO_MANY_ROWS, RAISE_APPLICATION_ERROR, PRAGMA EXCEPTION_INIT, SQLCODE/SQLERRM |
| `functions/` | Scalar, boolean, and recursive functions, DETERMINISTIC, collections, DEFAULT parameters |
| `packages/` | Specification/body, global variables, overloading, RECORD/TABLE types, CRUD |
| `procedures/` | IN/OUT/IN OUT parameters, INSERT/UPDATE, explicit cursors, procedure calls |
| `stored-procedures/` | Transaction control, AUTONOMOUS_TRANSACTION, EXECUTE IMMEDIATE, REF CURSOR, BULK COLLECT/FORALL, SAVEPOINT |
| `triggers/` | BEFORE/AFTER, INSTEAD OF, compound triggers, sequences, business hours restriction |
| `views/` | Simple views, JOIN, aggregation, WITH CHECK OPTION, materialized view, UNION |

## Prerequisites

- Access to [Oracle Live SQL](https://livesql.oracle.com/)
- Sample schemas **HR** and **OE** available in the environment

## How to use

1. Open [Oracle Live SQL](https://livesql.oracle.com/)
2. Copy the full contents of a file (e.g. `exceptions/hr/question_01.sql`)
3. Run the script with **Run Script** (executes the entire file)
4. Check the result grid (`RESULTADO` column) or the **DBMS Output** panel

Each file is **self-contained**: it creates only the base table required for its domain, implements the solution, and includes a demonstration block when applicable.

### Base tables by subfolder

**HR exercises** create only:

```sql
CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;
```

**OE exercises** create only:

```sql
CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;
```

## Oracle Live SQL output

### Run Script vs Run Statement

- **Run Script**: runs the full file. Use this mode.
- **Run Statement**: runs only the selected block and may skip the demo.

### Visible output with `RESULTADO_DEMO`

Oracle Live SQL does not support SQL\*Plus commands such as `VAR` and `PRINT`. Scripts with a demonstration store the main message in a local table and query it at the end:

```sql
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
  v_resultado := 'Message shown in the result grid.';
  DELETE FROM RESULTADO_DEMO;
  INSERT INTO RESULTADO_DEMO VALUES (v_resultado);
  DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

SELECT RESULTADO FROM RESULTADO_DEMO;
```

For multiple lines, use `RESULTADO_DEMO (ORDEM NUMBER, RESULTADO VARCHAR2(4000))` and end with `SELECT ORDEM, RESULTADO FROM RESULTADO_DEMO ORDER BY ORDEM;`.

**Exceptions to this pattern:**

- `functions/*/question_10.sql` — result via direct `SELECT` using the function in the query
- `stored-procedures/*/question_09.sql` — detailed report in DBMS Output; summary in `RESULTADO_DEMO`
- Simple view scripts — demonstration via `SELECT` on the view

### DBMS Output panel

Open **DBMS Output** / **Script Output** at the bottom of the Live SQL screen after running a script.

## Exercise rules

- Each question lives in a single `.sql` file with no dependencies on other files
- Auxiliary objects (log tables, sequences, types) are created within the same script
- Scripts use idempotent `DROP` blocks so they can be re-run safely

## Exercise descriptions

Detailed descriptions for each question are in [lista-exercicios-plsql.md](lista-exercicios-plsql.md).

## Examples of commits

```
git add . && git commit -m ":rocket: Initial commit." && git push
git add . && git commit -m ":building_construction: Added initial project architecture." && git push
git add . && git commit -m ":building_construction: Update project architecture." && git push
git add . && git commit -m ":memo: Updated project documentation." && git push
git add . && git commit -m ":memo: Updated code documentation." && git push
git add . && git commit -m ":white_check_mark: Added feature xyz." && git push
git add . && git commit -m ":wrench: Fixed xyz usage." && git push
git add . && git commit -m ":heavy_minus_sign: Removed xyz." && git push
git add . && git commit -m ":memo: Adjusted project imports." && git push
git add . && git commit -m ":arrow_up: Updated dependencies." && git push
git add . && git commit -m ":arrow_down: Removed dependencies." && git push
git add . && git commit -m ":wastebasket: Removed unused code." && git push
git add . && git commit -m ":test_tube: Added test functionality xyz." && git push
git add . && git commit -m ":construction_worker: Building in progress." && git push
git add . && git commit -m ":construction_worker: Added CI build system." && git push
```

## License

MIT License

Copyright (c) 2026 William Franco

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
