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

INSERT IGNORE INTO usr (id, active, password, username) VALUES (2, 1, 'pass', 'chukarin');
INSERT INTO user_role (user_id, roles)
SELECT 2, 'USER'
WHERE NOT EXISTS (
    SELECT 2 FROM user_role
    WHERE user_id = 2 AND roles = 'USER'
);

INSERT IGNORE INTO usr (id, active, password, username) VALUES (3, 1, 'pass', 'verba');
INSERT INTO user_role (user_id, roles)
SELECT 3, 'USER'
WHERE NOT EXISTS (
    SELECT 3 FROM user_role
    WHERE user_id = 3 AND roles = 'USER'
);

INSERT IGNORE INTO usr (id, active, password, username) VALUES (4, 1, 'pass', 'unuchakova');
INSERT INTO user_role (user_id, roles)
SELECT 4, 'USER'
WHERE NOT EXISTS (
    SELECT 4 FROM user_role
    WHERE user_id = 4 AND roles = 'USER'
);


INSERT INTO business_service (id, name, price, service_line, work_composition) VALUES
(1, 'Создание дизайна и интерфейса приложения', 10500, 'Услуги создания', 'разработка концепции и создание визуального образа приложения, анализ требований клиента, интернет-маркетинг, документооборот'),
(2, 'Создания функциональности для управления бд клиентов', 10500, 'Услуги создания', 'Разработка функциональности для сохранения и загрузки данных из базы данных, анализ требований клиента, интернет-маркетинг, документооборот'),
(3, 'Интеграция с онлайн-бронированием и платежными системами', 11000, 'Услуги создания', 'Разработка функциональности для автоматической отправки подтверждения бронирования, разработка пользовательского   интерфейса, первоначальная настройка оборудования'),
(4, 'Предоставление готовых решенитй для салонов красоты', 9000, 'Услуги доступа/аренды', 'Установка и настройка выбранного решения, техническое обслуживание оборудования, замена оборудования'),
(5, 'Адаптация готовых решений к нуждам заказчиков', 8000, 'Услуги доступа/аренды', 'Тестирование и отладка, изменение функциональности, обучение и поддержка');

INSERT INTO technical_service (id, service_line, name, auxiliary_element) VALUES
(1, 'Услуги создания', 'Создание дизайна и интерфейса приложения', 'Серверное оборудование, коммутаторы, маршрутизаторы, ПК, MySQL, Spring, Spring data JPA, Spring Security, документация, ГОСТы, договор с заказчиком, внутренние правила компании'),
(2, 'Услуги создания', 'Создания функциональности для управления бд клиентов', 'Серверное оборудование, коммутаторы, маршрутизаторы, ПК, MySQL, Spring, Spring data JPA, Spring Security, документация, ГОСТы, договор с заказчиком, внутренние правила компании'),
(3, 'Услуги создания', 'Интеграция с онлайн-бронированием и платежными системами', 'Серверное оборудование, коммутаторы, маршрутизаторы, ПК, MySQL, Spring, Spring data JPA, Spring Security, внешнее ПО для интеграции с платежными системами, документация, ГОСТы, договор с заказчиком, внутренние правила компании'),
(4, 'Услуги доступа/аренды', 'Предоставление готовых решенитй для салонов красоты', 'Серверное оборудование, коммутаторы, маршрутизаторы, ПК, MySQL, Spring, Spring data JPA, Spring Security, документация, ГОСТы, договор с заказчиком, внутренние правила компании'),
(5, 'Услуги доступа/аренды', 'Адаптация готовых решений к нуждам заказчиков', 'Серверное оборудование, коммутаторы, маршрутизаторы, ПК, MySQL, Spring, Spring data JPA, Spring Security, документация, ГОСТы, договор с заказчиком, внутренние правила компании');

INSERT INTO business_service_related_technical_services (business_service_id, related_technical_services_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO request (id, creation_time, email, name, status, subject, text, business_service_id) VALUES
(1, '2023-11-16 09:18:03', 'Zigor2356@mail.ru', 'Чукарин Игорь Евгеньевич', 'WAITING', 'Не работает форма', 'При нажатии на кнопку формы сообщение не отправляется', 1),
(2, '2023-11-16 09:19:03', 'hattlerrr@mail.ru', 'Сорокина Анастасия', 'WAITING', 'Не меняется цвет фона', 'При выборе нового цвета, он остается исходным', 2),
(3, '2023-11-16 10:19:03', 'unuchakova@mail.ru', 'Унучакова Дарья Алексеевна', 'WAITING', 'Плохо', 'Мне ничего не нравится', 3);
