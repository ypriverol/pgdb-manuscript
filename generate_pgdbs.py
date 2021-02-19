'''
Created on 10 Feb 2021

@author: husen
'''
import sys
import glob
import argparse

def parse_commandline_args():
    """
    read command line arguments or set the default values
    """
    parser = argparse.ArgumentParser(description='Generate pgdb commands for sdrf datasets')
    parser.add_argument('-c', '--cosmic_cell_names', default = 'cosmic_cellline_names.txt', 
                        help= "File containing all COSMIC cell line names, single column")
    parser.add_argument('-p', '--path_to_datasets', default = 'multiomics-configs/datasets/cancer-celllines-samples/sample-specific/', 
                        help= "Path to directory containing tsv files, each for a sample dataset")
    parser.add_argument('-cl', '--clinical_samples_file', default = 'ccle_broad_2019_data_clinical_sample.txt', 
                        help= "File containing all cBiportal clinical samples metadata")
    
    return parser.parse_args(sys.argv[1:])
    
def update_cell_name_cosmic(cell_name, cosmic_cell_names):
    if cell_name in cosmic_cell_names:
        return cell_name
    elif cell_name.upper() in cosmic_cell_names:
        return cell_name.upper()
    elif cell_name.lower() in cosmic_cell_names:
        return cell_name.lower()
    elif cell_name.lower() in [x.lower() for x in cosmic_cell_names]:
        return cosmic_cell_names[list([x.lower() for x in cosmic_cell_names]).index(cell_name.lower())]
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
    elif cell_name == 'LnCap' or cell_name == 'LanCap' and 'LNCaP-Clone-FGC' in cosmic_cell_names:
        return 'LNCaP-Clone-FGC'
    elif cell_name == 'HTC116' and 'HCT-116' in cosmic_cell_names:
        return 'HTC116'
    else:
        return None
    
def get_sample_cellline_matches_cosmic(datasets, cosmic_cell_names, cosmic_cell_name_matches):
    
    samples_celllines = {}
    cell_lines_not_in_cosmic = {}
    for dataset in datasets:
        with open(dataset, 'r') as ds:
            header = ds.readline().strip().lower().split('\t')
            try:
                cell_line_index = header.index('characteristics[cell line]')
                id_index= header.index('source name')
            except ValueError:
                print("Error: 'characteristics[cell line]' column is not found in ", dataset)
                sys.exit(0)
            for l in ds.readlines():
                sl = l.strip().split('\t')
                sample_id = dataset.split('/')[-1].split('.')[0]#sl[id_index]
                cell_name = sl[cell_line_index]
                samples_celllines[sample_id] = {'original': cell_name}
                try:
                    cell_name = cosmic_cell_name_matches[sl[cell_line_index]]
                except KeyError:
                    cell_name = update_cell_name_cosmic(cell_name, cosmic_cell_names)
                if not cell_name:
                    try:
                        cell_lines_not_in_cosmic[sl[cell_line_index]].append(sl[id_index])
                    except KeyError:
                        cell_lines_not_in_cosmic[sl[cell_line_index]] = [sl[id_index]]
                    #print('not found in cosmic: ', cell_name, sample_id, sl)
                    continue
                
                samples_celllines[sample_id]['cosmic'] = cell_name
                cosmic_cell_name_matches[sl[cell_line_index]] = cell_name
    
    return samples_celllines, cosmic_cell_name_matches, cell_lines_not_in_cosmic

