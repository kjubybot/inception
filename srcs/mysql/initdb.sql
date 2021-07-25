CREATE DATABASE wp;
CREATE USER 'tmeizo'@'%' IDENTIFIED BY 'pass';
CREATE USER 'tmeizo'@'localhost' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wp.* TO 'tmeizo'@'%';
GRANT ALL PRIVILEGES ON wp.* TO 'tmeizo'@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;
