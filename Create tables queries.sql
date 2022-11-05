-- Customer

CREATE TABLE CUSTOMER (
	CUSTOMER_ID INTEGER PRIMARY KEY,
	CUSTOMER_FNAME VARCHAR(30) NOT NULL,
	CUSTOMER_LNAME VARCHAR(30) NOT NULL,
	CUSTOMER_EMAIL VARCHAR(30) NOT NULL,
	CUSTOMER_PHONE VARCHAR(20) NOT NULL,
	CUSTOMER_ADDRESS VARCHAR(30) NOT NULL
);

--Payment

CREATE TABLE PAYMENT (
	PAYMENT_ID INTEGER PRIMARY KEY,
	PAYMENT_TYPE VARCHAR(10) NOT NULL
);

--Restaurant_Orders

CREATE TABLE RESTAURANT_ORDERS (
	ORDER_ID SMALLINT PRIMARY KEY,
	CUSTOMER_ID INTEGER NOT NULL,
	PAYMENT_ID INTEGER NOT NULL,
	ORDER_DATE DATE NOT NULL,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID),
	FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT (PAYMENT_ID)
);

--Menu

CREATE TABLE MENU (
	MENU_ID SMALLINT PRIMARY KEY,
	MENU_TYPE VARCHAR (30) NOT NULL
);

--Item

CREATE TABLE ITEM (
	ITEM_ID INTEGER PRIMARY KEY,
	MENU_ID INTEGER NOT NULL,
	ITEM_NAME VARCHAR(30) NOT NULL,
	ITEM_DESCRIPTION TEXT NOT NULL,
	ITEM_PRICE NUMERIC NOT NULL,
	FOREIGN KEY (MENU_ID) REFERENCES MENU (MENU_ID)
);

--Order_item

CREATE TABLE ORDER_ITEM (
	ORDER_ID SMALLINT NOT NULL,
	ITEM_ID INTEGER NOT NULL,
	ORDER_ITEM_QUANTITY SMALLINT NOT NULL,
	FOREIGN KEY(ORDER_ID) REFERENCES RESTAURANT_ORDERS (ORDER_ID),
	FOREIGN KEY(ITEM_ID) REFERENCES ITEM (ITEM_ID),
	PRIMARY KEY(ORDER_ID,ITEM_ID)
);
