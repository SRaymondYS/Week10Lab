DROP SCHEMA IF EXISTS inventoryDB;

CREATE SCHEMA IF NOT EXISTS inventoryDB DEFAULT CHARACTER SET latin1 ;
USE inventoryDB;

CREATE TABLE roles
(
    roleID int(11) NOT NULL,
    roleName varchar(25) NOT NULL,
    PRIMARY KEY (roleID)
);

INSERT INTO roles VALUES (1, 'system admin');
INSERT INTO roles VALUES (2, 'regular user');
INSERT INTO roles VALUES (3, 'company admin');

CREATE TABLE if not exists users 
(
    email VARCHAR(40) NOT NULL UNIQUE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    `role` INT(11) NOT NULL,
    ResetPasswordUUID VARCHAR(50),

    CONSTRAINT USER_EMAIL_PK PRIMARY KEY (email),
    CONSTRAINT USER_ROLE_FK FOREIGN KEY (`role`) REFERENCES roles (roleID) ON DELETE RESTRICT ON UPDATE RESTRICT
);


CREATE TABLE IF NOT EXISTS inventoryDB.categories
(
    categoryID INT NOT NULL AUTO_INCREMENT,
    categoryName VARCHAR(45) NOT NULL,
    PRIMARY KEY (categoryID)
)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS inventoryDB.items 
(
    itemID INT NOT NULL AUTO_INCREMENT,
    category INT NOT NULL,
    itemName VARCHAR(45) NOT NULL,
    price DOUBLE NOT NULL,
    owner VARCHAR(40) NOT NULL,
    PRIMARY KEY (itemID),
    INDEX fk_items_categories_idx (category ASC),
    INDEX fk_items_users1_idx (owner ASC),
    CONSTRAINT fk_items_category
        FOREIGN KEY (category)
        REFERENCES inventoryDB.categories (categoryID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT fk_items_users1
        FOREIGN KEY (owner)
        REFERENCES inventoryDB.users (email)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)
ENGINE = InnoDB;

INSERT INTO categories (categoryName) VALUES ('kitchen');
INSERT INTO categories (categoryName) VALUES ('bathroom');
INSERT INTO categories (categoryName) VALUES ('living room');
INSERT INTO categories (categoryName) VALUES ('basement');
INSERT INTO categories (categoryName) VALUES ('bedroom');
INSERT INTO categories (categoryName) VALUES ('garage');
INSERT INTO categories (categoryName) VALUES ('office');
INSERT INTO categories (categoryName) VALUES ('utility room');
INSERT INTO categories (categoryName) VALUES ('storage');
INSERT INTO categories (categoryName) VALUES ('other');

INSERT INTO users (email, active, fname, lname, password ,`role`)
	VALUES ('cprg352+admin@gmail.com', true, 'Admin','Admin','password',1);
INSERT INTO users (email, active, fname, lname, password ,`role`)
	VALUES ('cprg352+admin2@gmail.com', true, 'Admin2','Admin2','password',3);
INSERT INTO users (email, active, fname, lname, password ,`role`)
	VALUES ('cprg352+anne@gmail.com', true, 'Anne','Annerson','password',2);
INSERT INTO users (email, active, fname, lname, password ,`role`)
	VALUES ('cprg352+barb@gmail.com', true, 'Barb','Barber','password',2);
INSERT INTO users (email, active, fname, lname, password ,`role`)
	VALUES ('rswebcprg352+raymond@gmail.com', true, 'Raymond','Si','password',2);

INSERT INTO items (category, itemName, price, owner) VALUES (1,'blender',29.99,'cprg352+anne@gmail.com');
INSERT INTO items (category, itemName, price, owner) VALUES (1,'toaster',19.99,'cprg352+anne@gmail.com');
INSERT INTO items (category, itemName, price, owner) VALUES (3,'lamp',5,'cprg352+anne@gmail.com');
INSERT INTO items (category, itemName, price, owner) VALUES (6,'winter tires',200,'cprg352+anne@gmail.com');
INSERT INTO items (category, itemName, price, owner) VALUES (5,'dresser',50,'cprg352+anne@gmail.com');