#!/usr/bin/env python


import sys
import os
import shutil
import ftplib
import pandas as pd
from glob import glob
import re
from contextlib import closing
import urllib.request as request
from Bio import SeqIO
import hashlib
from pyteomics import mztab


'''
General
'''
#connect to ftp and get the list of samples
ftp_url = 'ftp.pride.ebi.ac.uk'
samples_dir = 'pride/data/proteomes/proteogenomics/cell-lines'
id_dir = 'proteomics_lfq'
triqler_file_name = 'out_triqler.tsv'
mzTab_file_name = 'out.mzTab'
output_file = 'identified_peptides.tsv'
contaminants = 'contaminants.fasta'
canonical_proteins_fasta = 'UniProtr11Dec2019+Ensembl103+GENCODE33+RefSeq29May2020.proteins.fasta'
peps_id_dir = 'peptide_ids'
checksums_file = 'checklist.chk'

#get all canonical sequences from fasta
allcan_seqs = []
parsed_file = SeqIO.parse(canonical_proteins_fasta,"fasta")
for record in parsed_file:
    allcan_seqs.append(str(record.seq))
allcan_seqs = list(set(allcan_seqs))

#get protein IDs from the contaminated database
conatm_ids = '|'.join([x.strip('>').split(' ')[0] for x in open(contaminants, 'r').readlines() if x.startswith('>')])

def rep(x):
    return re.sub('{[^}]*}', '', x.replace('(','{').replace(')', '}').replace('.',''))


# In[10]:


#Get list of samples
try:
    ftp = ftplib.FTP(ftp_url, timeout=3600)
    ftp.login()
    ftplib.FTP.maxline = 100000
    ftp.cwd(samples_dir)
    samples_list = ftp.nlst()
except ftplib.all_errors:
    print('Failed to connect to the ftp site')

print("Number of Samples completed: " + str(len(samples_list)))


# In[11]:


checksums = {}
try:
    lines = []
    ftp.retrlines('RETR {}'.format(checksums_file), lines.append)
    for line in lines:
        checksums[line.strip().split(' ')[-1].lstrip('./')] = line.strip().split(' ')[0]
except ftplib.error_perm as e: #the search is not done yet!
    print('Failed to get checksums file: {} in {}'.format(checksums_file, ftp.pwd(), e))

'''
                ******mzTabl processing******
'''

#Download mzTab files to a local directory to minimize running time in later runs

#create id output directory if it does not exist
if not os.path.isdir(peps_id_dir):
    os.makedirs(peps_id_dir)
download_files = []
for sample in samples_list:
    try:
        remote_file_size = ftp.size('{}/{}/{}'.format(sample, id_dir, mzTab_file_name))
    except ftplib.error_perm as e: #the search is not done yet!
        print('No file is found for sample {}, error:{}'.format(sample, e))
        continue #to next sample

    file_url = 'http://{}/{}/{}/{}/{}'.format(ftp_url, samples_dir, sample, id_dir, mzTab_file_name)
    outfile = '{}/{}_{}'.format(peps_id_dir, sample, mzTab_file_name)

    remote_checksum = checksums['{}/{}/{}'.format(sample, id_dir, mzTab_file_name)]
    local_file_size = 0
    local_checksum = ''
    try:
        local_file_size = os.path.getsize(outfile)
        local_checksum = hashlib.md5(open(outfile, 'rb').read()).hexdigest()
    except FileNotFoundError:
        pass
    if local_file_size != remote_file_size or local_checksum!=remote_checksum:
        print('Downloading:', file_url)
        with closing(request.urlopen(file_url)) as r:
            with open(outfile, 'wb') as f:
                shutil.copyfileobj(r, f)
        ftp.sendcmd('PASV')#just to avoid server timeout
    else:
        print('Already exists: ', outfile)
    download_files.append(outfile)


# In[25]:


#shorten accessions to save memory
def rep_acc(accessions):
    rep_accessions = []
    for acc in accessions.split(','):
        if acc.startswith('ENSP'):
            rep_accessions.append('ENSP')
        elif acc.split('_')[0] in ['altorf', 'pseudo', 'ncRNA', 'DECOY']:
            rep_accessions.append(acc.split('_')[0])
        elif acc.split(':')[0] in ['COSMIC', 'cbiomut']:
            rep_accessions.append(acc.split(':')[0])
        else:
            rep_accessions.append(acc)
    return ','.join(list(set(rep_accessions)))


# In[26]:


#Extract peptides from mzTab files

#get all peptides from the finished samples
mztab_psms_df = pd.DataFrame()
for mzTab_file in glob(peps_id_dir+'/*.mzTab'):
    sample = mzTab_file.split('/')[-1].split('_')[0]
    tables = mztab.MzTab(mzTab_file)#give the mzTab file content
    psms = tables.spectrum_match_table.loc[:, ['sequence', 'accession', 'search_engine_score[1]']]
    psms['accession'] = psms['accession'].apply(rep_acc)
    psms['Sample'] = sample
    print('Sample {}, #PSMS: {}'.format(sample, len(psms)))
    mztab_psms_df = pd.concat([mztab_psms_df, psms])

mztab_psms_df.columns
print('\nExtracted {} PSMs from {} Samples, Avg. PSMs per Sample: {}\n'.format(len(mztab_psms_df), len(set(mztab_psms_df['Sample'])), len(mztab_psms_df)/len(set(mztab_psms_df.Sample))))
