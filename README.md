# SQL-Data-Cleaning
Data cleaning in SQL
---

### Refined SQL Data Cleaning & Preprocessing Workflow

**Step 0: Understand the data structure**

* Review schema (`DESCRIBE` in MySQL, `sp_help`/`INFORMATION_SCHEMA` in SQL Server).
* Check relationships between tables (PK–FK, constraints).

**Step 1: Explore the data**

* Run summary queries (`COUNT`, `MIN`, `MAX`, `AVG`, `DISTINCT`, `STDDEV`).
* Identify distributions, outliers, and inconsistencies.

**Step 2: Standardize data formats**

* Convert dates to a standard format (e.g., `YYYY-MM-DD`).
* Ensure numeric fields are stored as numeric (not text).
* Unify currency, percentages, phone formats, etc.

**Step 3: Remove duplicates**

* Use `ROW_NUMBER()` / `RANK()` with `PARTITION BY` to identify duplicates.
* Decide whether to keep first/last or aggregate.

**Step 4: Handle nulls & missing values**

* Replace with defaults (`COALESCE()` / `ISNULL()` / `CASE`).
* Flag rows with too many missing values.
* Sometimes delete if non-recoverable.

**Step 5: Standardize string/text variables**

* Trim spaces (`LTRIM`, `RTRIM`).
* Convert case (e.g., `UPPER()`, `LOWER()`).
* Remove special characters with `REPLACE()` / `REGEXP_REPLACE()`.
* Normalize categorical values (e.g., "NY", "New York" → "New York").

**Step 6: Filter out bad/outlier data**

* Remove invalid IDs (negative, 0).
* Check referential integrity (foreign keys).
* Identify outliers (e.g., sales > 1 billion) — either correct or exclude.

**Step 7: Rename columns / restructure schema**

* Use aliases or `sp_rename` for clarity.
* Create staging/clean tables.

**Step 8: Data integrity checks** *(important step you missed)*

* Validate uniqueness of primary keys.
* Validate foreign key consistency.
* Check expected value ranges.

**Step 9: Create final views/tables for analysis**

* Materialize cleaned data into a new table or a view.
* Aggregate if necessary.

**Step 10: Visualization/reporting**

* Build summary tables or export to BI tools (Power BI, Tableau).

---

👉 Key extra steps to add:

* **Outlier detection/handling** (statistical checks, z-score, IQR).
* **Data integrity validation** (primary keys, relationships).
* **Audit logging** (keeping raw vs cleaned version).

---
