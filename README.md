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
## Build this application 
Go back to the project directory  
```cd ~/todo-flask-sqlite ```  
Build todo-sql image  
```shell script
cd todo-flask-sqlite  
docker build -t todo-sql . 
```

## Launch the container application 
docker run -d  --name todo --link db:sqlite -v sqlite_dir:/opt/sqlite -v /opt/data:/opt/data \
  -p 5000:5000 todo-sql

## Copy the SQL script and load the database file
```shell script
  cd  ~/todo-flask-sqlite
  sudo cp sql/todos.sql /opt/data
  docker exec -it todo /bin/ash
  cd /opt/data 
  /opt/sqlite/sqlite3 tododb.db < todos.sql  
```
This application doesn't work on events so you need to start the container for the changes take effect.   
```shell script
  docker rm -f todo 
  docker run -d  --name todo --link db:sqlite -v sqlite_dir:/opt/sqlite -v /opt/data:/opt/data \
    -p 5000:5000 todo-sql
```

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


