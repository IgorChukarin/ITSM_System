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


INSERT INTO business_service (id, name, price, service_line, work_composition) VALUES
(1, 'Do1', 100, 'Doing', 'Do something and Do something else'),
(2, 'Do2', 200, 'Doing', 'Do something and Do something else'),
(3, 'Do3', 300, 'Doing', 'Do something and Do something else'),
(4, 'Do4', 400, 'Doing', 'Do something and Do something else'),
(5, 'Do5', 500, 'Doing', 'Do something and Do something else');


INSERT INTO technical_service (id, service_line, name, auxiliary_element) VALUES
(1, 'tec1', 'Break into computer1', 'helper1'),
(2, 'tec2', 'Break into computer2', 'helper2'),
(3, 'tec3', 'Break into computer3', 'helper3');

INSERT INTO business_service_related_technical_services (business_service_id, related_technical_services_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 3),
(5, 2),
(5, 3);
