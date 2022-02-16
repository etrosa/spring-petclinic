
## Step 1 Installing Docker & Jenkins on windows
- Installing Jenkins: Use the default setup wizard via jenkins.io/doc/book/installing/windows
- Installing Docker: user docker desktop setup wizard via https://docs.docker.com/desktop/windows/release-notes/

## Step 2 Configuring Jenkins
- Add github credentials in credential manager
- Add dockerhub credentials in credential manager
- Add Pipeline Plugin via Manage Plugins
- Check Java_Home Path matches jenkins environment variable since jenkins is installed locally

## Step 3 Setup Dockerfile
- Add required jdk dependencies
- Add maven build command
- Add dependencies using maven, mavenCentral() added to pom.xml
- Add maven test command

## Step 4 Setup Jenkinsfile
- Setup a git pull
- Setup a docker build
- Setup a dockerhub push adding appropriate tag for tracking

## Step 6 Setup Jenkins Pipelin
- Create base pipeline project
- Add github project information (pull credentials from cred manager)
- Select pipeline from jenkins file

## Step 7 Run Pipeline
- Build the Pipeline on Jenkins, make sure to look at the logs to see any additional errors or warnings

## Step 8 Check Docker Hub 
- Make sure to check timestamps for updated images
- Prune local docker images and pull the new image from docker hub, since docker desktop for windows can take a bit to register new images
- docker image prune

## Step 9 Run the new image
- Run the pulled docker image setting the port to 8080:8080
- docker run -p 8080:8080 etrosa/petclinic:latest

Issues encountered:
- Jenkins credential manager keyword will not get called, forcing inline login
- Jenkins builds and publishes a new image to dockerhub, however, the image is pullable but does not run and results in the following error: "standard_init_linux.go:228: exec user process caused: no such file or directory"

