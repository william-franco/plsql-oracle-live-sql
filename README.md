# PL/SQL Oracle Live SQL

A collection of hands-on PL/SQL exercises for [Oracle Live SQL](https://livesql.oracle.com/). Contains **70 self-contained scripts** organized into 7 topics with 10 questions each.

## Project structure

```
plsql-oracle-live-sql/
├── exceptions/          (10 exercises)
├── functions/           (10 exercises)
├── packages/            (10 exercises)
├── procedures/          (10 exercises)
├── stored-procedures/   (10 exercises)
├── triggers/            (10 exercises)
├── views/               (10 exercises)
├── lista-exercicios-plsql.md
├── LICENSE
└── README.md
```

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
- Sample schemas **HR** and **OE** available in the environment (used by scripts to create local tables)

## How to use

1. Open [Oracle Live SQL](https://livesql.oracle.com/)
2. Copy the full contents of a file (e.g. `exceptions/questao_01.sql`)
3. Run the script in your session
4. Each file creates its own tables and runs a demonstration at the end

All exercises use local tables derived from the sample schemas:

```sql
CREATE TABLE FUNCIONARIOS AS SELECT * FROM HR.EMPLOYEES;
CREATE TABLE PEDIDOS AS SELECT * FROM OE.ORDERS;
```

- **FUNCIONARIOS** — based on `HR.EMPLOYEES`
- **PEDIDOS** — based on `OE.ORDERS`

## Exercise rules

- Each question lives in a single `.sql` file with no dependencies on other files
- Auxiliary objects (log tables, sequences, types) are created within the same script
- Scripts include demonstration blocks when applicable (`DBMS_OUTPUT`, `SELECT`, etc.)

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
