import os

def rename_files():
    # 1 - get file names from folder
    file_list = os.listdir(r"C:\Code\Udacity\rename_files\prank")
    print(file_list)
    saved_path = os.getcwd()
    print(saved_path)
    os.chdir(r"C:\Code\Udacity\rename_files\prank")

    # 2 - for each file, rename file
    for file_name in file_list:
        print("Old File Name: " + file_name)
        print("New File Name: " + file_name.translate(None, "0123456789"))
        os.rename(file_name, file_name.translate(None, "0123456789"))

    os.chdir(saved_path)


    
rename_files()