def get_sample_info_from_cbioportal(clinical_samples_file):
    
    output_file = clinical_samples_file.replace('.txt', '_info.tsv')
    sample_ids_info = {}
    with open(clinical_samples_file, 'r') as input_file:
        sample_id_index = 0
        cancer_type_index = 0
        for line in input_file:
            if 'STRING' in line or line.startswith('#'):
                continue
            sl = line.strip().split('\t')
            try:
                sample_id_index = sl.index('SAMPLE_ID')
                if 'CANCER_TYPE' in sl:
                    cancer_type_index = sl.index('CANCER_TYPE')
                else:
                    cancer_type_index = sample_id_index
            except ValueError:
                try:
                    sample_ids_info[sl[sample_id_index]] = sl[cancer_type_index]
                except IndexError:
                    #some lines have no cancer type column
                    sample_ids_info[sl[sample_id_index]] = ''
            
    with open(output_file, 'w') as output:
        for sample, info in sample_ids_info.items():
            output.write('{}\t{}\n'.format(sample, info))
            
    return sample_ids_info

def update_cell_name_cbio(cell_name, cbio_cell_names):
    
    if cell_name in cbio_cell_names:
        return cell_name
    elif cell_name.replace('-', '') in cbio_cell_names:
        return cell_name.replace('-', '')
    elif cell_name.replace('_', '-') in cbio_cell_names:
        return cell_name.replace('_', '-')
    elif cell_name.replace('-', '_') in cbio_cell_names:
        return cell_name.replace('-', '_')
    elif cell_name.upper().replace('-', '') in cbio_cell_names:
        return cell_name.upper().replace('-', '')
    elif 'NCI-'+cell_name in cbio_cell_names:
        return 'NCI-'+cell_name
    elif cell_name in [x.replace('-', '') for x in cbio_cell_names]:
        for x in cbio_cell_names:
            if cell_name == x.replace('-',''):
                return x.replace('-','')
    elif cell_name in [x.replace('_', '') for x in cbio_cell_names]:
        for x in cbio_cell_names:
            if cell_name == x.replace('_',''):
                return x.replace('_','')
    elif cell_name in ['NCI-'+x for x in cbio_cell_names]:
        for x in cbio_cell_names:
            if cell_name == 'NCI-'+x:
                return 'NCI-'+x
    if cell_name.upper()+'_CERVIX' in cbio_cell_names:
        return cell_name.upper()+'_CERVIX'
    elif cell_name.upper() in [x.split('_')[0] for x in cbio_cell_names]:
        return cbio_cell_names[list([x.split('_')[0] for x in cbio_cell_names]).index(cell_name.upper())]
    
    elif cell_name.upper().replace('-','') in [x.split('_')[0] for x in cbio_cell_names]:
        return cbio_cell_names[list([x.split('_')[0] for x in cbio_cell_names]).index(cell_name.upper().replace('-',''))]
    
    elif cell_name == 'OVCAR-3' and 'NIHOVCAR3_OVARY' in cbio_cell_names:
        return 'NIHOVCAR3_OVARY'
    
    elif cell_name == '786-0' and '786O_KIDNEY' in cbio_cell_names:
        return '786O_KIDNEY'
    elif cell_name == 'U251' and 'U251MG_CENTRAL_NERVOUS_SYSTEM' in cbio_cell_names:
        return 'U251MG_CENTRAL_NERVOUS_SYSTEM'
    elif cell_name == 'HTC116' and 'HCT116_LARGE_INTESTINE' in cbio_cell_names:
        return 'HCT116_LARGE_INTESTINE'
    
    else:
        return None
    
def get_sample_cellline_matches_cbio(sample_ids_cbioportal, samples_celllines_cosmic):
    
    not_found_in_cbio = {}
    for sample, info in samples_celllines_cosmic.items():
        original_cell_name = info['original']
        cell_name = None
        try:
            cosmic_cell_name = info['cosmic']
        except KeyError:
            cosmic_cell_name = None
            #continue
        if cosmic_cell_name:
            cell_name = update_cell_name_cbio(cosmic_cell_name, list(sample_ids_cbioportal.keys()))
        if not cell_name:
            cell_name = update_cell_name_cbio(original_cell_name, list(sample_ids_cbioportal.keys()))
        
        if cell_name:
            samples_celllines_cosmic[sample]['cbio'] = cell_name
        else:
            try:
                not_found_in_cbio[original_cell_name].append(sample)
            except KeyError:
                not_found_in_cbio[original_cell_name] = [sample]
            #print('not found in cbio:', cell_name, sample, info)
    return samples_celllines_cosmic, not_found_in_cbio
    
    

