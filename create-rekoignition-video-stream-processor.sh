#!/usr/bin/env bash

# Now, using the AWS CLI on the command line, let’s create a face collection of known faces for SNS notification .

aws rekognition create-collection --collection-id rtva-known-faces-collection --region us-west-2

#First, upload a picture of known faces to an Amazon S3 bucket in the us-west-2 Region.
#Then replace the MYFACE_KEY with the bucket and location within the bucket from which it was uploaded. For YOURNAME,
#type your name, and it will be used as the external image ID when it finds your face.

aws rekognition index-faces --image '{"S3Object":{"Bucket":"rtva-known-faces","Name":"<MYFACE_KEY>.jpeg"}}' \
--collection-id "rtva-known-faces-collection" --detection-attributes "ALL" --external-image-id "<YOURNAME>" --region us-west-2


# Now let’s start the stream processor:
aws rekognition create-stream-processor --region us-west-2 --cli-input-json rekognition-config.json


