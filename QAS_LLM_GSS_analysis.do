
** Author: Shengfu
** Lastest Updated: Nov 17, 2024 

cd "/Users/Shengfu/Desktop/School/QAS LLM Coding/QAS-LLM-Coding" // SET FOLDER PATH HERE!
ls

clear all
import excel "Copy of GSS QAS LLM RCoding 2024_results.xlsx"
drop AR


** 1. Set variable names
foreach var of varlist * {
    local newname = strtoname(trim(`var'[1])) 
    rename `var' `newname'
}
drop in 1

destring _*, replace
destring Sum_*, replace
destring Prompt_Version, replace

rename _* QAS_*_prompt
rename Sum_* QAS_Sum_*_prompt
rename Explanations QAS_explanations_prompt

drop Testing_Time LLM_Coding_Results

** 2. Reshape
reshape wide QAS_*_prompt, i(Variable_Name) j(Prompt_Version)
order Variable_Name Full_Question_Wording LLM_Model

save "QAS_LLM_GSS.dta", replace


** 3. Analysisi of level of agreement between different versions of prompts
* For 1a.
tab QAS_1a_prompt1 QAS_1a_prompt2, miss
tab QAS_1a_prompt1 QAS_1a_prompt3, miss
tab QAS_1a_prompt2 QAS_1a_prompt3, miss

kap QAS_1a_prompt1 QAS_1a_prompt2
kap QAS_1a_prompt1 QAS_1a_prompt3
kap QAS_1a_prompt2 QAS_1a_prompt3
kap QAS_1a_prompt1 QAS_1a_prompt2 QAS_1a_prompt3

* Loop over all issues
local vars "1a 1b 1c 2a 2b 3a 3b 3c 3d 4a 4b 4c 5a 5b 5c 5d 6a 6b 6c 7a 7b 7c 7d 7e 7f 7g 8a"
foreach v of local vars {
	dis "Two-way table: `v'"
    tab QAS_`v'_prompt1 QAS_`v'_prompt2, miss
    tab QAS_`v'_prompt1 QAS_`v'_prompt3, miss
    tab QAS_`v'_prompt2 QAS_`v'_prompt3, miss
	
	dis "Kappa: `v'"
	cap noisily: kap QAS_`v'_prompt1 QAS_`v'_prompt2
	cap noisily: kap QAS_`v'_prompt1 QAS_`v'_prompt3
	cap noisily: kap QAS_`v'_prompt2 QAS_`v'_prompt3
	cap noisily: kap QAS_`v'_prompt1 QAS_`v'_prompt2 QAS_`v'_prompt3
}

