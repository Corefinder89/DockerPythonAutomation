# This Dockerfile consists of all dependency packages required to start of with automation using python and webdriver api. This package will consist of
# 1. Latest version of pip
# 2. Pip packgaes like pyvirtualdisplay, Selenium 3.3.3
# 3. npm packages like chromedriver and geckodriver
# 4. phantomjs binary
# 5. google chrome headless browser, firefox browser
# 6. Xvfb and xserver-xephyr

# N.B: pyvirtualdisplay will act as a python wrapper for Xvfb

FROM ubuntu:latest

# Update system packages
RUN apt-get update

# Install wget
RUN apt-get install -y wget

# Create a downloads directory
RUN mkdir Downloads

# Install and upgrade pip to the latest version
RUN apt-get install -y python-pip
RUN pip install --upgrade pip

# Install xvfb and xserver-xephyr onto the system
RUN apt-get install -y xvfb xserver-xephyr vnc4server

# Install pyvirtualdisplay
RUN pip install pyvirtualdisplay

# Install selenium
RUN pip install -U selenium

# Install google-chrome packages and dependencies
RUN apt-get install -y libxss1 libappindicator1 libindicator7 libasound2 libgconf-2-4 libnspr4 libnss3 libpango1.0-0 fonts-liberation xdg-utils
WORKDIR Downloads
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install google-chrome-stable

# Install firefox browser
RUN apt-get install -y firefox

# Install npm and update it to the latest version
RUN apt-get install -y npm
RUN npm cache clean -f
RUN npm install -g n
RUN n stable

# Install chromedriver
RUN npm install -g chromedriver
RUN which chromedriver

# Install geckodriver
RUN npm install -g geckodriver
RUN which geckodriver

# Install phantomjs and its dependencies
RUN apt-get install libfreetype6 libfreetype6-dev
RUN apt-get install libfontconfig1 libfontconfig1-dev
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
# Moving phantomjs folder to '/usr/local/share/'
RUN mv phantomjs-2.1.1-linux-x86_64 phantomjs
RUN mv phantomjs /usr/local/share
RUN ln -sf /usr/local/share/phantomjs/bin/phantomjs /usr/local/bin/phantomjs
RUN ln -sf /usr/local/share/phantomjs/bin/phantomjs /usr/local/share/phantomjs
RUN ln -sf /usr/local/share/phantomjs/bin/phantomjs /usr/bin/phantomjs
RUN which phantomjs

#Create an automation project directory
WORKDIR /
RUN mkdir Python-Automation-Project
WORKDIR Python-Automation-Project
ADD Sample_Code.py .

#Check Present Working Directory is your project directory
RUN pwd

CMD ["python","/Python-Automation-Project/Sample_Code.py"]
