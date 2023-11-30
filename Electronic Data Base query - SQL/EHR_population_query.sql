#This IS our main 

SELECT ICD10_COD 
from ths_diagnosis td ;

#UPDATE testths_diagnosis
# connected to database

#Checking main diagnosis in tab_hospitalisation (no results)

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD_TXT_ENG like '%dE11iab%' );

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD_TXT_ENG like '%thrombosis%' );

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD_TXT_ENG like '%embolism%' );

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD_TXT_ENG like '%thromboembolism%' );

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD10_COD like 'I26%' );

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD10_COD like 'I74%' );

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD10_COD like 'T80%' );

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD10_COD like 'I82%' );

select unique HOSP_MAIN_DGN
from tab_hospitalisation th  
where HOSP_MAIN_DGN in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD10_COD like 'I80%' );




--------



#Checking associated diagnoses in tab_mso_ass_dgn

#n = 421 hospitalisations of VTE
select DGN_ASS, HOSP_MAIN_DGN 
from tab_mso_ass_dgn mad inner join tab_hospitalisation th
where th.RSA_NUM = mad.RSA_NUM
and DGN_ASS in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD10_COD like 'I80%' );

#of those 421 hospitalisations, n = 22 distinct patients
select unique th.PAT_ID
from tab_mso_ass_dgn mad inner join tab_hospitalisation th
where th.RSA_NUM = mad.RSA_NUM
and DGN_ASS in (
select ICD10_COD
FROM ths_diagnosis td 
where ICD10_COD like 'I80%' );

#need to find patients who have procedures related to DVT in tab_mso_procedures (unfinished query, haven't found all CCAM codes for DVT) maybe we should also find patients who have procedures related to PE? 
select unique RSA_NUM
from tab_mso_procedures tmp
where PROC_COD in (
select PROC_COD
FROM ths_procedures td 
where PROC_COD like 'EJQM00%' );