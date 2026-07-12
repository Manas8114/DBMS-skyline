# DBMS-skyline

Airline database management system project — SQL queries, ER diagrams, CSV datasets, and lab workbook for academic DBMS coursework.

## Contents

| File | Description |
|------|-------------|
| `ALL queries.txt` | Complete SQL query set (DDL, DML, joins, aggregations) |
| `dbmscode.py` | Python/SQLite3 interaction script |
| `dbmssqlite3.sql` | SQLite schema + data loading |
| `sqlcode.js` | JavaScript/SQL integration |
| `sqlserverbased.py` | SQL Server connectivity |
| `ssqql.json` | Schema/metadata JSON |
| `week_1,2,3,4.ipynb` | Jupyter notebook with weekly lab work |
| `DBMS.*.csv` | Airline data tables (AirFare, Airplane_type, Airport, Can_Land, Countries, Employees, Flight, Passengers, Route, Transactions, Travels_on) |
| `DBMS-Lab-WorkBook Original *.pdf` | Lab workbooks (scanned) |
| `Airline database ppt.pptx` | Presentation slides |
| `Project Report.pdf` | Final project report |
| `manas.pdf` | Additional documentation |

## Database Schema (Airline Domain)

Core tables:
- `Airport` — Airport codes, names, cities, countries
- `Airplane_type` — Model, capacity, manufacturer
- `Flight` — Flight numbers, routes, schedules, airplane assignments
- `Route` — Origin/destination airports, distance
- `Passengers` — Passenger details, bookings
- `Employees` — Staff, roles, assignments
- `Transactions` — Payments, fares
- `Can_Land` — Airplane type ↔ Airport compatibility

## Quick Start

```bash
# Load SQLite database
sqlite3 airline.db < dbmssqlite3.sql

# Or run Python loader
python dbmscode.py

# Explore CSV data
# All DBMS.*.csv files loadable via pandas/csv modules
```

## Course Context

Academic project — DBMS lab course (weeks 1-4). Covers:
- ER modeling → Relational schema
- Normalization (1NF–3NF)
- SQL (basic → advanced: subqueries, views, triggers, stored procedures)
- Indexing & query optimization
- Transaction management (ACID)
- NoSQL comparison (MongoDB via CSV import)

## License

Academic/educational use only.