--This SQl script will be automatically executed after the tables are auto-generated.
--Note that each SQL should be separated by a ';'.
insert into Artists(artistid, firstname, lastname, address, city, state, postalcode, email, phone, fax, thepassword)
values(1, 'Aiden', 'Donolan', '352 Corporate Ave.', 'Denver', 'CO', '80206-4526', 'aiden.donolan@donolan.com', '555-751-8464', '555-751-8463', 'peapod');
insert into Artists(artistid, firstname, lastname, address, city, state, postalcode, email, phone, fax, thepassword)
values(2, 'Austin', 'Weber', '25463 Main Street, Suite C', 'Berkeley', 'CA', '94707-4513', 'austin@life.com', '555-513-4318', '510-513-4888', 'nopolyes');
insert into Art(artname, price, largeimage, mediaid, issold, artistid)
values('Michael', 13900, 'aiden02.jpg', 1, 0, 1);
insert into Art(artname, price, largeimage, mediaid, issold, artistid)
values('Space', 9800, 'elecia01.jpg', 2, 1, 2);