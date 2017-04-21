# Overview
A containerized platform to run your tests in python headless using `firefox` `chrome` and `phantomjs`. So you can have your tests automated and place it in the docker container from where all the automation tests can be executed. The container would help you simulate all your tests in python without worrying about its packages and dependencies.<br>

# Requirements
1. `Docker` should be installed in the machine.<br>
2. `Docker machine` should be up and running.<br>
3. Docker `ubuntu` image should be present. If it is not present in your machine just do a `docker run ubuntu:latest` or `docker pull ubuntu:latest`.<br>

# Procedure
1. Get the image into your local machine either from `github` by using the following command `https://github.com/Corefinder89/pyconauto.git` or you can clone it from `dockerhub` as well using the following command `docker pull corefinder/pyconauto`.<br>
2. Next you need to configure the automation project directory inside the `Python-Automation-Project` directory.<br>
2. Once the image is present in your local system you need to build the corresponding `Dockerfile` to get the dependencies and packages in your container. The command to build your docker image would be `docker build -t <tagname_image> corefinder/pyconauto .`.<br>
3. Last but not the least you need to execute the docker container to execute all your tests using the command `docker run --name <container name> corefinder/pyconauto`.<br>

<h3>P.S</h3>
I have written a small python automation code which is added to the <b>Python-Automation-Project</b> directory. You can build the corresponding dockerfile and execute it to understand the flow and then get started with your automation.
