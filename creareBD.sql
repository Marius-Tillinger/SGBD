CREATE TABLE Resorts (
  id_resort INT NOT NULL,
  name VARCHAR2(255) NOT NULL,
  location VARCHAR2(255) NOT NULL,
  constraint RESORTS_PK PRIMARY KEY (id_resort));

CREATE sequence RESORTS_ID_RESORT_SEQ;

CREATE trigger BI_RESORTS_ID_RESORT
 before insert on Resorts
 for each row
begin
 select RESORTS_ID_RESORT_SEQ.nextval into :NEW.id_resort from dual;
end;

/
CREATE TABLE Staff (
  id_staff INT NOT NULL,
  resort_id INT NOT NULL,
  first_name VARCHAR2(255) NOT NULL,
  last_name VARCHAR2(255) NOT NULL,
  role VARCHAR2(255) NOT NULL,
  constraint STAFF_PK PRIMARY KEY (id_staff));

CREATE sequence STAFF_ID_STAFF_SEQ;

CREATE trigger BI_STAFF_ID_STAFF
 before insert on Staff
 for each row
begin
 select STAFF_ID_STAFF_SEQ.nextval into :NEW.id_staff from dual;
end;

/
CREATE TABLE RoomTypes (
  id_rtype INT NOT NULL,
  description VARCHAR2(255) NOT NULL,
  amount INT NOT NULL,
  price INT NOT NULL,
  constraint ROOMTYPES_PK PRIMARY KEY (id_rtype));

CREATE sequence ROOMTYPES_ID_RTYPE_SEQ;

CREATE trigger BI_ROOMTYPES_ID_RTYPE
 before insert on RoomTypes
 for each row
begin
 select ROOMTYPES_ID_RTYPE_SEQ.nextval into :NEW.id_rtype from dual;
end;

/
CREATE TABLE Rooms (
  id_room INT NOT NULL,
  resort_id INT NOT NULL,
  rtype_id INT NOT NULL,
  constraint ROOMS_PK PRIMARY KEY (id_room));

CREATE sequence ROOMS_ID_ROOM_SEQ;

CREATE trigger BI_ROOMS_ID_ROOM
 before insert on Rooms
 for each row
begin
 select ROOMS_ID_ROOM_SEQ.nextval into :NEW.id_room from dual;
end;

/
CREATE TABLE Clients (
  id_client INT NOT NULL,
  first_name VARCHAR2(255) NOT NULL,
  last_name VARCHAR2(255) NOT NULL,
  date_of_birth DATE,
  constraint CLIENTS_PK PRIMARY KEY (id_client));

CREATE sequence CLIENTS_ID_CLIENT_SEQ;

CREATE trigger BI_CLIENTS_ID_CLIENT
 before insert on Clients
 for each row
begin
 select CLIENTS_ID_CLIENT_SEQ.nextval into :NEW.id_client from dual;
end;

/
CREATE TABLE Reservations (
  id_reservation INT NOT NULL,
  client_id INT NOT NULL,
  constraint RESERVATIONS_PK PRIMARY KEY (id_reservation));

CREATE sequence RESERVATIONS_ID_RESERVATION_SEQ;

CREATE trigger BI_RESERVATIONS_ID_RESERVATION
 before insert on Reservations
 for each row
begin
 select RESERVATIONS_ID_RESERVATION_SEQ.nextval into :NEW.id_reservation from dual;
end;

/
CREATE TABLE Bills (
  id_invoice INT NOT NULL,
  reservation_id INT NOT NULL,
  constraint BILLS_PK PRIMARY KEY (id_invoice));

CREATE sequence BILLS_ID_INVOICE_SEQ;

CREATE trigger BI_BILLS_ID_INVOICE
 before insert on Bills
 for each row
begin
 select BILLS_ID_INVOICE_SEQ.nextval into :NEW.id_invoice from dual;
end;

/
CREATE TABLE ReservedRoom (
  id_reservedroom INT NOT NULL,
  room_id INT NOT NULL,
  reservation_id INT NOT NULL,
  check_in DATE NOT NULL,
  check_out DATE NOT NULL,
  constraint RESERVEDROOM_PK PRIMARY KEY (id_reservedroom));

CREATE sequence RESERVEDROOM_ID_RESERVEDROOM_SEQ;

CREATE trigger BI_RESERVEDROOM_ID_RESERVEDROOM
 before insert on ReservedRoom
 for each row
begin
 select RESERVEDROOM_ID_RESERVEDROOM_SEQ.nextval into :NEW.id_reservedroom from dual;
end;

/

ALTER TABLE Staff ADD CONSTRAINT Staff_fk0 FOREIGN KEY (resort_id) REFERENCES Resorts(id_resort);


ALTER TABLE Rooms ADD CONSTRAINT Rooms_fk0 FOREIGN KEY (resort_id) REFERENCES Resorts(id_resort);
ALTER TABLE Rooms ADD CONSTRAINT Rooms_fk1 FOREIGN KEY (rtype_id) REFERENCES RoomTypes(id_rtype);


ALTER TABLE Reservations ADD CONSTRAINT Reservations_fk0 FOREIGN KEY (client_id) REFERENCES Clients(id_client);

ALTER TABLE Bills ADD CONSTRAINT Bills_fk0 FOREIGN KEY (reservation_id) REFERENCES Reservations(id_reservation);

ALTER TABLE ReservedRoom ADD CONSTRAINT ReservedRoom_fk0 FOREIGN KEY (room_id) REFERENCES Rooms(id_room);
ALTER TABLE ReservedRoom ADD CONSTRAINT ReservedRoom_fk1 FOREIGN KEY (reservation_id) REFERENCES Reservations(id_reservation);