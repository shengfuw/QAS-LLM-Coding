# QAS Coding Using LLM (API Version)

## 📄 Overview
Evaluated the quality of survey questions based on the Large Language Model (OpenAI's API or ChatGPT) and Question Appraisal System (QAS-99).

## 📊  Workflow for using OpenAI API
- **Step 1:** Open the Python script (`QAS Coding using API.ipynb`).
- **Step 2:** Set parameters (`input_file_path`, `sheet_name`, `QAS_pdf_file_path`, `model`, `prompt_version`) in the first code chunk.
- **Step 4:** Get and set the [OpenAI API key](https://platform.openai.com/api-keys) (Tips: Need to add credit balance before using API)
- **Step 5:** Run all code chunks. (Tip: If you don't want to process all questions, you can adjust the range in the bracket in the following line. For example, to only code questions 10 to 20, use: `df_output = df_input.iloc[10:20].copy()`) 
- **Step 6**: Check [API usage](https://platform.openai.com/usage)! 

## 📊 Workflow for using ChatGPT
- **Step 1:** Prepare the [Excel file](https://docs.google.com/spreadsheets/d/1OSZOQGFWHNlICUs_LhxWf4UEv49-MMF8/edit?usp=sharing&ouid=100815142430926744841&rtpof=true&sd=true).
- **Step 2:** Start a new conversation and give the initial [prompt](https://www.notion.so/shengfu/4c83085b36cc45118641e546c7a93283?v=d396e315822344daa46c9d6ff7b4c2ed&pvs=4) to LLM (e.g., [ChatGPT](https://chatgpt.com), [Claude](https://claude.ai/chats), [Gemini](https://gemini.google.com/app))
- **Step 3:** Input survey questions *one by one.*
- **Step 4:** Get and paste the outputs of LLM to the column `LLM output` in the Excel file.
- Tip: Restart from **Step 2** after every 20 questions to maintain consistent performance!