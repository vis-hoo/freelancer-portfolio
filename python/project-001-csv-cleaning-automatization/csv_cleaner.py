import pandas as pd

in_file = "in_dataset.csv"
out_file = "out_dataset.csv"
date_column = "date_column"

df = pd.read_csv(in_file)
df = df.drop_duplicates()

df[date_column] = pd.to_datetime(
    df[date_column],
    format="%m/%d/%Y",
    errors="coerce" # raise to stop execution if there are invalid date formats
)

df[date_column] = df[date_column].dt.strftime("%Y-%m-%d")

df.to_csv(out_file, index=False)

print(f"Clean file saved to: {out_file}")
