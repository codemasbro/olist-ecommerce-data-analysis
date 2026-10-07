import duckdb

con = duckdb.connect("olist_analytics.duckdb")

tables = con.execute("""
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'main'
    ORDER BY table_name
""").fetchall()

print("DATABASE OLIST")
print("=" * 50)

for table in tables:
    table_name = table[0]

    count = con.execute(
        f'SELECT COUNT(*) FROM "{table_name}"'
    ).fetchone()[0]

    print(f"{table_name:<45} {count:,} rows")

con.close()