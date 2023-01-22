create or replace procedure ex 
as 
    cursor c is 
        select department_name, zi, nr_ang
        from departments 
        left join ( 
            select department_id, to_char(hire_date, 'D') zi, count(*) nr_ang
            from employees e
            group by department_id, to_char(hire_date, 'D')
            having count(*) = ( 
                select max(count(*))
                from employees
                group by employees.department_id, to_char(hire_date, 'D')
                having department_id = e.department_id )
        ) using (department_id);
begin
    for linie in c loop
        if linie.zi is null then
            dbms_output.put_line('In departamentul ' || linie.department_name || ' nu lucreaza niciun angajat');
        else
            dbms_output.put_line('In departamentul ' || linie.department_name || ', cele mai multe angajari au avut loc in ziua ' || linie.zi || ' a saptamanii, in numar de ' || linie.nr_ang || ', dupa cum urmeaza: ');
            for angajat in (
                select first_name || ' ' || last_name nume, round(sysdate - hire_date) vechime, salary * (1 + nvl(commission_pct, 0)) venit
                from employees 
                join departments 
                using (department_id)
                where department_name = linie.department_name and to_char(hire_date, 'D') = linie.zi)
      loop
        dbms_output.put_line(angajat.nume || ' ' || angajat.vechime || ' ' || angajat.venit);
     end loop;
                             
        end if;
    end loop;
end ex;

begin
    ex();
end;
