import subprocess

# whatever you give in command line give it here
# Option 1
subprocess.run(['python', 'sysTest.py', 'arg1', 'arg2', 'arg3'])
# Option 2
subprocess.run('python sysTest.py arg1 arg2 arg3')

# not working
result = subprocess.run('echo $PATH', shell=True, capture_output=True, text=True)
print(result.stdout)
# alternate which prints all the environment vairables
result = subprocess.run(['env'], capture_output=True, text=True)
print(result.stdout)