To run this image properly, please pull it from repository with this command:

docker pull arsenlosenko/test_task

Image will be pulled from repo and automatically install all of the required software.
When pull will end, use next command to run the image:

docker run -it arsenlosenko/test_task

After this command, image will start its services automatically, so you can check created database with your browser. To do this, go to 172.17.0.2/phppgadmin
If you want to see output of countryInfo.sh, go to 172.17.0.2.

