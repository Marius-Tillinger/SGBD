insert into Resorts (id_resort, name, location)
values (1, 'Grand Hotel București', 'Bulevardul Nicolae Bălcescu 4, București 010051')/
insert into Resorts (id_resort, name, location)
values (2, 'Hotel Trianon', 'Strada Grigore Cobălcescu 9, București 010191')/
insert into Resorts (id_resort, name, location)
values (3, 'Bucharest Downtown Inn', 'Calea Griviței 91, București 010705')/
insert into Resorts (id_resort, name, location)
values (4, 'Grand Pier Boutique Villa', 'Calea Șerban Vodă nr 22-24, sector 4, București 040201')/
insert into Resorts (id_resort, name, location)
values (5, 'Happy Accomodation', 'Strada Mihai Eminescu 72, București 020081')/


insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (1,1,'Eduardo','Dragomir', 'receptioner')/
insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (2,1,'Eric','Morosan', 'bodyguard')/
insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (3,2,'Cosmina','Duca', 'receptioner')/
insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (4,1,'Marius','Tillinger', 'chef')/
insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (5,1,'Liviu','Bouruc', 'bodyguard')/
insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (6,4,'Adrian','Leventiu', 'chef')/
insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (7,3,'David','Bejenariu', 'bodyguard')/
insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (8,5,'David','Patranjel', 'receptioner')/
insert into Staff (id_staff, resort_id, first_name, last_name, role)
values (9,2,'Diana','Muscalu', 'manager')/


insert into RoomTypes (id_rtype, description, amount, price)
VALUES  (1, 'penthouse', 10, 2000)/
insert into RoomTypes (id_rtype, description, amount, price)
VALUES  (2, 'apartament cu balcon', 10, 1500)/
insert into RoomTypes (id_rtype, description, amount, price)
VALUES  (3, 'apartament fara balcon', 10, 1000)/
insert into RoomTypes (id_rtype, description, amount, price)
VALUES  (4, 'camera single double bed', 10, 500)/
insert into RoomTypes (id_rtype, description, amount, price)
VALUES  (5, 'camera single one-person bed', 10, 100)/


insert into Rooms (id_room, resort_id, rtype_id)
VALUES (1,1,1)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (2,2,1)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (3,3,1)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (4,4,1)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (5,5,1)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (6,1,2)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (7,2,2)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (8,3,2)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (9,4,2)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (10,5,2)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (11,1,3)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (12,2,3)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (13,3,3)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (14,4,3)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (15,5,3)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (16,1,4)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (17,2,4)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (18,3,4)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (19,4,4)/
insert into Rooms (id_room, resort_id, rtype_id)
VALUES (20,5,4)/


insert into Clients (id_client, first_name, last_name, date_of_birth)
VALUES (1,'Marius','Dumitran',null)/
insert into Clients (id_client, first_name, last_name, date_of_birth)
VALUES (2,'Alexandru','Mihail',null)/
insert into Clients (id_client, first_name, last_name, date_of_birth)
VALUES (3,'Stefan','Popescu','10-10-1980')/
insert into Clients (id_client, first_name, last_name, date_of_birth)
VALUES (4,'Andrei','Paun','11-12-1990')/
insert into Clients (id_client, first_name, last_name, date_of_birth)
VALUES (5,'Cristian','Rusu',null)/


insert into Reservations (id_reservation, client_id)
VALUES (1,1)/
insert into Reservations (id_reservation, client_id)
VALUES (2,2)/
insert into Reservations (id_reservation, client_id)
VALUES (3,3)/
insert into Reservations (id_reservation, client_id)
VALUES (4,4)/
insert into Reservations (id_reservation, client_id)
VALUES (5,5)/
insert into Reservations (id_reservation, client_id)
VALUES (6,1)/
insert into Reservations (id_reservation, client_id)
VALUES (7,2)/
insert into Reservations (id_reservation, client_id)
VALUES (8,3)/
insert into Reservations (id_reservation, client_id)
VALUES (9,4)/
insert into Reservations (id_reservation, client_id)
VALUES (10,5)/
insert into Reservations (id_reservation, client_id)
VALUES (11,1)/
insert into Reservations (id_reservation, client_id)
VALUES (12,3)/



insert into Bills (id_invoice, reservation_id)
values (1,1);
insert into Bills (id_invoice, reservation_id)
values (2,2);
insert into Bills (id_invoice, reservation_id)
values (3,3);
insert into Bills (id_invoice, reservation_id)
values (4,4);
insert into Bills (id_invoice, reservation_id)
values (5,5);


insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (1,12,1,'01-06-2022','09-06-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (2,15,2,'01-07-2022','09-07-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (3,3,3,'01-08-2022','09-08-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (4,20,4,'01-09-2022','09-09-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (5,6,5,'01-06-2022','09-06-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (6,12,6,'01-07-2022','09-07-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (7,20,7,'01-12-2022','09-12-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (8,14,8,'23-11-2022','25-11-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (9,2,9,'10-10-2022','11-10-2022');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (10,7,10,'01-07-2023','09-07-2023');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (11,15,11,'01-06-2023','09-06-2023');
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (12,19,12,'01-06-2023','09-06-2023');
