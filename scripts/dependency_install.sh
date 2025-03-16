#! /bin/bash

udpated=false

function install() {
	if [[ $updated == "false" ]];then
		apt-update
		$updated=true
	fi
	apt-get install $1
}

function main() {
	# 检测docker
	if ! command -v docker > /dev/null; then
		install docker
	fi
	# 下载mysql镜像
	if ! docker images | grep mysql > /dev/null; then
		docker pull mysql:latest
	fi
	# 建立持久卷
	if ! docker volume ls | grep mysql-data > /dev/null; then
		docker volume create mysql-data
	fi
	# 启动mysql镜像
	docker rm -f FAS_mysql
	docker run -d -v mysql-data:/var/lib/mysql \
		-p 3306:3306 \
		-e MYSQL_ROOT_PASSWORD=secret_banser \
		-e MYSQL_USER=banser \
		-e MYSQL_PASSWORD=banser \
		--name FAS_mysql mysql:latest
	
	if ! docker images | grep redis > /dev/null; then
		docker pull redis:latest
	fi

	if ! docker volume ls | grep redis-data > /dev/null; then
		docker volume create redis-data
	fi

	docker rm -f FAS_redis
	docker run -d -v redis-data:/data \
		--name FAS_redis \
		-p 6379:6379 \
		redis:latest redis-server --save 60 1 --loglevel warning

	
}

main

