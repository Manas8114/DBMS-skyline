// Create Airplane_type collection
db.createCollection("Airplane_type");

// Insert documents into Airplane_type collection
db.Airplane_type.insertMany([
    { A_ID: 738, Capacity: 853, A_weight: 394, Company: "Indigo" },
    { A_ID: 777, Capacity: 800, A_weight: 380, Company: "Vistara" },
    { A_ID: 750, Capacity: 790, A_weight: 364, Company: "AirIndia" },
    { A_ID: 790, Capacity: 850, A_weight: 390, Company: "SpiceJet" },
    { A_ID: 745, Capacity: 770, A_weight: 405, Company: "GoAir" },
    { A_ID: 768, Capacity: 867, A_weight: 387, Company: "AirAsia" },
    { A_ID: 821, Capacity: 790, A_weight: 355, Company: "TruJet" },
    { A_ID: 785, Capacity: 835, A_weight: 410, Company: "Alliance Air" }
]);

// Create Route collection
db.createCollection("Route");

// Insert documents into Route collection
db.Route.insertMany([
    { Route_ID: 168806, Take_Off_point: "London", Destination: "Delhi", R_type: "Direct" },
    { Route_ID: 157306, Take_Off_point: "NewJersey", Destination: "Mumbai", R_type: "2Hr Break" },
    { Route_ID: 178916, Take_Off_point: "Washington", Destination: "Jodhpur", R_type: "3Hr Break" },
    { Route_ID: 324567, Take_Off_point: "Chennai", Destination: "Denmark", R_type: "Direct" },
    { Route_ID: 452368, Take_Off_point: "Chandigard", Destination: "NewYork", R_type: "3Hr Break" },
    { Route_ID: 894521, Take_Off_point: "Daman", Destination: "Delhi", R_type: "Direct" },
    { Route_ID: 578425, Take_Off_point: "Beijing", Destination: "Punjab", R_type: "Direct" },
    { Route_ID: 421523, Take_Off_point: "Hyderabad", Destination: "Jammu & Kashmir", R_type: "Direct" }
]);

// Create Flight collection
db.createCollection("Flight");

// Insert documents into Flight collection
db.Flight.insertMany([
    { Flight_ID: "AI2014", Departure: new Date("2021-01-12T08:45:00"), Arrival: new Date("2021-01-12T22:25:00"), Flight_date: new Date("2021-01-12"), A_ID: 738 },
    { Flight_ID: "QR2305", Departure: new Date("2020-12-26T12:05:00"), Arrival: new Date("2020-12-27T12:25:00"), Flight_date: new Date("2020-12-26"), A_ID: 777 },
    { Flight_ID: "EY1234", Departure: new Date("2021-02-10T05:00:00"), Arrival: new Date("2021-02-10T22:30:00"), Flight_date: new Date("2021-02-10"), A_ID: 750 },
    { Flight_ID: "LH9876", Departure: new Date("2021-02-25T10:15:00"), Arrival: new Date("2021-02-25T23:00:00"), Flight_date: new Date("2021-02-25"), A_ID: 790 },
    { Flight_ID: "BA1689", Departure: new Date("2021-03-02T02:15:00"), Arrival: new Date("2021-03-02T22:00:00"), Flight_date: new Date("2021-03-02"), A_ID: 745 },
    { Flight_ID: "AA4367", Departure: new Date("2021-03-25T00:05:00"), Arrival: new Date("2021-03-25T02:15:00"), Flight_date: new Date("2021-03-25"), A_ID: 768 },
    { Flight_ID: "CT7812", Departure: new Date("2021-04-04T14:15:00"), Arrival: new Date("2021-04-04T20:00:00"), Flight_date: new Date("2021-04-04"), A_ID: 821 },
    { Flight_ID: "PF4521", Departure: new Date("2020-12-25T17:00:00"), Arrival: new Date("2020-12-25T22:30:00"), Flight_date: new Date("2020-12-25"), A_ID: 785 }
]);

// Create AirFare collection
db.createCollection("AirFare");

