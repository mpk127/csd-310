DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;


CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    hours       VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);


INSERT INTO store(store_id, locale, hours)
    VALUES('001', '60 White Street, Manhattan, NY 10013', '07:00 am to 10:00 pm');
INSERT INTO store(store_id, locale, hours)
    VALUES('002', '2211 Broadway, Manhattan, NY 10024', 'Comming Soon!');
INSERT INTO store(store_id, locale, hours)
    VALUES('003', '405 Lexington Avenue, Manhattan, NY 10174', 'Comming Soon!');


INSERT INTO book(book_name, author, details)
    VALUES('Going Postal', 'Terry Pratchett', 'First apperance of Moist von Lipwig');
INSERT INTO book(book_name, author, details)
    VALUES('Making Money', 'Terry Pratchett', 'Second apperance of Moist von Lipwig');
INSERT INTO book(book_name, author, details)
    VALUES('Raising Steam', 'Terry Pratchett', 'Final apperance of Moist von Lipwig');
INSERT INTO book(book_name, author, details)
    VALUES('The Long Earth', 'Terry Pratchett', 'First book of Long Earth series');
INSERT INTO book(book_name, author, details)
    VALUES('Dragonflight', 'Anne McCaffrey', 'First published book by Anne McCaffrey');
INSERT INTO book(book_name, author, details)
    VALUES("Crystal Singer", 'Anne McCaffrey', 'First of Crystal Singer Series');
INSERT INTO book(book_name, author, details)
    VALUES('Sahara', 'Clive Cussler', 'A Dirk Pitt novel');
INSERT INTO book(book_name, author, details)
    VALUES('Serpent', 'Clive Cussler', 'Part of the N.U.M.A Files');
INSERT INTO book(book_name, author, details)
    VALUES('Big Red Tequila', 'Rick Riordan', 'First Tres Navarre novel');


INSERT INTO user(first_name, last_name) 
    VALUES('Balthazar', 'Blake');
INSERT INTO user(first_name, last_name)
    VALUES('Dave', 'Stutler');
INSERT INTO user(first_name, last_name)
    VALUES('Becky', 'Barnes');


INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Balthazar'), 
        (SELECT book_id FROM book WHERE book_name = 'The Long Earth')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Dave'),
        (SELECT book_id FROM book WHERE book_name = 'Dragonflight')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Becky'),
        (SELECT book_id FROM book WHERE book_name = 'Big Red Tequila')
    );