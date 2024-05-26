import boto3
import os
session = boto3.Session()

ACCESS_KEY = os.getenv('ACCESS_KEY')
SECRET_KEY = os.getenv('SECRET_KEY')

session = boto3.Session(
    aws_access_key_id=ACCESS_KEY,
    aws_secret_access_key=SECRET_KEY)

s3 = session.resource('s3')
s3_client = session.client('s3')

#client.list_buckets()
#client.list_objects()
#client.create_bucket()
#client.delete_bucket()
#client.put_object()
#client.copy()
#client.copy_object()
#client.delete_object()
#client.delete_objects()
#client.download_file()
#client.download_fileobj()
#upload_file()
#upload_fileobj()
#create a new bucket ()

# create a bucket
response = s3_client.create_bucket(
    Bucket='demo-bucket-python-sarah',  
    CreateBucketConfiguration={'LocationConstraint': 'us-east-2'} 
)

print(response)

# list all buckets
for key in s3_client.list_buckets()['Buckets']:
    print(key['Name'])

# list all objects (including folders) in a bucket/folder
# no sub-folder called datasets/social exists so this will throw an error

# objects = s3_client.list_objects(
#     Bucket='demo-bucket-python-sarah',
#     Prefix='datasets/social' #subfolder name
# )
# for key in objects['Contents']:
#     print(key['Key'])

# Create a folder object in a bucket
response = s3_client.put_object(
    Bucket='demo-bucket-python-sarah',
    Key=('tmp/demo.csv'))
print(response)

#List the folder
objects = s3_client.list_objects(
    Bucket='demo-bucket-python-sarah',
    Prefix='tmp'
)

for key in objects['Contents']:
    print(key['Key'])

# Copy an object from one S3 location to another.
copy_source = {
    'Bucket': 'demo-bucket-python-sarah',
    'Key': 'tmp/demo.csv'
}
s3_client.copy(copy_source, 'demo-bucket-python-sarah', 'tmp1/demo1.csv')

objects = s3_client.list_objects(
    Bucket='demo-bucket-python-sarah',
    Prefix='tmp1'
)

for key in objects['Contents']:
    print(key['Key'])

# Upload a file from local to s3
s3_client.upload_file('test.csv', 'weclouddata-demo-bucket', 'tmp/demo_local.csv')

# Download from s3
s3_client.download_file('weclouddata-demo-bucket', 'tmp1/demo1.csv', 'demo1_s3.csv')
