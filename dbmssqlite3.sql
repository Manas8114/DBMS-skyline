import sqlite3

connection = sqlite3.connect('dbms.db')

# Create a cursor object
cursor = connection.cursor()

# Execute SQL commands using a multiline string
sql_commands = '''
CREATE TABLE Airplane_type(
   A_ID INTEGER PRIMARY KEY,
   Capacity INTEGER,
   A_weight INTEGER,
   Company TEXT
);

CREATE TABLE Route(
    Route_ID INTEGER PRIMARY KEY,
    Take_Off_point TEXT,
    Destination TEXT,
    R_type TEXT
);

CREATE TABLE Flight(
    Flight_ID TEXT PRIMARY KEY,
    Departure TEXT,
    Arrival TEXT,
    Flight_date DATE,
    A_ID INTEGER,
    FOREIGN KEY (A_ID) REFERENCES Airplane_type(A_ID)
);

CREATE TABLE AirFare(
    Fare_ID INTEGER PRIMARY KEY,
    Charge_Amount INTEGER,
    Description TEXT,
    Flight_ID TEXT,
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
); 

CREATE TABLE Passengers(
    Ps_ID INTEGER PRIMARY KEY,
    Ps_Name TEXT,
    Address TEXT,
    Age INTEGER,
    Sex TEXT,
    Contacts TEXT,
    Flight_ID TEXT,
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
); 

CREATE TABLE Countries(
    Country_code INTEGER PRIMARY KEY,
    Country_Name TEXT
);

CREATE TABLE Airport(
    Air_code TEXT PRIMARY KEY,
    Air_Name TEXT,
    City TEXT,
    State TEXT,
    Country_code INTEGER,
    FOREIGN KEY (Country_code) REFERENCES Countries(Country_code) 
); 

CREATE TABLE Employees(
    Emp_ID INTEGER PRIMARY KEY,
    E_Name TEXT,
    Address TEXT,
    Age INTEGER,
    Email_ID TEXT,
    Contact TEXT,
    Air_code TEXT,
    FOREIGN KEY (Air_code) REFERENCES Airport(Air_code) 
); 

CREATE TABLE Can_Land(
    Air_code TEXT,
    Flight_ID TEXT,
    PRIMARY KEY(Air_code,Flight_ID),
    FOREIGN KEY(Air_code) REFERENCES Airport(Air_code),
    FOREIGN KEY(Flight_ID) REFERENCES Flight(Flight_ID)
);

CREATE TABLE Transactions(
    TS_ID INTEGER PRIMARY KEY,
    Booking_Date DATE,
    Departure_Date DATE,
    TS_Type TEXT,
    Emp_ID INTEGER,
    Ps_ID INTEGER,
    Flight_ID TEXT,
    Charge_Amount INTEGER,
    FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID) ,
    FOREIGN KEY (Ps_ID) REFERENCES Passengers(Ps_ID),
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID), 
    FOREIGN KEY (Charge_Amount) REFERENCES AirFare(Fare_ID) 
);

CREATE TABLE Travels_on(
    Route_ID INTEGER,
    Flight_ID TEXT,
    PRIMARY KEY(Route_ID,Flight_ID),
    FOREIGN KEY(Route_ID) REFERENCES Route(Route_ID),
    FOREIGN KEY(Flight_ID) REFERENCES Flight(Flight_ID)
);

INSERT INTO Airplane_type VALUES (738, 853, 394, 'Indigo');
INSERT INTO Airplane_type VALUES (777, 800, 380, 'Vistara');
INSERT INTO Airplane_type VALUES (750, 790, 364, 'AirIndia');
INSERT INTO Airplane_type VALUES (790, 850, 390, 'SpiceJet');
INSERT INTO Airplane_type VALUES (745, 770, 405, 'GoAir');
INSERT INTO Airplane_type VALUES (768, 867, 387, 'AirAsia');
INSERT INTO Airplane_type VALUES (821, 790, 355, 'TruJet');
INSERT INTO Airplane_type VALUES (785, 835, 410, 'Alliance Air');

INSERT INTO Route VALUES (168806, 'London', 'Delhi', 'Direct');
INSERT INTO Route VALUES (157306, 'NewJersey', 'Mumbai', '2Hr Break');
INSERT INTO Route VALUES (178916, 'Washington', 'Jodhpur', '3Hr Break');
INSERT INTO Route VALUES (324567, 'Chennai', 'Denmark', 'Direct');
INSERT INTO Route VALUES (452368, 'Chandigard', 'NewYork', '3Hr Break');
INSERT INTO Route VALUES (894521, 'Daman', 'Delhi', 'Direct');
INSERT INTO Route VALUES (578425, 'Beijing', 'Punjab', 'Direct');
INSERT INTO Route VALUES (421523, 'Hyderabad', 'Jammu & Kashmir', 'Direct');

INSERT INTO Flight VALUES ('AI2014', '2021-01-12 08:45', '2021-01-12 22:25', '2021-01-12', 738);
INSERT INTO Flight VALUES ('QR2305', '2020-12-26 12:05', '2020-12-27 12:25', '2020-12-26', 777);
INSERT INTO Flight VALUES ('EY1234', '2021-02-10 05:00', '2021-02-10 22:30', '2021-02-10', 750);
INSERT INTO Flight VALUES ('LH9876', '2021-02-25 10:15', '2021-02-25 23:00', '2021-02-25', 790);
INSERT INTO Flight VALUES ('BA1689', '2021-03-02 02:15', '2021-03-02 22:00', '2021-03-02', 745);
INSERT INTO Flight VALUES ('AA4367', '2021-03-25 00:05', '2021-03-25 02:15', '2021-03-25', 768);
INSERT INTO Flight VALUES ('CT7812', '2021-04-04 14:15', '2021-04-04 20:00', '2021-04-04', 821);
INSERT INTO Flight VALUES ('PF4521', '2020-12-25 17:00', '2020-12-25 22:30', '2020-12-25', 785);

INSERT INTO AirFare VALUES (1, 27341, 'Standard Single', 'AI2014');
INSERT INTO AirFare VALUES (4, 34837, 'Standard Return', 'QR2305');
INSERT INTO AirFare VALUES (2, 42176, 'Key Fare Single', 'EY1234');
INSERT INTO AirFare VALUES (3, 27373, 'Business Return', 'LH9876');
INSERT INTO AirFare VALUES (6, 44592, 'Advanced Purchase', 'BA1689');
INSERT INTO AirFare VALUES (5, 8777, 'Superpex Return', 'AA4367');
INSERT INTO AirFare VALUES (7, 9578, 'Standard Return', 'CT7812');
INSERT INTO AirFare VALUES (8, 4459, 'Superpex Return', 'PF4521');

INSERT INTO Passengers VALUES (1, 'Steve Smith', '2230 Northside,Apt 11,London', 30, 'M', '8080367290', 'AI2014');
INSERT INTO Passengers VALUES (2, 'Ankita Ahir', '3456 Vikas Apts,Apt 102,New Jersey', 26, 'F', '8080367280', 'QR2305');
INSERT INTO Passengers VALUES (4, 'Akhilesh Joshi', '345 Chatam courts,Apt 678,Chennai', 29, 'M', '9080369290', 'EY1234');
INSERT INTO Passengers VALUES (3, 'Khyati Mishra', '7820 Mccallum courts,Apt 234,Washington', 30, 'F', '8082267280', 'LH9876');
INSERT INTO Passengers VALUES (5, 'Rom Solanki', '1234 Baker Apts,Apt 208,Chandigard', 60, 'M', '9004568903', 'EY1234');
INSERT INTO Passengers VALUES (6, 'Lakshmi Sharma', '1110 Fir hills,Apt 90,Daman', 30, 'F', '7666190505', 'AA4367');
INSERT INTO Passengers VALUES (8, 'Manan Lakhani', '7720 Mccallum Blvd,Apt 77,Beijing', 45, 'M', '8124579635', 'CT7812');
INSERT INTO Passengers VALUES (7, 'Ria Gupta', 'B-402,Aditya Apt,Hyderabad', 34, 'F', '9819414036', 'EY1234');

INSERT INTO Countries VALUES (44, 'England');
INSERT INTO Countries VALUES (1, 'USA');
INSERT INTO Countries VALUES (91, 'India');
INSERT INTO Countries VALUES (45, 'Kingdom of Denmark');
INSERT INTO Countries VALUES (64, 'New Zealand');
INSERT INTO Countries VALUES (971, 'UAE');
INSERT INTO Countries VALUES (213, 'Algeria');
INSERT INTO Countries VALUES (55, 'Brazil');

INSERT INTO Airport VALUES ('DEL', 'Indira Gandhi International Airport', 'Delhi', 'UP', 91);
INSERT INTO Airport VALUES ('BOM', 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'Maharashtra', 91);
INSERT INTO Airport VALUES ('LCY', 'London City Airport', 'Newham', 'London', 44);
INSERT INTO Airport VALUES ('EWR', 'Newark Liberty International Airport', 'Newark', 'New Jersey', 1);
INSERT INTO Airport VALUES ('JFK', 'John F.Kennnedy International Airport', 'New York City', 'New York', 1);
INSERT INTO Airport VALUES ('CPH', 'Copenhagen Airport', 'Copenhagen', 'Denmark', 45);
INSERT INTO Airport VALUES ('AIP', 'Adampur Airport', 'Jalandhar', 'Punjab', 91);
INSERT INTO Airport VALUES ('IXJ', 'Satwari Airport', 'Jammu', 'Jammu & Kashmir', 91);

INSERT INTO Employees VALUES (1234, 'Rekha Tiwary', '202-Meeta Apt,Yogi Nagar,Mumbai', 30, 'rekha1234@gmail.com', '+918530324018', 'DEL');
INSERT INTO Employees VALUES (3246, 'John Dsouza', '302-Fountain Apt,ElizaBeth Street, Newham', 26, 'john2346@gmail.com', '+447911123456', 'BOM');
INSERT INTO Employees VALUES (9321, 'Sanjay Rathod', '62-Patwa Apt,Pradeep Nagar, Delhi', 36, 'sanjay78@gmail.com', '+917504681201', 'LCY');
INSERT INTO Employees VALUES (8512, 'Hafsa Iqmar', '1023-Prajwal Apt,Newark', 41, 'hafsa964@gmail.com', '6465554468', 'EWR');
INSERT INTO Employees VALUES (7512, 'Akshay Sharma', 'Akshay Villa,Queens Street,Copenhagen', 20, 'akshay27@gmail.com', '+45886443210', 'JFK');
INSERT INTO Employees VALUES (5123, 'Lara Jen', '28-Mark road,Victoria street,New York City', 31, 'jenlara4@gmail.com', '+448000751234', 'CPH');
INSERT INTO Employees VALUES (2458, 'Johny Paul', '45-Balaji Apt,Ajit Nagar,Jalandar', 32, 'johnypaul8@gmail.com', '+919785425154', 'AIP');
INSERT INTO Employees VALUES (4521, 'Nidhi Maroliya', '6-Matruchaya Apt,Park Road, Jammu', 31, 'nidhi785@gmail.com', '+918211954901', 'IXJ');

INSERT INTO Can_Land VALUES ('DEL', 'AI2014');
INSERT INTO Can_Land VALUES ('BOM', 'QR2305');
INSERT INTO Can_Land VALUES ('LCY', 'EY1234');
INSERT INTO Can_Land VALUES ('EWR', 'LH9876');
INSERT INTO Can_Land VALUES ('JFK', 'BA1689');
INSERT INTO Can_Land VALUES ('CPH', 'AA4367');
INSERT INTO Can_Land VALUES ('AIP', 'CT7812');
INSERT INTO Can_Land VALUES ('IXJ', 'PF4521');

INSERT INTO Transactions VALUES (12345678, '2021-02-21', '2021-02-22', 'Google Pay', 1234, 1, 'AI2014', 27341);
INSERT INTO Transactions VALUES (45612789, '2021-01-12', '2021-01-14', 'Credit Card', 3246, 2, 'QR2305', 34837);
INSERT INTO Transactions VALUES (56987123, '2020-12-05', '2020-12-02', 'Paytm', 9321, 4, 'EY1234', 42176);
INSERT INTO Transactions VALUES (45321879, '2021-03-15', '2021-03-16', 'PhonePe', 8512, 3, 'LH9876', 27373);
INSERT INTO Transactions VALUES (75145863, '2021-04-22', '2021-04-25', 'Paytm', 7512, 5, 'EY1234', 44592);
INSERT INTO Transactions VALUES (17892455, '2021-02-05', '2021-02-08', 'Paytm', 5123, 6, 'AA4367', 8777);
INSERT INTO Transactions VALUES (24517852, '2021-03-06', '2021-03-08', 'PhonePe', 2458, 8, 'CT7812', 9578);
INSERT INTO Transactions VALUES (32548525, '2021-01-20', '2021-01-25', 'Credit Card', 4521, 7, 'EY1234', 4459);

INSERT INTO Travels_on VALUES (168806, 'AI2014');
INSERT INTO Travels_on VALUES (157306, 'QR2305');
INSERT INTO Travels_on VALUES (178916, 'EY1234');
INSERT INTO Travels_on VALUES (324567, 'LH9876');
INSERT INTO Travels_on VALUES (452368, 'BA1689');
INSERT INTO Travels_on VALUES (894521, 'AA4367');
INSERT INTO Travels_on VALUES (578425, 'CT7812');
INSERT INTO Travels_on VALUES (421523, 'PF4521');
'''

cursor.executescript(sql_commands)

# Commit the changes
connection.commit()

# Close the connection
connection.close()