import os

def rename_files():
    file_list = os.listdir(r"C:\Code\Udacity\secret_message\prank")
    saved_path = os.getcwd()
    os.chdir(r"C:\Code\Udacity\secret_message\prank")

    for file_name in file_list:
        print("Old File Name: " + file_name)
        print("New File Name: " + file_name.translate(None, "0123456789"))
        os.rename(file_name, file_name.translate(None, "0123456789"))

    os.chdir(saved_path)

rename_files()
