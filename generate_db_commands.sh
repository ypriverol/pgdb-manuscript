#set global variables
cosmic_user_name=""
cosmic_password=""
cbio_study_id="ccle_broad_2019"
output_dir="sample_specific_dbs"

nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD002395-Sample-1.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD002395-Sample-14.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD002395-Sample-26.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD005698-Sample-1.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD005698-Sample-2.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD005698-Sample-3.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD005698-Sample-4.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD005698-Sample-5.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name COLO-205 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values COLO205_LARGE_INTESTINE --add_reference false --final_database_protein PXD005940-Sample-1.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name RXF393 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values RXF393_KIDNEY --add_reference false --final_database_protein PXD005940-Sample-2.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name PC-3 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values PC3_PROSTATE --add_reference false --final_database_protein PXD005940-Sample-3.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H460 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH460_LUNG --add_reference false --final_database_protein PXD005940-Sample-4.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name U251 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values U251MG_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005940-Sample-5.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-OV-3 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKOV3_OVARY --add_reference false --final_database_protein PXD005940-Sample-6.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name M14 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values M14_SKIN --add_reference false --final_database_protein PXD005940-Sample-7.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MCF7 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MCF7_BREAST --add_reference false --final_database_protein PXD005940-Sample-8.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name CCRF-CEM --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values CCRFCEM_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005940-Sample-9.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name K-562 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values K562_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005942-Sample-1.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name Hs-578-T --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HS578T_BREAST --add_reference false --final_database_protein PXD005942-Sample-10.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name BT-549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values BT549_BREAST --add_reference false --final_database_protein PXD005942-Sample-11.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-MEL-28 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKMEL28_SKIN --add_reference false --final_database_protein PXD005942-Sample-12.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MDA-MB-231 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MDAMB231_BREAST --add_reference false --final_database_protein PXD005942-Sample-13.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SW620 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SW620_LARGE_INTESTINE --add_reference false --final_database_protein PXD005942-Sample-14.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name UACC-257 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values UACC257_SKIN --add_reference false --final_database_protein PXD005942-Sample-15.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name LOXIMVI --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values LOXIMVI_SKIN --add_reference false --final_database_protein PXD005942-Sample-16.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker  --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values UO31_KIDNEY --add_reference false --final_database_protein PXD005942-Sample-17.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name OVCAR-5 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values OVCAR5_OVARY --add_reference false --final_database_protein PXD005942-Sample-18.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name 786-0 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values 786O_KIDNEY --add_reference false --final_database_protein PXD005942-Sample-19.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name EKVX --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values EKVX_LUNG --add_reference false --final_database_protein PXD005942-Sample-2.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name UACC-62 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values UACC62_SKIN --add_reference false --final_database_protein PXD005942-Sample-20.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H460 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH460_LUNG --add_reference false --final_database_protein PXD005942-Sample-21.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SN12C --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SN12C_KIDNEY --add_reference false --final_database_protein PXD005942-Sample-22.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name IGROV-1 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values IGROV1_OVARY --add_reference false --final_database_protein PXD005942-Sample-23.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H23 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH23_LUNG --add_reference false --final_database_protein PXD005942-Sample-24.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name PC-3 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values PC3_PROSTATE --add_reference false --final_database_protein PXD005942-Sample-25.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SF295 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SF295_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005942-Sample-26.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SR  --add_reference false --final_database_protein PXD005942-Sample-27.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-MEL-2 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKMEL2_SKIN --add_reference false --final_database_protein PXD005942-Sample-28.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name OVCAR-3 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NIHOVCAR3_OVARY --add_reference false --final_database_protein PXD005942-Sample-29.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HOP-62 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HOP62_LUNG --add_reference false --final_database_protein PXD005942-Sample-3.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HCT-116 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HCT116_LARGE_INTESTINE --add_reference false --final_database_protein PXD005942-Sample-30.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name CCRF-CEM --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values CCRFCEM_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005942-Sample-31.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-OV-3 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKOV3_OVARY --add_reference false --final_database_protein PXD005942-Sample-32.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MOLT-4 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MOLT4_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005942-Sample-33.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name DU-145 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values DU145_PROSTATE --add_reference false --final_database_protein PXD005942-Sample-34.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name RPMI-8226 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values RPMI8226_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005942-Sample-35.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HT-29 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HT29_LARGE_INTESTINE --add_reference false --final_database_protein PXD005942-Sample-36.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name TK10 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values TK10_KIDNEY --add_reference false --final_database_protein PXD005942-Sample-37.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H322M --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH322M_LUNG --add_reference false --final_database_protein PXD005942-Sample-38.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H226 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH226_LUNG --add_reference false --final_database_protein PXD005942-Sample-39.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HOP-92 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HOP92_LUNG --add_reference false --final_database_protein PXD005942-Sample-4.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name RXF393 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values RXF393_KIDNEY --add_reference false --final_database_protein PXD005942-Sample-40.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker  --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MALME3M_SKIN --add_reference false --final_database_protein PXD005942-Sample-41.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name KM12 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values KM12_LARGE_INTESTINE --add_reference false --final_database_protein PXD005942-Sample-42.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker  --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SNB19_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005942-Sample-43.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name COLO-205 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values COLO205_LARGE_INTESTINE --add_reference false --final_database_protein PXD005942-Sample-44.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name CAKI-1 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values CAKI1_KIDNEY --add_reference false --final_database_protein PXD005942-Sample-45.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MCF7 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MCF7_BREAST --add_reference false --final_database_protein PXD005942-Sample-46.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name ACHN --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values ACHN_KIDNEY --add_reference false --final_database_protein PXD005942-Sample-47.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HCT-15 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HCT15_LARGE_INTESTINE --add_reference false --final_database_protein PXD005942-Sample-48.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name U251 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values U251MG_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005942-Sample-49.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SF268 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SF268_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005942-Sample-5.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HCC2998 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HCC2998_LARGE_INTESTINE --add_reference false --final_database_protein PXD005942-Sample-50.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SNB75 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SNB75_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005942-Sample-51.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name OVCAR-8 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values OVCAR8_OVARY --add_reference false --final_database_protein PXD005942-Sample-52.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H522 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH522_LUNG --add_reference false --final_database_protein PXD005942-Sample-53.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MCF7 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MCF7_BREAST --add_reference false --final_database_protein PXD005942-Sample-54.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A498 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A498_KIDNEY --add_reference false --final_database_protein PXD005942-Sample-55.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name OVCAR-4 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values OVCAR4_OVARY --add_reference false --final_database_protein PXD005942-Sample-56.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SF539 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SF539_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005942-Sample-57.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name M14 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values M14_SKIN --add_reference false --final_database_protein PXD005942-Sample-58.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-MEL-5 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKMEL5_SKIN --add_reference false --final_database_protein PXD005942-Sample-59.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HL-60 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HL60_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005942-Sample-6.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name T47D --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values T47D_BREAST --add_reference false --final_database_protein PXD005942-Sample-7.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MDA-MB-453 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MDAMB453_BREAST --add_reference false --final_database_protein PXD005942-Sample-8.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD005942-Sample-9.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H522 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH522_LUNG --add_reference false --final_database_protein PXD005946-Sample-1.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name T47D --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values T47D_BREAST --add_reference false --final_database_protein PXD005946-Sample-10.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SR  --add_reference false --final_database_protein PXD005946-Sample-12.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MDA-MB-231 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MDAMB231_BREAST --add_reference false --final_database_protein PXD005946-Sample-13.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name LOXIMVI --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values LOXIMVI_SKIN --add_reference false --final_database_protein PXD005946-Sample-14.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SNB75 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SNB75_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005946-Sample-15.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name M14 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values M14_SKIN --add_reference false --final_database_protein PXD005946-Sample-16.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MCF7 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MCF7_BREAST --add_reference false --final_database_protein PXD005946-Sample-17.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HT-29 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HT29_LARGE_INTESTINE --add_reference false --final_database_protein PXD005946-Sample-18.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H226 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH226_LUNG --add_reference false --final_database_protein PXD005946-Sample-19.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HCC2998 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HCC2998_LARGE_INTESTINE --add_reference false --final_database_protein PXD005946-Sample-2.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name RXF393 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values RXF393_KIDNEY --add_reference false --final_database_protein PXD005946-Sample-20.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name U251 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values U251MG_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005946-Sample-21.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-MEL-5 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKMEL5_SKIN --add_reference false --final_database_protein PXD005946-Sample-22.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-OV-3 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKOV3_OVARY --add_reference false --final_database_protein PXD005946-Sample-23.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name DU-145 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values DU145_PROSTATE --add_reference false --final_database_protein PXD005946-Sample-24.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name OVCAR-3 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NIHOVCAR3_OVARY --add_reference false --final_database_protein PXD005946-Sample-25.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name IGROV-1 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values IGROV1_OVARY --add_reference false --final_database_protein PXD005946-Sample-26.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-MEL-2 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKMEL2_SKIN --add_reference false --final_database_protein PXD005946-Sample-27.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SR  --add_reference false --final_database_protein PXD005946-Sample-28.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name OVCAR-4 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values OVCAR4_OVARY --add_reference false --final_database_protein PXD005946-Sample-29.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SN12C --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SN12C_KIDNEY --add_reference false --final_database_protein PXD005946-Sample-3.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name UACC-62 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values UACC62_SKIN --add_reference false --final_database_protein PXD005946-Sample-30.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name COLO-205 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values COLO205_LARGE_INTESTINE --add_reference false --final_database_protein PXD005946-Sample-31.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name UACC-257 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values UACC257_SKIN --add_reference false --final_database_protein PXD005946-Sample-32.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker  --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SNB19_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005946-Sample-33.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name 786-0 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values 786O_KIDNEY --add_reference false --final_database_protein PXD005946-Sample-34.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HL-60 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HL60_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005946-Sample-35.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SW620 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SW620_LARGE_INTESTINE --add_reference false --final_database_protein PXD005946-Sample-36.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD005946-Sample-37.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A498 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A498_KIDNEY --add_reference false --final_database_protein PXD005946-Sample-38.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name CCRF-CEM --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values CCRFCEM_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005946-Sample-39.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name Hs-578-T --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HS578T_BREAST --add_reference false --final_database_protein PXD005946-Sample-4.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H23 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH23_LUNG --add_reference false --final_database_protein PXD005946-Sample-40.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker  --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MALME3M_SKIN --add_reference false --final_database_protein PXD005946-Sample-41.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker  --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values UO31_KIDNEY --add_reference false --final_database_protein PXD005946-Sample-42.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name TK10 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values TK10_KIDNEY --add_reference false --final_database_protein PXD005946-Sample-43.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HOP-92 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HOP92_LUNG --add_reference false --final_database_protein PXD005946-Sample-44.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HCT-116 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HCT116_LARGE_INTESTINE --add_reference false --final_database_protein PXD005946-Sample-45.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H322M --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH322M_LUNG --add_reference false --final_database_protein PXD005946-Sample-46.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name ACHN --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values ACHN_KIDNEY --add_reference false --final_database_protein PXD005946-Sample-47.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HCT-15 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HCT15_LARGE_INTESTINE --add_reference false --final_database_protein PXD005946-Sample-48.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name CAKI-1 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values CAKI1_KIDNEY --add_reference false --final_database_protein PXD005946-Sample-49.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name K-562 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values K562_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005946-Sample-5.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SF539 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SF539_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005946-Sample-50.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name RPMI-8226 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values RPMI8226_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005946-Sample-51.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SF295 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SF295_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005946-Sample-52.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MOLT-4 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MOLT4_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE --add_reference false --final_database_protein PXD005946-Sample-53.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name MCF7 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values MCF7_BREAST --add_reference false --final_database_protein PXD005946-Sample-54.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name OVCAR-5 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values OVCAR5_OVARY --add_reference false --final_database_protein PXD005946-Sample-55.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HOP-92 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HOP92_LUNG --add_reference false --final_database_protein PXD005946-Sample-56.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SF268 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SF268_CENTRAL_NERVOUS_SYSTEM --add_reference false --final_database_protein PXD005946-Sample-57.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H460 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH460_LUNG --add_reference false --final_database_protein PXD005946-Sample-58.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name OVCAR-8 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values OVCAR8_OVARY --add_reference false --final_database_protein PXD005946-Sample-59.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name BT-549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values BT549_BREAST --add_reference false --final_database_protein PXD005946-Sample-6.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name PC-3 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values PC3_PROSTATE --add_reference false --final_database_protein PXD005946-Sample-60.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name KM12 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values KM12_LARGE_INTESTINE --add_reference false --final_database_protein PXD005946-Sample-61.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name EKVX --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values EKVX_LUNG --add_reference false --final_database_protein PXD005946-Sample-7.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name HOP-62 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values HOP62_LUNG --add_reference false --final_database_protein PXD005946-Sample-8.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name SK-MEL-28 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values SKMEL28_SKIN --add_reference false --final_database_protein PXD005946-Sample-9.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name A549 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values A549_LUNG --add_reference false --final_database_protein PXD015270-Sample-1.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H1975 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH1975_LUNG --add_reference false --final_database_protein PXD015270-Sample-2.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H446 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH446_LUNG --add_reference false --final_database_protein PXD015270-Sample-3.fa --outdir $output_dir -resume
                
nextflow main.nf -profile docker --cosmic_celllines true --cosmic_user_name $cosmic_user_name --cosmic_password $cosmic_password --cosmic_cellline_name NCI-H69 --cbioportal true --cbioportal_filter_column SAMPLE_ID --cbioportal_study_id $cbio_study_id --cbioportal_accepted_values NCIH69_LUNG --add_reference false --final_database_protein PXD015270-Sample-4.fa --outdir $output_dir -resume
                
#Final database: refprot + ncrna
nextflow main.nf -profile docker --ensembl_name homo_sapiens --ncrna true --pseudogenes true --altorfs true --final_database_protein refprot_altorfs_ncrna_pesudogenes.fa.fa --outdir $output_dir -resume
