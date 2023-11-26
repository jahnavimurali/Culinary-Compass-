INSERT INTO Ingredient  VALUES ('I001', 'Penne', 'Pasta', 1000)
INSERT INTO Ingredient  VALUES ('I002', 'Maida', 'Flour', 5000);
INSERT INTO Ingredient  VALUES ('I003', 'Chicken', 'Meat', 5000);
INSERT INTO Ingredient  VALUES ('I004', 'Bun', 'Bread', 2000);

INSERT INTO Food  VALUES ('F001', 'Chicken Pizza', 'Italian', 250.00);
INSERT INTO Food  VALUES ('F002', 'Burger', 'American', 150.00);
INSERT INTO Food  VALUES ('F003', 'Sushi', 'Japanese', 450.00);

INSERT INTO Food_Ingredient  VALUES ('F001', 'I002', 250);
INSERT INTO Food_Ingredient  VALUES ('F001', 'I003', 150);
INSERT INTO Food_Ingredient  VALUES ('F002', 'I003', 100);
INSERT INTO Food_Ingredient  VALUES ('F002', 'I004', 200);

INSERT INTO Customer VALUES ('C001', 'Mohith A', 1234567890, 'moth.adluru@rms.com');
INSERT INTO Customer VALUES ('C002', 'Jahnavi M', 9876543210, 'jahn.mur@gmail.com');
INSERT INTO Customer VALUES ('C003', 'Keerthan V S', 9786543210, 'keerthan@yahoo.in');

INSERT INTO Bill (Order_ID, Customer_ID) VALUES ('O001', 'C001');
INSERT INTO Bill (Order_ID, Customer_ID) VALUES ('O002', 'C002');

INSERT INTO Orders VALUES ('O001', 'F001', 2);
INSERT INTO Orders VALUES ('O001', 'F002', 2);

INSERT INTO Reservation VALUES ('R001', 'C001', '10-JUN-2023', '19:00', 4);
INSERT INTO Reservation VALUES ('R002', 'C002', '12-JUN-2023', '18:30', 2);
insert into Reservation values('R003', 'C002', '12-JUN-23', '19:30', 6);
insert into Reservation values('R004', 'C003', '13-JUN-23', '12:30', 8);
insert into Reservation values('R005', 'C001', '13-JUN-23', '14:30', 8);

INSERT INTO Employee VALUES ('E001', 'Harish Kumar', 'W', 6000, 9551327890, 'harish.kumar@rms.com', 'Adyar, Chennai');
insert into Employee values('E002', 'Senthil M.', 'W', 6000, 7893476589, NULL, 'Saidapet, Chennai');
insert into Employee values('E003', 'Joseph Kuruvila', 'W', 6000, 8894234593, 'joseph71@yahoo.in', 'Mylapore, Chennai');
insert into Employee values('E004', 'Selvi Sridhar', 'W', 6000, 9987654874, 'selvi31@gmail.com', 'Adyar, Chennai');

INSERT INTO Seating VALUES ('T001', 4, 'Window View', 'E001');
INSERT INTO Seating VALUES ('T002', 6, 'Outdoor Patio', 'E001');
insert into Seating values('T003', 8, 'Indoor', 'E002');
insert into Seating values('T004', 4, 'Outdoor Patio', 'E003');
insert into Seating values('T005', 2, 'Window View', 'E002');
insert into Seating values('T006', 2, 'Indoor', 'E004');
insert into Seating values('T007', 6, 'Indoor', 'E004');

INSERT INTO Table_Status VALUES ('T001', NULL, 'U');
INSERT INTO Table_Status VALUES ('T002', NULL, 'U');
insert into Table_Status values('T003', NULL, 'U');
insert into Table_Status values('T004', NULL, 'U');
insert into Table_Status values('T005', NULL, 'U');
insert into Table_Status values('T006', NULL, 'U');
insert into Table_Status values('T007', NULL, 'U');

