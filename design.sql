CREATE DATABASE store_management COLLATE "utf8_general_ci";

CREATE TABLE governorates (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(id)
);

INSERT INTO governorates (name)
VALUES ("Giza"),("Aswan"),("Luxor"),("Minea"),("Behira"),("Red sea"),("Asiut"),("Sohag"),("Alexandria"),("Qalubia"),("Sharkia"),("Gharbia"),("Matrouh"),("North sinai"),("south sinai")


CREATE TABLE stores (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    address VARCHAR(255) NOT NULL ,
    governorate_id INTEGER UNSIGNED NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(id),
    FOREIGN KEY(governorate_id) REFERENCES governorates(id)
);



CREATE TABLE suppliers (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    email VARCHAR(255) NOT NULL UNIQUE,
    tel INTEGER(11) UNSIGNED NOT NULL UNIQUE,
    brief_data TEXT ,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(id)
);

CREATE TABLE products (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL ,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    description TEXT,
    price INTEGER UNSIGNED NOT NULL,
    supplier_id INTEGER UNSIGNED NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(id),
    FOREIGN KEY(supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE stores_suppliers (
    store_id INTEGER UNSIGNED NOT NULL,
    supplier_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY(store_id) REFERENCES stores(id),
    FOREIGN KEY(supplier_id) REFERENCES suppliers(id)
    
);

CREATE TABLE stores_products (
    store_id INTEGER UNSIGNED NOT NULL,
    product_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY(store_id) REFERENCES stores(id),
    FOREIGN KEY(product_id) REFERENCES products(id)

);