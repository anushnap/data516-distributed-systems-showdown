import os
import pandas as pd
from tqdm import tqdm

# tsv_files = ['../data/title.principals.tsv', '../data/title.ratings.tsv', '../data/title_akas.tsv']
tsv_files = ['../data/title.ratings.tsv']

for tsv in tsv_files:
    new_fname = '../data/csvs/' + tsv[8:-4] + '.csv'
    print('Reading dataframe in chunks: ' + tsv)
    dfs = pd.read_csv(tsv, sep='\t', chunksize=50)
    
    for df in tqdm(dfs):
        # print('Writing dfs')
        df.to_csv(new_fname, sep='|', index=False, mode='a')