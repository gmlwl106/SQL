/**********************
* SubQuery
***********************/
--단일행 SubQuery
--'Den'보다 급여가 많은 사람의 이름과 급여는?
select  first_name,
        salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den'); --SubQuery 사용
                
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select  first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary)
                from employees);
                
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력
select  first_name,
        salary
from employees
where salary < (select avg(salary)
                from employees);
       
--다중행 SubQuery         
--부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력
select  employee_id,
        first_name,
        salary
from employees
where salary in (select salary
                from employees
                where department_id = '110'); --겹치는 조건이 여러개