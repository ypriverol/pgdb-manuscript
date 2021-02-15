cosmic_user_name=""
cosmic_password=""

nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HeLa --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id ccle_broad_2019 --cbioportal_accepted_values HELA_CERVIX --add_reference false --final_database_protein HeLa.fa --outdir HeLa -resume

