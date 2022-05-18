-------------------------------------------------
--rownum

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
--정렬을 하면 rownum이 섞인다 -->정렬을 하고 rownum 을 준다
select  rownum,
        employee_id,
        first_name,
        salary
<<<<<<< HEAD
from employees   -- 미리 정렬되어 있는 테이블이면 rownum이 섞이지 않는다
order by salary desc;

-->정렬(정렬된 테이블 사용)하고 rownum을 준다
select  rownum,
        ot.employee_id,
        ot.first_name,
        ot.salary
from (select  employee_id,
              first_name,
              salary
      from employees
      order by salary desc) ot ;


--rownum을 이용해서 원하는 순위의 값을 선택한다(where절)
--where절이 2번 부터이면 데이터가 없다 (rownum이 항상 1이다)
select  rownum ,
        ot.employee_id,
        ot.first_name,
        ot.salary
from (select  employee_id,
              first_name,
              salary
      from employees
      order by salary desc) ot  --정렬도 되어 있고  rownum로 있는 테이블이면?
where rownum >= 2
and rownum <= 5;

-->(1)정렬하고 (2)rownum이 있는 테이블을 사용하고 (3)where절을 쓴다
select  ort.rn,
        ort.first_name,
        ort.salary
from (select  rownum rn,
              ot.employee_id,
              ot.first_name,
              ot.salary
      from (select  employee_id,
                    first_name,
                    salary
            from employees
            order by salary desc) ot   --(1)
      )ort  --(2)
where rn >= 2
and rn<=5;  --(3)

-----------------------------------------------------
--07년에 입사한 직원 중 급여가 많은 직원 중 3에서 7등의 이름 급여 입사일은?
select ort.rn
        ,ort.employee_id
        ,ort.first_name
        ,ort.salary
from (select  rownum rn
                ,ot.employee_id
                ,ot.first_name
                ,ot.salary
        from (select  employee_id
                     ,first_name
                     ,salary
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by hire_date desc) ot --정렬
        ) ort --rownum으로 번호달기
where rn >= 3
and rn <= 7;
=======
from employees
where salary in (select salary
                from employees
                where department_id = '110'); --겹치는 조건이 여러개
                

--각 부서별로 최고급여를 받는 사원 출력
select  first_name,
        department_id,
        salary
from employees
where (department_id, salary) in (select  department_id,
                                          max(salary)
                                 from employees
                                 group by department_id);
                                 

--부서번호가 110인 직원의 급여보다 큰 모든 직원의 사번, 이름, 급여를 출력(or연산)
select  employee_id,
        first_name,
        salary
from employees
where salary >any (select salary
                from employees
                where department_id = 110);
                
--부서번호가 110인 직원의 급여보다 큰 모든 직원의 사번, 이름, 급여를 출력(and 연산)
select  employee_id,
        first_name,
        salary
from employees
where salary >all (select salary
                from employees
                where department_id = 110);
                

--각 부서별로 최고급여를 받는 사원을 출력
select  department_id,
        employee_id,
        first_name,
        salary
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                 from employees
                                 group by department_id);
                                 
--테이블에서 조인
--최고 급여를 찾는 서브쿼리문을 s 테이블로 만들어서 e와 조인
select  e.department_id,
        e.employee_id,
        e.first_name,
        e.salary
from employees e, (select department_id,
                          max(salary) salary
                    from employees
                    group by department_id) s
where e.department_id = s.department_id
and e.salary = s.salary;
>>>>>>> refs/remotes/origin/master
