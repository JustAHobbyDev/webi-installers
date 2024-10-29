---
title: sq
homepage: https://github.com/neilotools/sq
tagline: |
  It is the lovechild of sql+jq.
---

To update or switch versions, run `webi sq@stable` or `webi sq@beta`, etc.

### Files

These are the files / directories that are created and/or modified with this
install:

```text
~/.config/envman/PATH.env
~/.local/bin/sq
~/.local/share/man/man1/sq.1
```

## Cheat Sheet

>The `sq` command is a powerful CLI tool designed for data manipulation and querying
>It allows users to interact with various data formats, including JSON, CSV, SQL databases, and more, making it easier to extract, transform, and analyze data directly from the command line
>The tool's flexibility makes it ideal for quick data processing tasks without the need for complex programming.

### Basic Usage
```bash
sq [OPTIONS] [COMMAND] [ARGUMENTS]
```

### Common Options and Commands

#### 1. Basic Querying
```bash
sq query 'SELECT * FROM data.csv WHERE column > 10'
```
- **Description**: Execute SQL-like queries on data files directly.

#### 2. Listing Tables
```bash
sq tables -f data.csv
```
- **Description**: Lists the tables or sheets in a file. Useful for multi-sheet files like Excel workbooks.

#### 3. Formatting Output
```bash
sq query 'SELECT * FROM data' --format json
```
- **`--format`**: Specify output format. Options include `json`, `csv`, `table`.

#### 4. Reading from a Database
```bash
sq query -d sqlite.db 'SELECT * FROM users'
```
- **`-d`**: Specify the database file to query from, with support for formats like SQLite, PostgreSQL, and MySQL.

#### 5. Specifying Input Files
```bash
sq query -i data.json -i data.csv 'SELECT * FROM data'
```
- **`-i`**: Use multiple input files for combined queries or joining data across sources.

#### 6. Exporting Results
```bash
sq query 'SELECT * FROM data' > results.csv
```
- **Redirection**: Use `>` to export results to a file.

#### 7. Using Environment Variables
```bash
export SQLITEDB="my_database.db"
sq query -d $SQLITEDB 'SELECT * FROM example'
```
- **Environment Variables**: Store database paths or configurations in environment variables for convenience.

### Advanced Usage

#### Joins Across Files
```bash
sq query -i users.csv -i orders.csv 'SELECT * FROM users JOIN orders ON users.id = orders.user_id'
```
- **Description**: Perform SQL-style joins across multiple files.

#### Aggregation
```bash
sq query 'SELECT COUNT(*), AVG(column) FROM data.csv'
```
- **Description**: Use SQL aggregation functions like `COUNT`, `SUM`, `AVG` to analyze data.

#### Filtering Data
```bash
sq query 'SELECT * FROM data WHERE column LIKE "%value%"'
```
- **Description**: Filter rows based on conditions, useful for data extraction.

### Examples

- **Querying JSON Data**:
    ```bash
    sq query -i data.json 'SELECT * FROM json_table WHERE key = "value"'
    ```

- **Exporting Output in JSON Format**:
    ```bash
    sq query 'SELECT * FROM data' --format json > output.json
    ```

### Help and Documentation
```bash
sq --help
```
- **Description**: Displays help information with detailed command and option descriptions.
```

This cheat sheet provides a quick reference for some of the most commonly used features of the `sq` tool. Adjust the example commands as needed for specific data or database formats.
## Cheat Sheet

> `yq` is like [`jq`](../jq), meaning that it's like `sed` for YAML data - you
> can use it to slice and filter and map and transform structured data with the
> same ease that `sed`, `awk`, `grep` and friends let you play with text.

Usage: `yq e '<selector>' <filepath>`

Works with YAML:

```sh
echo 'name: John' | yq  e '.name' -
```

Works with JSON:

```sh
echo '[ { "name": "John" }, { "name": "Jane" } ]' | yq e '.[].name' -
```

See <https://sq.io/> for the docs.
