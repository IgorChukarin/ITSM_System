INSERT IGNORE INTO usr (id, active, password, username) VALUES (1, 1, 'pass', 'admin');
INSERT INTO user_role (user_id, roles)
SELECT 1, 'USER'
WHERE NOT EXISTS (
    SELECT 1 FROM user_role
    WHERE user_id = 1 AND roles = 'USER'
);
INSERT INTO user_role (user_id, roles)
SELECT 1, 'ADMIN'
WHERE NOT EXISTS (
    SELECT 1 FROM user_role
    WHERE user_id = 1 AND roles = 'ADMIN'
);

INSERT IGNORE INTO business_service (id, name, price, service_line, work_composition) values (1, 'Do something', 100, 'Doing', 'Do something and Do something else');
INSERT IGNORE INTO business_service (id, name, price, service_line, work_composition) values (2, 'Do some', 200, 'Doing', 'Do something and Do something else');
INSERT IGNORE INTO business_service (id, name, price, service_line, work_composition) values (3, 'Do something', 300, 'Doing', 'Do something and Do something else');

INSERT IGNORE INTO technical_service (id, service_line, name, auxiliary_element) values (1, 'Doing', 'Break into computer', 'helper');
INSERT IGNORE INTO technical_service (id, service_line, name, auxiliary_element) values (2, 'Dobingling', 'Break computer', 'google');
INSERT IGNORE INTO technical_service (id, service_line, name, auxiliary_element) values (3, 'Killer', 'Computer', 'Heller');

