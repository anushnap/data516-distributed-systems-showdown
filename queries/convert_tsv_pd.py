import os
import pandas as pd
from tqdm import tqdm

# tsv_files = ['../data/title.principals.tsv', '../data/title.ratings.tsv', '../data/title_akas.tsv']
tsv_files = ['../data/title_akas.tsv']

for tsv in tsv_files:
    print('Reading dataframe in chunks: ' + tsv)
    dfs = pd.read_csv(tsv, sep='\t', chunksize=50)
    for df in tqdm(dfs):
        # print('Writing dfs')
        df.to_csv('../data/test_tsv_conversion/file.csv', sep='|', index=False, mode='a')