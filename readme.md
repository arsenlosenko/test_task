To run this image properly, please pull it from repository with this command:

docker pull arsenlosenko/test_task

Image will be pulled from repo and automatically install all of the required software.
When pull will end, use next command to run the image:

docker run -it arsenlosenko/test_task

After which image will start and execute countryInfo.sh


P.S: there is still an issue with phppgadmin on nginx,it worked fine  before configuring script for data import into database, but right now it's not working properly, I am working on it. 
