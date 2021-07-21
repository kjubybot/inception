#!/bin/sh

mysql_install_db --datadir=/var/lib/mysql
mysqld --datadir=/var/lib/mysql --console
