import os
# finds the parent directory path, all the folders in it and the files in it
# the following gets the parent folder for the current dir and then runs the walk on it
for parent_fol, dirs, files in os.walk(os.path.dirname(os.getcwd())):
    print(parent_fol)
    print(dirs)
    print(files)