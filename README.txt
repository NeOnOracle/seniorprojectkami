This is an all encompassing readme file to explain the needs for this project.
Step 1: Downloading all of the tools for the job.
-Download Python 3.11.6 off the Windows Store or online.
-Download Visual Studio Code
-Download our project off our Github (should've been done already to view this README)
-Download or install pip (may already be installed if you download Python online)
	-download pip online (may have to run get-pip.py)
-Download XAMPP
Step 2: Open XAMPP and start the modules "Apache" and "MySQL"
	-then click on the "Admin" button beside MySQL, then click import.
	-add the "aicook" SQL file 
Step 3: Open Visual Studio Code and open our project folder
Step 4: Downloading dependencies.
-Run the following installation commands in the terminal in Visual Studio Code (ctrl+` is the default hotkey)
	-pip install openai
	-pip install pillow
	-pip install pylance
	-pip install mysql
	-pip install mysql.connector
-The following may also be necessary
	-pip install requests
	-pip install connections
Step 5: run the command: python manage.py runserver
Now you have a localhosted HTML
To view API calls along with the database calls, run: python main.py
(or you can rightclick it in the repository on the right and click "run file in terminal")
