# hackathon_quick
hackathon starter dependencies shell script for ubuntu 16.04

# From Stack Overflow

http://stackoverflow.com/questions/37014186/running-mongodb-on-ubuntu-16-04-lts

Anyone who upgrade or installed Ubuntu 16.04 ( also known as Ubuntu Xenial xerus ) noticed that some of the old services stopped running. This issue is known from version 15.04 but I will focus on the above version.

Such was my case with MongoDB. To make a long story, short, Ubuntu shifted from upstart to systemd. One common solution, to these problems, is to switch back to upstart. I do not consider that option as a real solution, certainly not for the long run.

A real solution ( IMHO ) to the problem is to write systemd script that will start MongodDB. Unfortunately MongoDB guys had yet to supply one.

So I had to write one from scratch. To create one of your own follow these steps:

switch to root using
sudo su
or use sudo for all the following steps.

create a service script (in this example the name of the service is Mongodb)
nano /lib/systemd/system/mongodb.service
File content should be
[Unit]
Description=MongoDB Database Service
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/bin/mongod --config /etc/mongod.conf
ExecReload=/bin/kill -HUP $MAINPID
Restart=always
User=mongodb
Group=mongodb
StandardOutput=syslog
StandardError=syslog

[Install]
WantedBy=multi-user.target
You can also download the file from here: mongodb.service 
Here is a quick description of the important fields:
ExecStart - Is the command to run. Mongo installs itself under /usr/bin and the configuration file is written at /etc
User - The uid of the mongod process.
Group - The gid of the mongod process. Note that the user and group are created by the installation.

Now to start mongodb:

sudo systemctl start mongodb
To stop mongodb service use:

sudo systemctl stop mongodb
To enable mongodb on startup

sudo systemctl enable mongodb.service
If you need to refresh the services use:

 sudo systemctl daemon-reload
