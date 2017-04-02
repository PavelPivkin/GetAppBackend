INSERT INTO Client (clientId, username, firstName, lastName, patronomyc, email, phone, address, photo, password) VALUES ('0', '12345', 'Василий', 'Лантратов', 'Анатольевич','myemail@mail.com','8912345****', 'г.Москва', LOAD_FILE("/home/photos/V.jpg"), '12345');
INSERT INTO Client (clientId, username, firstName, lastName, patronomyc, email, phone, address, photo, password) VALUES ('1', '11111', 'Павел', 'Пивкин', 'Петрович','myemail@mail.com','8921555****', 'г.Москва', LOAD_FILE("/home/photos/P.jpg"), '11111');
INSERT INTO Client (clientId, username, firstName, lastName, patronomyc, email, phone, address, photo, password) VALUES ('2', '22222', 'Егор', 'Искандаров', 'Вадимович','myemail@mail.com','8911111****', 'г.Москва', LOAD_FILE("/home/photos/E.jpg"), '22222');
INSERT INTO Client (clientId, username, firstName, lastName, patronomyc, email, phone, address, photo, password) VALUES ('3', '33333', 'Алексей', 'Комаров', 'Олегович','myemail@mail.com','8999999****', 'г.Москва', LOAD_FILE("/home/photos/A.jpg"), '33333');

INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type, CardNumber) VALUES ('0', '0', '62500', 'Vasily Lantratov', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','VISA', '#5', 'DEBIT', "4321123443558888");
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type, CardNumber) VALUES ('1', '1', '62500', 'Pavel Pivkin', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','VISA', '#5', 'DEBIT', "4321425115235555");
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type, CardNumber) VALUES ('2', '2', '62500', 'Egor Iskandarov', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','MAESTRO', '#5', 'DEBIT', "4321314543551111");
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type, CardNumber) VALUES ('3', '3', '62500', 'Aleksei Komarov', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','MASTER CARD', '#5', 'DEBIT', "4311193443423334");
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type, CardNumber) VALUES ('4', '0', '62500', 'Vasily Lantratov', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','VISA', '#5', 'DEBIT', "4321123411158888");
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type, CardNumber) VALUES ('5', '1', '62500', 'Pavel Pivkin', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','VISA', '#5', 'DEBIT', "4321425115768555");
INSERT INTO Card (cardId, clientId, balance, holderName, expireDate, openDate, pan, paymentSystem, product, type, CardNumber) VALUES ('6', '0', '62500', 'Egor Iskandarov', '2017-01-01 11:11:11', '2020-01-01 00:00:00','AAAAA9999A','MAESTRO', '#5', 'DEBIT', "4321333243551111");


INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('0', '0', '2017-04-01 18:21:00', 'type', '5200', 'Театр');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('1', '0', '2017-04-01 23:15:00', 'type', '2000', 'Ресторан');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('2', '2', '2017-04-02 18:19:00', 'type', '800', 'Кино');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('3', '1', '2017-04-02 16:45:00', 'type', '500', 'Музей');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('4', '3', '2017-04-05 12:45:00', 'type', '800', 'Кафе');
INSERT INTO Operation (operationId, clientId, odate, type, amount, description) VALUES ('5', '0', '2017-04-07 20:30:00', 'type', '700', 'Пицца');
