import duckdb
from pathlib import Path

# Lokasi project
BASE_DIR = Path(__file__).resolve().parent

# Folder dataset Olist
DATA_DIR = BASE_DIR / "archive"

# Database DuckDB
DB_PATH = BASE_DIR / "olist_analytics.duckdb"

# Koneksi ke DuckDB
con = duckdb.connect(str(DB_PATH))

print("=" * 60)
print("OLIST E-COMMERCE DATABASE SETUP")
print("=" * 60)

# Ambil semua file CSV
csv_files = list(DATA_DIR.glob("*.csv"))

if not csv_files:
    print("Tidak ada file CSV ditemukan di folder archive.")
else:
    for csv_file in csv_files:

        table_name = csv_file.stem

        print(f"\nLoading : {csv_file.name}")
        print(f"Table   : {table_name}")

        con.execute(f"""
            CREATE OR REPLACE TABLE "{table_name}" AS
            SELECT *
            FROM read_csv_auto('{csv_file.as_posix()}')
        """)

        count = con.execute(
            f'SELECT COUNT(*) FROM "{table_name}"'
        ).fetchone()[0]

        print(f"Rows    : {count:,}")

print("\n" + "=" * 60)
print("DATABASE SETUP SELESAI")
print("=" * 60)

con.close()