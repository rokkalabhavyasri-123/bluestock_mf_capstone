import pandas as pd
from pathlib import Path

files = Path("data/raw").glob("*.csv")

for file in files:

    print("="*50)
    print(file.name)

    df = pd.read_csv(file)

    print("Shape:")
    print(df.shape)

    print("Dtypes:")
    print(df.dtypes)

    print("Head:")
    print(df.head())