DROP DATABASE IF EXISTS FAS_database;
CREATE DATABASE IF NOT EXISTS FAS_database;
USE FAS_database;

CREATE TABLE user (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
	username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
	password VARCHAR(300) NOT NULL COMMENT '密码',
	sex BOOL DEFAULT FALSE NOT NULL COMMENT '性别',
	telephone VARCHAR(20) NULL COMMENT '电话',
	create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '更新时间',
	UNIQUE KEY username_unique (username)
) ENGINE = InnoDB, COMMENT = '用户表', DEFAULT CHARSET = UTF8;

INSERT INTO user (username, password, sex, telephone, create_time, update_time)
-- 默认密码为admin 
VALUES ('admin', SHA2('admin', 256), 1, '12345678901', NOW(), NOW());

CREATE TABLE role (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT '角色ID',
	role_name VARCHAR(50) NOT NULL COMMENT '角色名称',
	role_desc VARCHAR(100) NULL COMMENT '角色描述',
	create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '更新时间'
) ENGINE = InnoDB, COMMENT = '角色表', DEFAULT CHARSET = UTF8;

INSERT INTO role (role_name, role_desc, create_time, update_time) VALUES ('admin', '管理员', NOW(), NOW());

CREATE TABLE user_role (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户角色ID',
	user_id INT NOT NULL COMMENT '用户ID',
	role_id INT NOT NULL COMMENT '角色ID',
	create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '更新时间'
) ENGINE = InnoDB, COMMENT = '用户角色关联表', DEFAULT CHARSET = UTF8;

INSERT INTO user_role (user_id, role_id, create_time, update_time) VALUES (1, 1, NOW(), NOW());

CREATE TABLE permission (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT '权限ID',
	permission_name VARCHAR(50) NOT NULL COMMENT '权限名称',
	permission_desc VARCHAR(100) NULL COMMENT '权限描述',
	create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '更新时间'
) ENGINE = InnoDB, COMMENT = '权限表', DEFAULT CHARSET = UTF8;

INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('user:select', '用户查询', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('user:insert', '用户新增', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('user:update', '用户更新', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('user:delete', '用户删除', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('role:select', '角色查询', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('role:insert', '角色新增', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('role:update', '角色更新', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('role:delete', '角色删除', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('permission:select', '权限查询', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('permission:insert', '权限新增', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('permission:update', '权限更新', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('permission:delete', '权限删除', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('user_role:select', '用户角色查询', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('user_role:insert', '用户角色新增', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('user_role:update', '用户角色更新', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('user_role:delete', '用户角色删除', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('role_permission:select', '角色权限查询', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('role_permission:insert', '角色权限新增', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('role_permission:update', '角色权限更新', NOW(), NOW());
INSERT INTO permission (permission_name, permission_desc, create_time, update_time) VALUES ('role_permission:delete', '角色权限删除', NOW(), NOW());

CREATE TABLE role_permission (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT '角色权限ID',
	role_id INT NOT NULL COMMENT '角色ID',
	permission_id INT NOT NULL COMMENT '权限ID',
	create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '更新时间'
) ENGINE = InnoDB, COMMENT = '角色权限关联表', DEFAULT CHARSET = UTF8;	

INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 1, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 2, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 3, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 4, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 5, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 6, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 7, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 8, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 9, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 10, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 11, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 12, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 13, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 14, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 15, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 16, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 17, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 18, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 19, NOW(), NOW());
INSERT INTO role_permission (role_id, permission_id, create_time, update_time) VALUES (1, 20, NOW(), NOW());
