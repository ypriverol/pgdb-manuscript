'''
Created on 17 Feb 2021

@author: husen
'''

import sys
import glob
import argparse
import xlsxwriter

def parse_commandline_args():
    """
    read command line arguments or set the default values
    """
    parser = argparse.ArgumentParser(description='Combine sdrf files into one tsv file')
    parser.add_argument('-p', '--path_to_datasets', default = 'multiomics-configs/datasets/cancer-celllines-samples/sample-specific/', 
                        help= "Path to directory containing tsv files, each for a sample dataset")
    parser.add_argument('-o', '--output_file', default = 'combined_sdrfs', help= "output file name")
    
    return parser.parse_args(sys.argv[1:])

def read_datasets(datasets, output):
    
    column_indices = {}
    
    for dataset in datasets:
        with open(dataset, 'r') as ds:
            header = ds.readline().strip().lower().split('\t')
            if  len(header)>2:
                for i, col in enumerate(header):
                    column_indices[col] = 1
    workbook = xlsxwriter.Workbook(output+'.xlsx')
    worksheet = workbook.add_worksheet()
    row = 0
    with open(output+'.tsv', 'w') as out:
        for i, col in enumerate(column_indices.keys()):
            worksheet.write(row, i, col) 
        row+=1

        out.write('\t'.join(column_indices.keys()) + '\n')
        
        for dataset in datasets:
            with open(dataset, 'r') as ds:
                header = ds.readline().strip().lower().split('\t')
                for col in column_indices.keys():
                    if col in header:
                        column_indices[col]= header.index(col)
                    else:
                        column_indices[col] = 'NA'
                
                for l in ds.readlines():
                    out_sl = []
                    sl = l.strip().split('\t')
                    for col,i in column_indices.items():
                        if i !='NA':
                            out_sl.append(sl[i])
                        else:
                            out_sl.append('NA')
                    out.write('\t'.join(out_sl) + '\n')
                    for i, col in enumerate(out_sl):
                        worksheet.write(row, i, col) 
                    row+=1
    workbook.close() 
    
if __name__ == '__main__':
    args = parse_commandline_args()
    datasets = glob.glob(args.path_to_datasets + '/*.tsv')
    read_datasets(datasets, output = args.output_file)
    