INSERT INTO Client (clientId, username, firstName, lastName, patronomyc, email, phone, address, photo) VALUES ('0', 'Kalter', 'Василий', 'Лантратов', 'Анатольевич','myemail@mail.com','8912345****', 'г.Москва', LOAD_FILE("/home/photos/V.jpg"));
INSERT INTO Client (clientId, username, firstName, lastName, patronomyc, email, phone, address, photo) VALUES ('1', 'Dreamer', 'Павел', 'Пивкин', 'Петрович','myemail@mail.com','8921555****', 'г.Москва', LOAD_FILE("/home/photos/P.jpg"));
INSERT INTO Client (clientId, username, firstName, lastName, patronomyc, email, phone, address, photo) VALUES ('2', 'MOPCKuE_CBuHKu', 'Егор', 'Искандаров', 'Вадимович','myemail@mail.com','8911111****', 'г.Москва', LOAD_FILE("/home/photos/E.jpg"));
INSERT INTO Client (clientId, username, firstName, lastName, patronomyc, email, phone, address, photo) VALUES ('3', 'Kek$95', 'Алексей', 'Комаров', 'Олегович','myemail@mail.com','8999999****', 'г.Москва', LOAD_FILE("/home/photos/A.jpg"));

INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type) VALUES ('0', '0', '62500', 'Vasily Lantratov', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','VISA', '#5', 'DEBIT');
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type) VALUES ('1', '1', '62500', 'Pavel Pivkin', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','VISA', '#5', 'DEBIT');
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type) VALUES ('2', '2', '62500', 'Egor Iskandarov', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','MAESTRO', '#5', 'DEBIT');
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type) VALUES ('3', '3', '62500', 'Aleksei Komarov', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','MASTER CARD', '#5', 'DEBIT');

INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('0', '0', '2017-04-01 18:21:00', 'type', '5200', 'Театр');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('1', '0', '2017-04-01 23:15:00', 'type', '2000', 'Ресторан');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('2', '2', '2017-04-02 18:19:00', 'type', '800', 'Кино');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('3', '1', '2017-04-02 16:45:00', 'type', '500', 'Музей');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('4', '3', '2017-04-05 12:45:00', 'type', '800', 'Кафе');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('5', '0', '2017-04-07 20:30:00', 'type', '700', 'Пицца');
