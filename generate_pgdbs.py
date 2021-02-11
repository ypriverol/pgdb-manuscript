'''
Created on 10 Feb 2021

@author: husen
'''
import os
import sys
import glob
import argparse
import json

def parse_commandline_args():
    """
    read command line arguments or set the default values
    """
    parser = argparse.ArgumentParser(description='Get colums from the second file for the first file')
    parser.add_argument('-c', '--cosmic_cell_names', help= "File containing all COSMIC cell line names, single column", required=True)
    parser.add_argument('-p', '--path_to_datasets', help= "Path to directory containing tsv files, each for a sample dataset", required=True)
    parser.add_argument('-o', '--outdir', help= "Output file directory", default = 'sample_specific_dbs')
    
    return parser.parse_args(sys.argv[1:])
    
def update_cell_name(cell_name, cosmic_cell_names):
    if cell_name in cosmic_cell_names:
        return cell_name
    elif cell_name.upper() in cosmic_cell_names:
        return cell_name.upper()
    elif cell_name.lower() in cosmic_cell_names:
        return cell_name.lower()
    elif cell_name.replace(' cell', '') in cosmic_cell_names:
        return cell_name.replace(' cell', '')
    elif 'NCI-'+cell_name in cosmic_cell_names:
        return 'NCI-'+cell_name
    elif cell_name.replace('-', '') in cosmic_cell_names:
        return cell_name.replace('-', '')
    elif cell_name.replace(' ', '-') in cosmic_cell_names:
        return cell_name.replace(' ', '-')
    elif cell_name.replace(' ', '') in cosmic_cell_names:
        return cell_name.replace(' ', '')
    elif cell_name.replace(' ', '_') in cosmic_cell_names:
        return cell_name.replace(' ', '_')
    elif cell_name.replace('OVCAR', 'OVCAR-').replace('HOP', 'HOP-') in cosmic_cell_names:
        return cell_name.replace('OVCAR', 'OVCAR-').replace('HOP', 'HOP-')
    else:
        return None
    
def get_sample_cellline_matches(datasets, cosmic_cell_names, cosmic_cell_name_matches):
    
    samples_celllines = {}
    cell_lines_not_in_cosmic = {}
    for dataset in datasets:
        with open(dataset, 'r') as ds:
            header = ds.readline().strip().split('\t')
            cell_line_index = header.index('characteristics[cell line]')
            id_index= header.index('source name')
            for l in ds.readlines():
                sl = l.strip().split('\t')
                sample_id = sl[id_index]
                cell_name = sl[cell_line_index]
                try:
                    cell_name = cosmic_cell_name_matches[sl[cell_line_index]]
                except KeyError:
                    cell_name = update_cell_name(cell_name, cosmic_cell_names)
                if not cell_name:
                    try:
                        cell_lines_not_in_cosmic[sl[cell_line_index]].append(sl[id_index])
                    except KeyError:
                        cell_lines_not_in_cosmic[sl[cell_line_index]] = [sl[id_index]]
                    continue
                
                samples_celllines[sample_id]= cell_name
                cosmic_cell_name_matches[sl[cell_line_index]] = cell_name
    
    return samples_celllines, cosmic_cell_name_matches, cell_lines_not_in_cosmic


if __name__ == '__main__':
    args = parse_commandline_args()
    
    datasets = glob.glob(args.path_to_datasets + '/*.tsv')
    cosmic_cell_names = set([x.strip() for x in open(args.cosmic_cell_names, 'r').readlines()])
    
    cell_names_mapped_to_cosmic = {'MCF7AdrR': 'MCF7',  'MCF7/AdrR': 'MCF7', 'U-251 MG': 'U251', 
                                'SKOV3': 'SK-OV-3', 'Caki1': 'CAKI-1', 'K562': 'K-562',
                                'RPMI8226': 'RPMI-8226', 'COLO205': 'COLO-205', 'HCT116': 'HCT-116',
                                 'A-549 cell': 'A549', 'HS578T': 'Hs-578-T', 'BT549': 'BT-549',
                                 'CCRFCEM': 'CCRF-CEM', 'HCT15': 'HCT-15', 
                                 'MDAMB231': 'MDA-MB-231', 'MDAMB453': 'MDA-MB-453'}
    
    samples_celllines, cell_names_mapped_to_cosmic, cell_lines_not_in_cosmic = get_sample_cellline_matches(
                            datasets, cosmic_cell_names, cell_names_mapped_to_cosmic)
    with open('generate_db_commands.sh', 'w') as cmds:
        cmds.write('cosmic_user_name=""' + '\n')
        cmds.write('cosmic_password=""' + '\n\n')
        for sample_id, cell_line in samples_celllines.items():
            cmd = '''nextflow main.nf -profile docker --cosmic_celllines true --add_reference false --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name {cell_line} --final_database_protein {sample_id}.fa --outdir {outdir} -resume
            '''.format(cell_line = cell_line, sample_id  = sample_id, outdir = args.outdir)
            #os.system(cmd)
            cmds.write(cmd + '\n')
    print('Databases can be made for {} datasets'.format(len(set(samples_celllines.values()))))
    print('No cosmic cell lines are found for these cell line datasets:\n{}'.format('\n'.join([x+': '+','.join(set(y)) for x,y in cell_lines_not_in_cosmic.items()])))
    print('Please run commands.sh to generate the databases using pgdb')
    