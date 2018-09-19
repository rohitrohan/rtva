#!/usr/bin/env bash


#First, upload a picture of known faces to an Amazon S3 bucket in the us-west-2 Region.
#Then replace the MYFACE_KEY with the bucket and location within the bucket from which it was uploaded. For YOURNAME,
#type your name, and it will be used as the external image ID when it finds your face.

aws rekognition index-faces --image '{"S3Object":{"Bucket":"rtva-known-faces","Name":"<MYFACE_KEY>.jpeg"}}' \
--collection-id "rtva-known-faces-collection" --detection-attributes "ALL" --external-image-id "<YOURNAME>" --region us-west-2
