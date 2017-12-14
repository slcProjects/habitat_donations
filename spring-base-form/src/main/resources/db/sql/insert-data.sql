INSERT INTO User (LoginName, Password, FirstName, LastName, /*Gender,*/ Email, Phone, Address, City, Province, PostalCode, Role, Notify)
    VALUES ('user1', 'Pass1', 'Thing', '1', /*'M',*/ 'email1@gmail.com', '613-FAK-ENUM', 
		'address 1', 'Kingston', 'ON', 'K7M4H4', 'Staff', TRUE),
		   ('user2', 'Pass2', 'Thing', '2', /*'M',*/ 'email2@gmail.com', '613-FAK-ENUM', 
		'address 2', 'Kingston', 'ON', 'K7M4H4', 'Donor', TRUE),
		   ('user3', 'Pass3', 'Thing', '3', /*'F',*/ 'email3@gmail.com', '613-FAK-ENUM', 
		'address 3', 'Kingston', 'ON', 'K7M4H4', 'Donor', FALSE);
		
INSERT INTO Donation (DonorID, Description, Value, ScheduledDate, CompletedDate, Address, City, Province, PostalCode, DropFee, ReceiverID, Tacking, Receipts)
    VALUES (2, 'desc 1', 9999.99, '2017-09-14 8:00:00', '2017-09-14 8:00:00', 'address 2', 'Kingston', 'ON', 'K7M4H4', 500, 1, NULL, TRUE),
           (3, 'desc 2', 500, '2017-10-14 17:00:00', '2017-10-14 17:00:00', 'address 3', 'Kingston', 'ON', 'K7M4H4', 99, 1, NULL, FALSE),
           (2, 'desc 3', 100, '2017-10-14 17:00:00', NULL, 'address 2', 'Kingston', 'ON', 'K7M4H4', 0, NULL, NULL, FALSE),
           (3, 'desc 4', 0, '2017-09-14 8:00:00', '2017-09-14 8:30:00', 'different address', 'Kingston', 'ON', 'K7M4H4', 1000, 1, NULL, TRUE);
     
--INSERT INTO Attachment (DonationID, Image)
--	VALUES (1, LOAD_FILE('C:\tomcat\webapps\spring-base-form-initial_load\resources\images\testimg1.png')),
--		   (2, LOAD_FILE('C:\tomcat\webapps\spring-base-form-initial_load\resources\images\testimg2.png')),
--	       (3, LOAD_FILE('C:\tomcat\webapps\spring-base-form-initial_load\resources\images\testimg3.png')),
--	       (4, LOAD_FILE('C:\tomcat\webapps\spring-base-form-initial_load\resources\images\testimg4.png'));