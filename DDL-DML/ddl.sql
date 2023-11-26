drop table table_status;
drop table seating;
drop table employee;
drop table reservation;
drop table orders;
drop table bill;
drop table customer;
drop table food_ingredient;
drop table food;
drop table ingredient;

CREATE TABLE Ingredient (
  Ingredient_ID VARCHAR2(4) PRIMARY KEY,
  Ingredient_Name VARCHAR2(20),
  Category VARCHAR2(10),
  Ingredient_Quantity NUMBER,
  CONSTRAINT Ingredient_Quantity_CHK CHECK (Ingredient_Quantity >= 0)
);

CREATE TABLE Food (
  Food_ID VARCHAR2(4) PRIMARY KEY,
  Food_Name VARCHAR2(30) NOT NULL,
  Cuisine VARCHAR2(10),
  Price_per_unit NUMBER,
  CONSTRAINT Food_Price_per_unit_CHK CHECK (Price_per_unit > 0)
);

CREATE TABLE Food_Ingredient (
  Food_ID VARCHAR2(4),
  Ingredient_ID VARCHAR2(4),
  Quantity_per_ingredient NUMBER,
  CONSTRAINT Food_Ingredient_PK PRIMARY KEY (Food_ID, Ingredient_ID),
  CONSTRAINT Food_FK FOREIGN KEY (Food_ID) REFERENCES Food(Food_ID),
  CONSTRAINT Ingredient_FK FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient(Ingredient_ID),
  CONSTRAINT Quantity_per_ingredient_CHK CHECK (Quantity_per_ingredient > 0)
);

CREATE TABLE Customer (
  Customer_ID VARCHAR2(4) PRIMARY KEY,
  Customer_Name VARCHAR2(20),
  Phone NUMBER(10),
  Email VARCHAR2(20),
  CONSTRAINT Customer_Email_CHK CHECK (Email LIKE '%@%')
);

CREATE TABLE Bill (
  Order_ID VARCHAR2(4),
  Customer_ID VARCHAR2(4),
  Amount NUMBER,
  CONSTRAINT Bill_PK PRIMARY KEY (Order_ID),
  CONSTRAINT Bill_Customer_FK FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Orders (
  Order_ID VARCHAR2(4),
  Food_ID VARCHAR2(4),
  Food_Quantity NUMBER,
  CONSTRAINT Orders_PK PRIMARY KEY (Order_ID, Food_ID),
  CONSTRAINT Orders_FK1 FOREIGN KEY (Order_ID) REFERENCES Bill(Order_ID),
  CONSTRAINT Orders_FK2 FOREIGN KEY (Food_ID) REFERENCES Food(Food_ID),
  CONSTRAINT Orders_Food_Quantity_CHK CHECK (Food_Quantity > 0)
);



CREATE TABLE Reservation (
  Reservation_ID VARCHAR2(4) PRIMARY KEY,
  Customer_ID VARCHAR2(4),
  Date_R  DATE,
  Time_R  VARCHAR2(10),
  Diners_Count NUMBER,
  CONSTRAINT Reservation_Customer_FK FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  CONSTRAINT Diners_Count_CHK CHECK (Diners_Count > 0)
);

CREATE TABLE Employee (
  Employee_ID VARCHAR2(4) PRIMARY KEY,
  Employee_Name VARCHAR2(20),
  Position VARCHAR2(1),
  Salary NUMBER,
  Phone NUMBER(10),
  Email VARCHAR2(20),
  Address VARCHAR2(100),
  CONSTRAINT Position_CHK CHECK (Position IN ('M', 'W', 'C', 'B')),
  CONSTRAINT Salary_CHK CHECK (Salary >= 5000),
  CONSTRAINT Email_CHK CHECK (Email LIKE '%@%')
);

CREATE TABLE Seating (
  Table_ID VARCHAR2(4) PRIMARY KEY,
  Capacity NUMBER,
  Table_Feature VARCHAR2(20),
  Waiter_ID VARCHAR2(4),
  CONSTRAINT Seating_Waiter_FK FOREIGN KEY (Waiter_ID) REFERENCES Employee(Employee_ID),
  CONSTRAINT Capacity_CHK CHECK (Capacity > 0)
);

CREATE TABLE Table_Status (
  Table_ID VARCHAR2(4),
  Reservation_ID VARCHAR2(4),
  Status VARCHAR2(1),
  CONSTRAINT Table_FK FOREIGN KEY (Table_ID) REFERENCES Seating(Table_ID),
  CONSTRAINT Table_Status_Reservation_FK FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID),
  CONSTRAINT Status_CHK CHECK (Status IN ('R', 'U'))
);
