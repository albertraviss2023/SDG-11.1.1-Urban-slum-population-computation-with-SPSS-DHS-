* Encoding: UTF-8.

**First sub-step:Identifying the respective components of deprivation: 
******************Improved water*******************************.
recode hv201 (11,12,13,14,21,31,41,51,61,62,71=1)(else=0) into water_access.
var lab water_access "Improved water".
val lab water_access 1 "Access to improved water source" 0 "Unimproved water source".

****************** improved sanitation**************************.
recode hv205 (11,12,13,15,21,22,41=1)(else=0) into sanitation.
var lab sanitation "Improved toilet".
val lab sanitation 1 "Improved sanitation" 0 "Unimproved sanitation".
*****************Sufficient living area**************************.
if (hv012=0) hv012=hv013.
if (hv216=0) room_mems=hv012.
if (hv216<> 0) room_mems= (hv012/hv216).
if (room_mems>=98) room_mems=98.
compute living_space=1.
if (room_mems gt 3) living_space=0.
var lab living_space "sufficient living area".
val lab living_space 1 "Sufficient space" 0 "Over crowded".
*****************durable floor******************************.
recode hv213 (11,21,22,30,31,32,33,34=0)(else=1) into dur_floor.
var lab dur_floor "durable house".
val lab dur_floor 1 "Improved housing" 0 "Unimproved housing".

* Second, compute all the possible combinations of the respective variables:

*************************Computing slum**************************************.

do if (hv025=1).
compute slumc4=0.
if (water_access=0 and sanitation=0 and living_space=0 and dur_floor=0) slumc4=1.
compute slumc3a=0.
if (water_access=0 and sanitation=0 and living_space=0 and dur_floor=1) slumc3a=1.
compute slumc3b=0.
if (water_access=0 and sanitation=0 and dur_floor=0 and living_space=1) slumc3b=1.
compute slumc3c=0.
if (water_access=0 and living_space=0 and dur_floor=0 and sanitation=1) slumc3c=1.
compute slumc3d=0.
if (sanitation=0 and living_space=0 and dur_floor=0 and water_access=1) slumc3d=1.
compute slumc3=0.
if (slumc3a=1 or slumc3b=1 or slumc3c=1 or slumc3d=1) slumc3=1.
compute slumc2a=0.
if (water_access=0 and sanitation=0 and living_space=1 and dur_floor=1) slumc2a=1.
compute slumc2b=0.
if (water_access=0 and living_space=0 and sanitation=1 and dur_floor=1) slumc2b=1.
compute slumc2c=0.
if (water_access=0 and dur_floor=0 and sanitation=1 and living_space=1) slumc2c=1.
compute slumc2d=0.
if (sanitation=0 and living_space=0 and water_access=1 and dur_floor=1) slumc2d=1.
compute slumc2e=0.
if (sanitation=0 and dur_floor=0 and water_access=1 and living_space=1) slumc2e=1.
compute slumc2f=0.
if (living_space=0 and dur_floor=0 and water_access=1 and sanitation=1) slumc2f=1.
compute slumc2=0.
if (slumc2a=1 or slumc2b=1 or slumc2c=1 or slumc2d=1 or slumc2e=1 or slumc2f=1) slumc2=1.
compute slumc1a=0.
if (water_access=1 and sanitation=0 and living_space=1 and dur_floor=1) slumc1a=1.
compute slumc1b=0.
if (water_access=0 and living_space=1 and sanitation=1 and dur_floor=1) slumc1b=1.
compute slumc1c=0.
if (water_access=1 and dur_floor=0 and sanitation=1 and living_space=1) slumc1c=1.
compute slumc1d=0.
if (sanitation=1 and living_space=0 and water_access=1 and dur_floor=1) slumc1d=1.
compute slumtot=0.
if (water_access=0 or sanitation=0 or living_space=0 or dur_floor=0) slumtot=1.
compute slumc=0.

if (slumtot=1) slumc=2.
if (slumtot=1 and water_access=1 and living_space=1 and dur_floor=1) slumc=1.
if (slumc2=1) slumc=3.
if (slumc3=1) slumc=4.
if (slumc4=1) slumc=5.
var lab slumc "Slum conditions".
val lab slumc 0 "Non-slum" 1 "Sanitation only" 2 "Other only one condition of slum" 
3 "Satisfy two conditions of slum" 4 "Satisfy three conditions of slum" 5 "Satisfy four conditions of slum".

end if.

*Third, compute the different combinations into different classes and then  
*label the classes for the slums stratification as follows:

compute class=0.
if (slumc1a=1) class=1.
if (slumc1b=1) class=2.
if (slumc1c=1) class=3.
if (slumc1d=1) class=4.
if (slumc2a=1) class=5.
if (slumc2b=1) class=6.
if (slumc2c=1) class=7.
if (slumc2d=1) class=8.
if (slumc2e=1) class=9.
if (slumc2f=1) class=10.
if (slumc3a=1) class=11.
if (slumc3b=1) class=12.
if (slumc3c=1) class=13.
if (slumc3d=1) class=14.
if (slumc4=1) class=15.

var lab class "Slum stratification".
val lab class 0 "Non-slum household" 1 "Lack sanitation only" 2 "Lack water only" 3 "Lack housing only" 4 "Lack Living area only" 5 "Water and sanitation only" 6 "Water and living area" 7 "water and housing" 
8 "sanitation and living area" 9 "sanitation and housing" 10 "living area and housing" 11 "Water and sanitation and living area" 12 "Water and sanitation and housing" 13 "Water and living area and housing" 
14 "Sanitation and living area and housing" 15 "Water and sanitation and living area and housing".

*Sub-step four:  the slum stratifications are then grouped together as follows:

recode class (0=0)(1 thru 4=1)(5 thru 10=2)(11 thru 14=3)(15=4) into classgrp.
var lab classgrp "Slum stratification grouped".
val lab classgrp 
 0 "Non-slum household"
 1 "One shelter deprivation"
 2 "Two shelter deprivations"
 3 "Three shelter deprivations"
 4 "Four shelter deprivations".

recode classgrp (0=0)(1,2,3,4=1) into slumthre.
var lab slumthre "Slum".
val lab slumthre 0 "Non-slum" 1 "Slum".

execute. 

* Step Five:  tabulate results using custom tables of count and percentages
    
CTABLES 
  /VLABELS VARIABLES=slumthre classgrp class DISPLAY=LABEL 
  /TABLE slumthre [COUNT F40.0, COLPCT.COUNT PCT40.1] + classgrp [COUNT F40.0, COLPCT.COUNT 
    PCT40.1] + class [COUNT F40.0, COLPCT.COUNT PCT40.1] 
  /CATEGORIES VARIABLES=slumthre classgrp class ORDER=A KEY=VALUE EMPTY=INCLUDE 
  /CRITERIA CILEVEL=95
