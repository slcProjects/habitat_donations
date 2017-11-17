INSERT INTO User (LoginName, Password, FirstName, LastName, Gender, Email, Phone, Address, City, Province, PostalCode, Role, Notify)
    VALUES ('user1', 'Pass1', 'Thing', '1', 'M', 'email1', '613-FAK-ENUM', 
		'address 1', 'Kingston', 'ON', 'K7M4H4', 'Staff', TRUE),
		   ('user2', 'Pass2', 'Thing', '2', 'M', 'email2', '613-FAK-ENUM', 
		'address 2', 'Kingston', 'ON', 'K7M4H4', 'Donor', TRUE),
		   ('user3', 'Pass3', 'Thing', '3', 'F', 'email3', '613-FAK-ENUM', 
		'address 3', 'Kingston', 'ON', 'K7M4H4', 'Donor', FALSE);
		
INSERT INTO Donation (DonorID, Description, Value, ScheduledDate, CompletedDate, DropFee, ReceiverID, Tacking)
    VALUES (2, 'desc 1', 9999.99, '2017-09-14 8:00:00', '2017-09-14 8:00:00', 500, 1, NULL),
           (3, 'desc 2', 500, '2017-10-14 17:00:00', '2017-10-14 17:00:00', 99, 1, NULL),
           (2, 'desc 3', 100, '2017-10-14 17:00:00', NULL, 0, NULL, NULL),
           (3, 'desc 4', 0, '2017-09-14 8:00:00', '2017-09-14 8:30:00', 1000, 1, NULL);