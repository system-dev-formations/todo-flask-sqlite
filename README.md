# Todo-flask-mysql
Example on how to set up a multi-containers platform using Python-Flask and Sqlite database

Type   
```shell script
git clone https://github.com/<my_repo>/todo-flask-sqlite
```

## Build sqlite3 alpine image
```shell script
  cd todo-flask-sqlite
  cd sqlite3
  docker build -t sqlite3 . 
```

## Create a shared volume 
```shell script
  docker volume create sqlite_dir
```
## Launch the docker sqlite3 container, and tail on an empty file
```shell script
  docker run -d --name db -v sqlite_dir:/opt/sqlite sqlite3 tail -f /dev/null 
```

Go back to the project directory  
```cd ~/todo-flask-sqlite ```  
Build todo-sql image  
```shell script
cd todo-flask-sqlite  
docker build -t todo-sql . 
```

## Launch the container application 
docker run -d  --name todo --link db:sqlite -v sqlite_dir:/opt/sqlite -v /opt/data:/opt/data todo-sql

 
## How to set up the database file
``` 
 

```   

Launch a PhpMyAdmin container connected to MySQL database
```shell script
docker run -d  --name phpmyadmin --link db:mysql \
 -e MYSQL_USERNAME=root -p 8181:80 nazarpc/phpmyadmin
```
Get this repository  
```git clone https://github.com/system-dev-formations/todo-flask-mysql.git```  
Build todo-sql image  
```cd todo-flask-mysql```  
```docker build -t todo-sql . ```  
  


# Test
Bring up your favorite browser   
``` http://localhost:5000/```
and check 

# Docker-compose version 
We are going to setup a python virtualenv 
## On ubuntu
### Packages, virtualenv, activate  
```code
sudo apt-get -y install python3
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-venv
python3 -m venv venv
source venv/bin/activate
```
### docker-compose set up
```code 
pip3 install wheel
pip3 install docker-compose
```
## On Centos
```code 
sudo yum install python3
sudo yum install python3-pip
python3 -m venv venv
source venv/bin/activate
pip3 install docker-compose
pip3 install --upgrade pip
```
## Execute
In the directory todo-flask-mysql, hit   
```docker-compose up ```  
or  
```docker-compose up -d```


