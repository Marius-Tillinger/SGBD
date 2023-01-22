declare 
    type jobtypes is table of jobs.job_id%type;
    jobtitle jobs.job_title%type;
    fname employees.first_name%type;
    lname employees.last_name%type;
    salariu employees.salary%type;
    nr_jobs number;
    joburi jobtypes := jobtypes();
    nr_emp number;
    counter number;
    counter_total number := 0;
    total_job_salary number(8,2);
    average_job_salary number(8,2);
    total_salary number(10,2) := 0;
    average_salary number(10,2) := 0;
    comission_procentage number := 0;
    total_comission number(10,2) := 0;
    cursor c (curr_job jobs.job_id%type)is 
        select e.last_name, e.first_name, e.salary, e.commission_pct
        from employees e, jobs j
        where j.job_id = e.job_id and
                j.job_id = curr_job
        order by e.salary desc; 
begin  
    
    select count(*) into nr_jobs from jobs;
    joburi.extend(nr_jobs);
    select j.job_id bulk collect into joburi from jobs j;
    
    for i in joburi.first..joburi.last loop   
        counter := 0;
        select job_title
        into jobtitle
        from jobs j
        where j.job_id = joburi(i); 
        
        select count(*)
        into nr_emp
        from employees e, jobs j
        where e.job_id = j.job_id and
            j.job_id = joburi(i);

        if nr_emp < 5 then
            dbms_output.put_line('Lucreaza mai putin de 5 angajati ca  ' || jobtitle);
        else
            dbms_output.put_line(jobtitle);
        end if;
        
        open c(joburi(i));
        loop
            fetch c into fname, lname, salariu, comission_procentage;
            exit when c%notfound or c%rowcount > 5;
            dbms_output.put_line(counter + 1 || ' ' || fname || ' ' || lname || ' ' || salariu);
            counter := counter + 1;
        end loop;
        close c;
         
        dbms_output.new_line();
    end loop;
end;
/


declare 
    type jobtypes is table of jobs.job_id%type;
    jobtitle jobs.job_title%type;
    fname employees.first_name%type;
    lname employees.last_name%type;
    salariu employees.salary%type;
    emp_sal employees.salary%type;
    nr_jobs number;
    joburi jobtypes := jobtypes();
    nr_emp number;
    counter number;
    counter_total number := 0;
    total_job_salary number(8,2);
    average_job_salary number(8,2);
    total_salary number(10,2) := 0;
    average_salary number(10,2) := 0;
    comission_procentage number := 0;
    total_comission number(10,2) := 0;
    cursor c (curr_job jobs.job_id%type)is 
        select e.last_name, e.first_name, e.salary, e.commission_pct
        from employees e, jobs j
        where j.job_id = e.job_id and
                j.job_id = curr_job
        order by e.salary desc; 
begin  
    
    select count(*) into nr_jobs from jobs;
    joburi.extend(nr_jobs);
    select j.job_id bulk collect into joburi from jobs j;
    
    for i in joburi.first..joburi.last loop   
        emp_sal := 0;
        counter := 0;
        select job_title
        into jobtitle
        from jobs j
        where j.job_id = joburi(i); 
        
        select count(*)
        into nr_emp
        from employees e, jobs j
        where e.job_id = j.job_id and
            j.job_id = joburi(i);

        if nr_emp < 5 then
            dbms_output.put_line('Lucreaza mai putin de 5 angajati ca  ' || jobtitle);
        else
            dbms_output.put_line(jobtitle);
        end if;
        
        open c(joburi(i));
        loop
            fetch c into fname, lname, salariu, comission_procentage;
            exit when c%notfound or c%rowcount > 5;
            if emp_sal = 0 or salariu <> emp_sal then
                emp_sal := salariu;
                counter := counter + 1;
            end if;
            dbms_output.put_line(counter + 1 || ' ' || fname || ' ' || lname || ' ' || salariu);
        end loop;
        close c;
         
        dbms_output.new_line();
    end loop;
end;
/