# Suggested Snowpark Enablement Flow
- Initial Snowpark Overview presentation/value proposal (whiteboard) including Snowpark [100-level_demos](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/tree/main/100_Demo)
- Meeting to setup environment for Snowpark Hands-on Lab
- Snowpark Hands-on Lab Workshop to walk through [200-level Demo](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/tree/main/200_HOL) and share [300-level overview (leave-behind example)](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/tree/main/300_Example)
- Follow-up 7days after HOL for Snowpark use case discussion & pitch Snowflake PS Data Science offering 

# Gitrepo Table of Contents:
- [100_Demo](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/tree/main/100_Demo)
- [200_HOL](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/tree/main/200_HOL)
- [300_Example](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/tree/main/300_Example)

# 200-level Snowpark_Hands-on_Lab
Detailed instructions for setting up and running the 200-level Snowpark hands-on lab.

[Snowpark Python Syntax Ref Doc](https://docs.snowflake.com/ko/developer-guide/snowpark/reference/python/index.html)

***What You'll Need***

You will need the following things before beginning:

- A Snowflake Account
- A Snowflake user created with ACCOUNTADMIN permissions. This user will be used to get things setup in Snowflake.
- Anaconda Terms & Conditions accepted. See Getting Started section in Third-Party Packages. https://docs.snowflake.com/en/developer-guide/udf/python/udf-python-packages.html#getting-started
- A Python Environment and Python IDE or Code Editor. We recommend [Visual Studio Code](https://code.visualstudio.com/)
- Access to Git to fork the Snowpark_Hands-on_Lab clone locally


# Pre-Workshop Instructions
We recommend scheduling a call to review all Snowflake account setup and Python environment setup several days in advance for the Snowpark Hands-on Lab to ensure all pre-work is completed. This will allow the participants to focus solely on running through the three (3) hands-on lab notebooks. We would also recommend using your Snowflake account for this Hands-on Lab to ensure Snowpark runs effectively within your account. 

**Snowflake Environment Setup**

- Log into your Snowflake account and switch to ACCOUNTADMIN role
- Click on Admin and then Billing & Terms on the left side panel
- On the Terms and Billing tab, read and accept terms to continue with the workshop
- Create a new worksheet and run the [Snowpark_Hands-on_Lab_SF_setup code](https://github.com/NICK-AKINCILAR/Snowpark_Hands-on_Lab/blob/main/200_HOL/200_HOL_Setup/200_HOL_Snowpark_Hands-on_Lab_SF_Setup.sql). This code is required to create all the required Snowflake Database Roles, Database, Schema, Warehouse and to grant required permissions. Step through and run each line to ensure all code runs without error.
- Ensure each Snowpark Hands-on Lab participant has been granted access to the snowpark_workshop_role role in line 12
  - GRANT ROLE snowpark_workshop_role to USER <user_name>;

![image](https://user-images.githubusercontent.com/120119246/226479301-26ed74a1-6d12-4e82-afef-081622a0fc50.png)


**Python Environment Setup**

- Create and Activate Conda Environment (OR, use any other Python environment with Python 3.8). 
conda create --name snowpark -c https://repo.anaconda.com/pkgs/snowflake python=3.8
conda activate snowpark
- Install Snowpark for Python, Streamlit, scikit-learn, xgboost and other libraries in Conda environment
- conda install -c https://repo.anaconda.com/pkgs/snowflake snowflake-snowpark-python pandas notebook scikit-learn cachetools
- Update connection.json with your Snowflake account details and credentials

**TIP:** We suggest installing [Visual Studio Code](https://code.visualstudio.com/Suggest) on your computer. Check out the Visual Studio Code homepage for a link to the download page. Ensure the Python extension is installed. Search for and install the "Python" extension (from Microsoft) in the Extensions pane in VS Code. Also ensure Snowflake extension installed. Search for and install the "Snowflake" extension (from Snowflake) in the Extensions pane in VS Code. We also recommend installing [GitHub Desktop](https://desktop.github.com/) on your computer. 

Log into Visual Studio Code as follows:
 - ROLE: snowpark_workshop_role
 - DATABASE: snowpark_workshop
 - SCHEMA: campaign_demo
 - WAREHOUSE: snowparkws_wh
 
 ![image](https://user-images.githubusercontent.com/120119246/226482767-21dccaba-158e-4523-add8-42a9092a2eab.png)




# 200-level Snowpark Hands-On Lab/Workshop Instructions

**Step 1 - Walk through Snowpark Overview Deck**
[Snowpark Hands-on Lab Overview PPT](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/blob/main/Snowpark%20Hands-on%20Lab%20PPT.pptx)
![image](https://user-images.githubusercontent.com/120119246/227280137-0d0066c7-ed13-49e7-85e2-ba7d7225f556.png)

**Step 2 - Ensure participants can access hands-on lab instructions, Snowflake, and Visual Studio Code (or other Python IDE)** 
![image](https://user-images.githubusercontent.com/120119246/227599820-7d9b215a-d20e-438b-b006-162e1230d768.png)



**Step 3 - Walk through an run 200-level Snowpark_For_Python notebook setup**
- Navigate to the [GitHub repo](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab.git) for this lab
- Click on the Green button to get the files in GitHub Desktop
- Select the Open in Visual Studio Code button

![image](https://user-images.githubusercontent.com/120119246/227010729-5e46c1d4-5ccd-47d1-936b-fa36e6e868ac.png)

![image](https://user-images.githubusercontent.com/120119246/227010286-4db464d3-03f7-460c-942a-1b8d3498a813.png)

- Go to the connection.json file and update as follows:
  - account: _update with your Snowflake account_
  - user: _update with your user_
  - password: _update with your password_
  - role: snowpark_workshop_role
  - warehouse: snowparkws_wh
  - database: snowpark_workshop
  - schema: campaign_demo

![image](https://user-images.githubusercontent.com/120119246/227032958-a69b85a5-8546-4446-8103-02763436c7b8.png)

- Ensure you save the updated connection.json file

![image](https://user-images.githubusercontent.com/120119246/227278282-5837fe1b-e239-4f78-bbbc-0bec1c426587.png)


**TIP:** Trying to determine your Snowflake account name? Log into Snowflake. Click your account on the bottom left corner. Select the account to expose the details. Click to _copy account identifier_. Replace the "." with "-". For example, NXAAXGQ.LRB86899 should be NXAAXGQ-LRB86899.

![image](https://user-images.githubusercontent.com/120119246/227042133-77525131-d482-46e4-b666-4ab82dfe9232.png)
- Ensure your environment is configured to leverage Snowpark (Python 3.8.13).
  - Open a New Terminal
  - Type conda activate snowpark and ensure snowpark is activated
  - ![image](https://user-images.githubusercontent.com/120119246/227347398-7f12facb-3836-4e4d-910c-3dc1537cad26.png)

  - If snowpark and Snowpark_Hands-on_Lab % is not showing in your terminal, go to View, select Command Palette, type Python: Select Interpreter, select Snowpark_Hands-on_Lab
  - ![image](https://user-images.githubusercontent.com/120119246/227348260-bce3905f-aa6a-4aa4-ae1e-df0f12008821.png)

- Go to the [Snowpark_For_Python.ipynb](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/blob/main/Snowpark_For_Python.ipynb) file

- Ensure you have selected snowpark (Python 3.8.13) as your Python kernel
![image](https://user-images.githubusercontent.com/120119246/227043146-9a9bde34-3afc-4285-9453-a18fe7556e55.png)


**Step 4 - Hands-on Lab Time!**
- Read through the Objective and Instructions for the [Snowpark_For_Python.ipynb](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/blob/main/Snowpark_For_Python.ipynb) notebook

- Execute the code to import required Snowpark, json, pandas and logging libraries. Ensure you get a green check.

![image](https://user-images.githubusercontent.com/120119246/227043084-c92a36ac-7cd7-4fcf-9163-d8c86f458fbe.png)


- Execute the code to user your connection.json file 

![image](https://user-images.githubusercontent.com/120119246/227278435-bdfbf9cb-b5fe-4fb4-8375-c185e3485dc6.png)


- Walk through the notebook and execute each cell, ensuring you have no errors.
- When you encounter **"YOUR TURN"**, update the cell as needed and execute.

![image](https://user-images.githubusercontent.com/120119246/227287276-77d3c516-f082-4321-8a31-7bd5645abfd5.png)

 
**TIP:** Check the [Snowpark_Hands-on-Lab_Solution](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/blob/main/Snowpark_For_Python_Solution.ipynb) if you need assistance.

- As you execute code in Snowpark, you can easily track how Snowflake is processing Snowpark DataFrame functions from both the Python IDE and Snowflake's Query History.
 
![image](https://user-images.githubusercontent.com/120119246/227299864-31ee5445-5448-47a4-8286-ee467209b490.png)
![image](https://user-images.githubusercontent.com/120119246/227299967-f46ee93b-4399-4195-91d3-9142ef7a7232.png)

- Once completed, this asset is designed to be educational and help demonstrate the architecture of Snowpark. Step 5 is a notebook designed to be a framework for training and deploying a model.

**Step 5 - Streamlit App**
Streamlit in Snowflake (SiS) is not yet available to most Snowflake accounts. As a result, we recommend running the Streamlit_Local_App.py version for this Hands-on Lab. 
- Go to the Streamlit_Local_App.py file to review the code. Not necessary to run the app.
![image](https://user-images.githubusercontent.com/120119246/227976404-d81ba8d1-2ed6-4465-b568-ee2905740b86.png)

- Open a new Terminal within your IDE (VS Code), or from the desktop and cd into the folder where Streamlit_Local_App.py is

- Type "streamlit run Streamlit_Local_App.py" and press enter.
- If this is your first time running Streamlit it will ask you for an email. Feel free to leave this blank and just press enter
- If you get an error message when running the above line of code, try typing "conda deactivate" then type the "streamlit run Streamlit_Local_App.py" command again.
![image](https://user-images.githubusercontent.com/120119246/227977013-cb5c9021-aef3-4927-8b70-b766daba48e2.png)

- A new browser window should open (as shown below). At this point you can interact with the Streamlit application.
![image](https://user-images.githubusercontent.com/120119246/227977078-e44df135-f082-4acc-aa04-4f01f5684ac9.png)

- Important to note that within this application, the user is giving inputs and the udf/model stored within a stage are being called to give predictions based on data presented by the app.
- When you are finished, make sure to press ctrl+c or cmd+c to end the application before closing the browser tab. Otherwise this will lock up the terminal and it will need to be closed and re-opened.

**Step 6 - 300-level Snowpark Leave-behind Modeling Scale Example**
- Go to the [Snowpark_Model_At_Scale_XGBoost](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/blob/main/300_Example/300_Example_Snowpark_Model_At_Scale_xgboost_tpcds_distribute.ipynb) file
This notebook can be used as an example to follow when wanting to train and deploy your first end to end model with Snowpark. This features a large dataset, available in your Snowflake account, and will be predicting the lifetime value of a customer using XGboost regression.
- Please pay attention to when/how feature sets and predictions are being written to tables back on Snowflake. These steps may look different depending on your business needs (archiving training feature sets, where the predictions should be stored, etc.). The code here is just an example of how these would be written to tables within snowflake. 

# 200-level Post-Snowpark Hands-on Lab/Workshop Instructions

- When you have completed the Snowpark Hands-on Lab, run the [Snowflake_Hands-On_Lab_SF_Cleanup script](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/blob/main/200_HOL/200_HOL_Setup/200_HOL_Snowpark_Hands-on_Lab_SF_Cleanup):
  - Log into your Snowflake account and switch to ACCOUNTADMIN role
  - Create a new worksheet and run the [Snowpark_Hands-on_Lab_SF_Cleanup code](https://github.com/sfc-gh-DShaw98/Snowpark_Hands-on_Lab/blob/main/200_HOL/200_HOL_Setup/200_HOL_Snowpark_Hands-on_Lab_SF_Cleanup). This code is required to drop the Snowflake Database, Role, and Warehouse used in the hands-on lab.
  
