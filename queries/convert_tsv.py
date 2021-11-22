import os
import csv
import glob
from tqdm import tqdm

# read tab-delimited file
# tsv_files = [f for f in glob.glob("../data/*.tsv")]
tsv_files = ['../data/title.principals.tsv', '../data/title.ratings.tsv', '../data/title_akas.tsv']
for f in tqdm(tsv_files):
    new_fname = '../data/csvs/' + f[8:-4] + '.csv'
    # print(new_fname)
    with open(f, 'r') as fin:
        print('reading tsvs')
        cr = csv.reader(fin, delimiter='\t')
        filecontents = [line for line in cr]

    # write comma-delimited file (comma is the default delimiter)
    with open(new_fname,'w') as fou:
        print('writing csvs')
        cw = csv.writer(fou, delimiter='|', quotechar='', quoting=csv.QUOTE_NONE)
        cw.writerows(filecontents)

print('All done!')