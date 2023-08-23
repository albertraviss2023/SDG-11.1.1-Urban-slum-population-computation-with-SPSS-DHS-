The goal of this project is to compute urban population living in slums using DHS Data. 
This project is aimed at providing SPSS code for all DHS Program computation of slum indictors as defined by SDG 11.1. That is, slum dwelling is measured using lack of access to improved water, improved sanitation, sufficient living area, improved housing and lack of security of tenure for slums.

## General instructions:
This Code Project provides the code that can be used to produce these indicators as well as the standard tables to produce a report on World urban slum population. The code is organized into one single file in the parent folder and all guidelines from the Guide to DHS Statistics have been followed.   

## Main files:
The parent folder contains a Main .sps script File from which the user can run all the code at once (.sps) to compute slum indicators. 
and produce a custom tables for the final report. The user needs to change the paths in the data File. The parent folder also contains 2 output files (.spv and word) and a custom table (word) produced when the code is run properly. 
These will show the code execution output and a table that can be used for reporting. 

## Working with older surveys:
Additionally, because the indicators that are created using the Code Share Project are based on the Guide to DHS Statistics, they reflect the standard variables that are available in a recent DHS survey dataset. If the provided code is used to create indicators from older surveys, it is possible the variable names have changed over time or are not available in the older survey. The user may need to check the dataset in use for the availability of the variables needed for coding and may have to adjust for missing variables or rename variables accordingly. Some of the code files will generate the variables with missing values for old surveys if the survey does not have that variable. 
In addition, older surveys (mainly before 2000) do not have a wealth index in the dataset and the files would need to be merged with a WI file to include the wealth index. Also, more categories have been added for variables on access to improved water, sanitation etc. It is advisable to check the categories available in the older datasets in order to adjust the code.
accordingly. 

# Durable housing:
Durable housing is captured only through durable floor as a proxy because of lack of data on other dimensions of durability (wall and roof).

## Creating tables 
Tabulation has been done using CUSTOM TABLES. There are two commands that can be used for producing tables for the indicators in SPSS: ctables and crosstab. The ctables command (Custom Tables) is easier to use and more powerful, however the Custom Tables module is a separate module that must be purchased in addition to the SPSS Base module. If the user does not have this module installed, then they can use the crosstab command. 

## Slum population computation
To determine the proportion of urban population living in slums/informal settlements, computation will be done using the total number of people living Slum households divided by 
the total number of urban/city population and then multiplying by 100.
