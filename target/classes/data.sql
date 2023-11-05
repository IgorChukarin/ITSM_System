insert ignore into usr (id, active, password, username) values (1, 1, 1, 'admin');
insert ignore into user_role (user_id, roles) values (1, 'USER');
insert ignore into user_role (user_id, roles) values (1, 'ADMIN');