if __name__ == '__main__':
    args = parse_commandline_args()
    
    datasets = glob.glob(args.path_to_datasets + '/*.tsv')
    cosmic_cell_names = list(set([x.strip() for x in open(args.cosmic_cell_names, 'r').readlines()]))
    
    cell_names_mapped_to_cosmic = {'MCF7AdrR': 'MCF7',  'MCF7/AdrR': 'MCF7', 'U-251 MG': 'U251', 
                                'SKOV3': 'SK-OV-3', 'Caki1': 'CAKI-1', 'K562': 'K-562',
                                'RPMI8226': 'RPMI-8226', 'COLO205': 'COLO-205', 'HCT116': 'HCT-116',
                                 'A-549 cell': 'A549', 'HS578T': 'Hs-578-T', 'BT549': 'BT-549',
                                 'CCRFCEM': 'CCRF-CEM', 'HCT15': 'HCT-15', 
                                 'MDAMB231': 'MDA-MB-231', 'MDAMB453': 'MDA-MB-453'}
    
    samples_celllines_cosmic, cell_names_mapped_to_cosmic, cell_lines_not_in_cosmic = get_sample_cellline_matches_cosmic(
                            datasets, cosmic_cell_names, cell_names_mapped_to_cosmic)
    
    "get info from all cBioportal studies"
    sample_ids_cbioportal = get_sample_info_from_cbioportal(args.clinical_samples_file)
    
    samples_celllines_cosmic_cbio, not_found_in_cbio  = get_sample_cellline_matches_cbio(
                            sample_ids_cbioportal, samples_celllines_cosmic)
    
    with open('generate_db_commands.sh', 'w') as cmds:
        cmds.write('#set global variables' + '\n')
        cmds.write('cosmic_user_name=""' + '\n')
        cmds.write('cosmic_password=""' + '\n')
        cmds.write('cbio_study_id="ccle_broad_2019"' + '\n')
        cmds.write('output_dir="sample_specific_dbs"' + '\n\n')
        
        for sample_id in sorted(samples_celllines_cosmic_cbio.keys()):
            cosmic = ''
            try:
                cosmic_cell_name = samples_celllines_cosmic_cbio[sample_id]['cosmic']
                cosmic = '--cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name {}'.format(cosmic_cell_name)
            except KeyError:
                pass
            
            cbio = ''
            try:
                cbio_cell_name = samples_celllines_cosmic_cbio[sample_id]['cbio']
                cbio = '--cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values {}'.format(cbio_cell_name)
            except KeyError:
                pass
            
            if cosmic or cbio:
                cmd = '''nextflow main.nf -profile docker {cosmic} {cbio} --add_reference false --final_database_protein {sample_id}.fa --outdir $output_dir -resume
                '''.format(cosmic= cosmic, cbio = cbio, sample_id  = sample_id)
                cmds.write(cmd + '\n')
        
        cmds.write('#Final database: refprot + ncrna' + '\n')
        cmd = '''nextflow main.nf -profile docker --ensembl_name homo_sapiens --ncrna true --pseudogenes true --altorfs true --final_database_protein {out}.fa --outdir $output_dir -resume'''.format(
            out='refprot_altorfs_ncrna_pesudogenes.fa')
        cmds.write(cmd + '\n')
        
    print('No cell lines are found in COSMICCLP for these cell line datasets:\n{}'.format(
        '\n'.join([x+': '+','.join(set(y)) for x,y in cell_lines_not_in_cosmic.items()])))
    print('No cell lines are found in cBioportal for these cell line datasets:\n{}'.format(
        '\n'.join([x for x,y in not_found_in_cbio.items()])))
    print('Please run generate_db_commands.sh to generate the databases using pgdb')
    
    
    