import sys
args =  sys.argv
print(f"Total arguments passed: {len(args)}")
print(f"List of arguments passed: {args}")

print(f"System platform is: {sys.platform}")
print(f"Python version is: {sys.version}")

# run this file as follows from command line
# python sysTest.py arg1 arg2 arg3