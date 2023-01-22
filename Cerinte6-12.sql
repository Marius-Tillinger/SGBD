
create or replace procedure ex6(roletype STAFF.role%type)
as
    type tab_index is table of Staff%rowtype index by pls_integer;
    t tab_index;
    type tab_nest is table of VARCHAR2(255);
    tt tab_nest := tab_nest();

    begin
        select * bulk collect into t
        from STAFF
        where ROLE = roletype;

        for i in t.first..t.last loop
            tt.extend();
            tt(i) := ('are numele de ' || t(i).FIRST_NAME || ' ' || t(i).LAST_NAME);
            DBMS_OUTPUT.PUT_LINE(tt(i));
        end loop;
    end;

begin
    ex6('bodyguard');
end;

create or replace procedure ex7
as
    v_numar number(4);
    v_role Staff.role%type;

    cursor c is
        select role, count(ID_STAFF)
        from STAFF
        group by role;

    cursor cc (parameter NUMBER) is
        select role
        from staff
        group by role
        having count(ID_STAFF) > parameter;
    begin
        OPEN c;
        LOOP
        	FETCH c INTO v_role, v_numar;
        	EXIT WHEN c%NOTFOUND;

        	IF v_numar = 0 THEN
        	    DBMS_OUTPUT.PUT_LINE('numarul de  ' || v_role || ' este 0');
        	ELSIF v_numar = 1 THEN
        	    DBMS_OUTPUT.PUT_LINE('numarul de ' || v_role || ' este de 1');
        	ELSE
        	    DBMS_OUTPUT.PUT_LINE('numarul de ' || v_role || ' este '|| v_numar);
            END IF;
        END LOOP;
        CLOSE c;

        for i in cc(2) loop
            DBMS_OUTPUT.PUT_LINE(i.ROLE || ' este un rol cu mai mult de 2 angajati');
            end loop;
    end;

begin
    ex7();
end;

create or replace function ex8(parameter date) return number
is
    bad_date exception;
    no_data exception;
    valreturn number;
    begin
        if (parameter < '01-01-2022') then
            raise bad_date;
        end if;

        select count(ID_CLIENT)
        into valreturn
        from CLIENTS
        join RESERVATIONS R on CLIENTS.ID_CLIENT = R.CLIENT_ID
        join RESERVEDROOM R2 on R.ID_RESERVATION = R2.RESERVATION_ID
        where CHECK_IN > parameter;

        if (valreturn > 0) then return valreturn;
        else raise no_data;
        end if;
    exception
        when bad_date then
            DBMS_OUTPUT.PUT_LINE('nu e buna data');
            return -1;
        when no_data then
            DBMS_OUTPUT.PUT_LINE('nu avem date despre cautarea aceasta');
            return -1;
    end;

select ex8('01-01-2021') from DUAL;
select EX8('01-01-2024') from dual;
select ex8('01-01-2022') from dual;


create or replace procedure ex9
as
    valfinal number;
    begin
        select count(ID_CLIENT)
        into valfinal
        from CLIENTS
        join RESERVATIONS R on CLIENTS.ID_CLIENT = R.CLIENT_ID
        join RESERVEDROOM R2 on R.ID_RESERVATION = R2.RESERVATION_ID
        join ROOMS R3 on R3.ID_ROOM = R2.ROOM_ID
        join RESORTS R4 on R4.ID_RESORT = R3.RESORT_ID
        where CHECK_OUT < '01-01-2023' and (R4.NAME = 'Grand Hotel București' or R4.NAME = 'Hotel Trianon' or r4.NAME = 'Happy Accomodation');

        if valfinal > 0 then
            DBMS_OUTPUT.PUT_LINE('exista ' || valfinal || ' clienti care au facut check-out inainte de 1 ianuarie 2023 la Grand Hotel, Trianon sau Happy Accomodation');
        else
            raise NO_DATA_FOUND;
        end if;

        if valfinal > 10 then
            raise TOO_MANY_ROWS;
        end if;

        exception
            when NO_DATA_FOUND then
            RAISE_APPLICATION_ERROR(-20500, 'error, check again');
            when TOO_MANY_ROWS then
            RAISE_APPLICATION_ERROR(-20500, 'error, check one more time');
    end;

begin
    ex9();
end;

create or replace trigger toomanyClients before insert on CLIENTS
declare
    totalClients number;
    begin
        select count(ID_CLIENT)
        into totalClients
        from CLIENTS;

        if totalClients > 7 then
            RAISE_APPLICATION_ERROR(-20500, 'not allowed to add any more values');
        end if;
    end;

BEGIN
 FOR i in 1 .. 11 LOOP
    insert into CLIENTS values (5+i, 'Clientnume', 'clientnume',NULL);
 END LOOP;
END;

create or replace trigger ex11 after insert on RESERVEDROOM for each row
declare
    begin
        if (to_date(:NEW.CHECK_IN, 'dd-mm-yyyy') >= '01-01-3000') or (to_date(:NEW.CHECK_OUT, 'dd-mm-yyyy') <= '01-01-1900') then
            RAISE_APPLICATION_ERROR(-20500, 'nu se mai pot adauga alte valori');
        end if;
    end;

--valoare gresita
insert into ReservedRoom (id_reservedroom, room_id, reservation_id, check_in, check_out)
values (1000,12,5,'01-06-4000','09-06-2022');


create or replace trigger ex12 after create or alter or drop on schema
declare
    begin
        DBMS_OUTPUT.PUT_LINE('utilizatorul cu datele: ' || sys.LOGIN_USER() || ' a facut o modificare in baza de date la ora si data ' || systimestamp);
    end;

create table tableex12 (
    id number
);
alter table tableex12 add nume varchar2(255);

drop table tableex12;


--cerinta custom

--selectati tipul de camera cu cele mai multe rezervari

select *
from
    (
        select (count(RTYPE_ID)), DESCRIPTION
        from rooms
        join RESERVEDROOM R on ROOMS.ID_ROOM = R.ROOM_ID
        join ROOMTYPES R2 on ROOMS.RTYPE_ID = R2.ID_RTYPE
        group by DESCRIPTION
        order by count(RTYPE_ID) desc
    )
where ROWNUM=1
