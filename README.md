# minio_upload_via_curl test environment files
 - Boot minio server on local machine.
   ``` 
   docker-compose up -d
   ```
   
 - put files via curl command.
   ``` 
   sh minio_upload.sh bucketname filename.file
   ```


# References
 - https://www.burgundywall.com/post/upload-minio-curl
