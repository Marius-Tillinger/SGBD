
create or replace trigger tooMany before insert on employees
declare
    counter number;
    begin
        select count(e.employee_id)
        into counter
        from employees e
        join departments d on e.department_id = d.department_id;

        if counter > 45 then
            RAISE_APPLICATION_ERROR(-20500, 'not allowed to add any more values');
        end if;
    end;
