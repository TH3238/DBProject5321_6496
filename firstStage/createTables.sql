CREATE TABLE Client
(
  Client_Id NUMERIC(3) NOT NULL,
  Client_Name VARCHAR(15) NOT NULL,
  Is_Club_Member NUMERIC(1) NOT NULL,
  PRIMARY KEY (Client_Id)
);

CREATE TABLE Worker
(
  Worker_Name VARCHAR(15) NOT NULL,
  Worker_Id NUMERIC(3) NOT NULL,
  Start_of_Work_date DATE NOT NULL,
  PRIMARY KEY (Worker_Id)
);

CREATE TABLE Supplier
(
  Supplier_Id NUMERIC(3) NOT NULL,
  Supplier_Name VARCHAR(15) NOT NULL,
  Region VARCHAR(15) NOT NULL,
  PRIMARY KEY (Supplier_Id)
);

CREATE TABLE Categorys
(
  Category_Id NUMERIC(3) NOT NULL,
  Category_Name VARCHAR(15) NOT NULL,
  PRIMARY KEY (Category_Id)
);

CREATE TABLE Orders
(
  Order_Id NUMERIC(3) NOT NULL,
  Order_Date DATE NOT NULL,
  Dellivery_Date DATE NOT NULL,
  PRIMARY KEY (Order_Id)
);

CREATE TABLE Purchase
(

  Purchase_Id NUMERIC(3) NOT NULL,
  Purchase_Date DATE NOT NULL,
  Dellivery_Date DATE NOT NULL,
  PRIMARY KEY (Purchase_Id)
 
);

CREATE TABLE Order_Supplier
(
  Supplier_Id NUMERIC(3) NOT NULL,
  Order_Id NUMERIC(3) NOT NULL,
  PRIMARY KEY (Supplier_Id, Order_Id),
  FOREIGN KEY (Supplier_Id) REFERENCES Supplier(Supplier_Id),
  FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id)
);

CREATE TABLE Order_Worker
(
  Worker_Id NUMERIC(3) NOT NULL,
  Order_Id NUMERIC(3) NOT NULL,
  PRIMARY KEY (Worker_Id, Order_Id),
  FOREIGN KEY (Worker_Id) REFERENCES Worker(Worker_Id),
  FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id)
);

CREATE TABLE Purchase_Worker
(
  Worker_Id NUMERIC(3) NOT NULL,
  Purchase_Id NUMERIC(3) NOT NULL,
  PRIMARY KEY (Worker_Id, Purchase_Id),
  FOREIGN KEY (Worker_Id) REFERENCES Worker(Worker_Id),
  FOREIGN KEY (Purchase_Id) REFERENCES Purchase(Purchase_Id)
);

CREATE TABLE Purchase_Client
(
  Client_Id NUMERIC(3) NOT NULL,
  Purchase_Id NUMERIC(3) NOT NULL,
  PRIMARY KEY (Client_Id, Purchase_Id),
  FOREIGN KEY (Client_Id) REFERENCES Client(Client_Id),
  FOREIGN KEY (Purchase_Id) REFERENCES Purchase(Purchase_Id)
);

CREATE TABLE Products
(
  Product_Id NUMERIC(3) NOT NULL,
  Product_Name VARCHAR(15) NOT NULL,
  Quantity NUMERIC(3) NOT NULL,
  Product_Price NUMERIC(3) NOT NULL,
  Category_Id NUMERIC(3) NOT NULL,
  PRIMARY KEY (Product_Id),
  FOREIGN KEY (Category_Id) REFERENCES Categorys(Category_Id)
);

CREATE TABLE Order_Product
(
  Product_Id NUMERIC(3) NOT NULL,
  Order_Id NUMERIC(3) NOT NULL,
  PRIMARY KEY (Product_Id, Order_Id),
  FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id),
  FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id)
);

CREATE TABLE Purchase_Product
(
  Product_Id NUMERIC(3) NOT NULL,
  Purchase_Id NUMERIC(3) NOT NULL,
  PRIMARY KEY (Product_Id, Purchase_Id),
  FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id),
  FOREIGN KEY (Purchase_Id) REFERENCES Purchase(Purchase_Id)
);