// Insert documents into AirFare collection
db.AirFare.insertMany([
    { Fare_ID: 1, Charge_Amount: 27341, Description: "Standard Single", Flight_ID: "AI2014" },
    { Fare_ID: 4, Charge_Amount: 34837, Description: "Standard Return", Flight_ID: "QR2305" },
    { Fare_ID: 2, Charge_Amount: 42176, Description: "Key Fare Single", Flight_ID: "EY1234" },
    { Fare_ID: 3, Charge_Amount: 27373, Description: "Business Return", Flight_ID: "LH9876" },
    { Fare_ID: 6, Charge_Amount: 44592, Description: "Advanced Purchase", Flight_ID: "BA1689" },
    { Fare_ID: 5, Charge_Amount: 8777, Description: "Superpex Return", Flight_ID: "AA4367" },
    { Fare_ID: 7, Charge_Amount: 9578, Description: "Standard Return", Flight_ID: "CT7812" },
    { Fare_ID: 8, Charge_Amount: 4459, Description: "Superpex Return", Flight_ID: "PF4521" }
]);

// Create Passengers collection
db.createCollection("Passengers");

// Insert documents into Passengers collection
db.Passengers.insertMany([
    { Ps_ID: 1, Ps_Name: "Steve Smith", Address: "2230 Northside, Apt 11, London", Age: 30, Sex: "M", Contacts: "8080367290", Flight_ID: "AI2014" },
    { Ps_ID: 2, Ps_Name: "Ankita Ahir", Address: "3456 Vikas Apts, Apt 102, New Jersey", Age: 26, Sex: "F", Contacts: "8080367280", Flight_ID: "QR2305" },
    // Insert other documents here...
]);

// Create Countries collection
db.createCollection("Countries");

// Insert documents into Countries collection
db.Countries.insertMany([
    { Country_code: 44, Country_Name: "England" },
    { Country_code: 1, Country_Name: "USA" },
    // Insert other documents here...
]);

// Create Airport collection
db.createCollection("Airport");

// Insert documents into Airport collection
db.Airport.insertMany([
    { Air_code: "DEL", Air_Name: "Indira Gandhi International Airport", City: "Delhi", State: "UP", Country_code: 91 },
    { Air_code: "BOM", Air_Name: "Chhatrapati Shivaji Maharaj International Airport", City: "Mumbai", State: "Maharashtra", Country_code: 91 },
    // Insert other documents here...
]);

// Create Employees collection
db.createCollection("Employees");

// Insert documents into Employees collection
db.Employees.insertMany([
    { Emp_ID: 1234, E_Name: "Rekha Tiwary", Address: "202-Meeta Apt, Yogi Nagar, Mumbai", Age: 30, Email_ID: "rekha1234@gmail.com", Contact: "+918530324018", Air_code: "DEL" },
    { Emp_ID: 3246, E_Name: "John Dsouza", Address: "302-Fountain Apt, ElizaBeth Street, Newham", Age: 26, Email_ID: "john2346@gmail.com", Contact: "+447911123456", Air_code: "BOM" },
    // Insert other documents here...
]);

// Create Can_Land collection
db.createCollection("Can_Land");

// Insert documents into Can_Land collection
db.Can_Land.insertMany([
    { Air_code: "DEL", Flight_ID: "AI2014" },
    { Air_code: "BOM", Flight_ID: "QR2305" },
    // Insert other documents here...
]);

// Create Transactions collection
db.createCollection("Transactions");

// Insert documents into Transactions collection
db.Transactions.insertMany([
    { TS_ID: 12345678, Booking_Date: new Date("2021-02-21"), Departure_Date: new Date("2021-02-22"), TS_Type: "Google Pay", Emp_ID: 1234, Ps_ID: 1, Flight_ID: "AI2014", Charge_Amount: 27341 },
    { TS_ID: 45612789, Booking_Date: new Date("2021-01-12"), Departure_Date: new Date("2021-01-14"), TS_Type: "Credit Card", Emp_ID: 3246, Ps_ID: 2, Flight_ID: "QR2305", Charge_Amount: 34837 },
    // Insert other documents here...
]);

// Create Travels_on collection
db.createCollection("Travels_on");

// Insert documents into Travels_on collection
db.Travels_on.insertMany([
    { Route_ID: 168806, Flight_ID: "AI2014" },
    { Route_ID: 157306, Flight_ID: "QR2305" },
    // Insert other documents here...
]);

// Queries
db.Airplane_type.find();
db.Route.find();
db.Flight.find();
db.AirFare.find();
db.Passengers.find();
db.Countries.find();
db.Airport.find();
db.Employees.find();
db.Can_Land.find();
db.Transactions.find();
db.Travels_on.find();
