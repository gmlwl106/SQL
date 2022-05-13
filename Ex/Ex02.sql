/*
select  *
from employees;
*/

/************************
    그룹함수
*************************/
/*select  first_name
        ,sum(salary) --row 갯수가 맞지않아서 오류남
from employees; */

select sum(salary)
from employees;

--그룹함수 - count()
select  count(*),
        count(commission_pct), --null을 제외하고 카운트
        count(manager_id_)
from employees;

select count(*)
from employees
where salary > 16000;

--그룹함수 - sum()
select  count(salary) "인원"
        ,sum(salary) "월급 총합"
from employees;

--그룹함수 - avg()
select  avg(salary) --null이면 제외하고 평균 계산
        ,avg(nvl(salary, 0)) --null을 0으로 변경후 평균 계산
        ,round(avg(salary), 0) --반올림
        ,count(*)
        ,sum(salary)
from employees;

--그룹함수 - max() / min()
select  max(salary),
        min(salary)
from employees;

--GROUP BY 절
select  nvl(department_id,0),
        round(avg(salary),0)
from employees
group by department_id
order by department_id;

select  department_id,
        avg(salary) "부서별 평균",
        sum(salary) "부서별 합계",
        count(salary) "부서별 카운트"
from employees
group by department_id
order by department_id;

select  department_id,
        job_id,
        avg(salary) "부서별 평균",
        sum(salary) "부서별 합계",
        count(salary) "부서별 카운트"
from employees
group by department_id, job_id
order by department_id;

--연봉의 합계가 2000이상인 부서의 부서 번호와 인원수, 급여합계 출력
select  department_id
        ,count(*)
        ,sum(salary)
from employees
where sum(salary) >= 20000 --where절에는 그룹함수를 쓸수없다
group by department_id;

--HAVING 절
select  department_id
        ,count(*)
        ,sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and sum(salary) <= 100000
and department_id = 90;
--and hire_date >= '04/01/01'; 그룹함수와 group by에 참여한 칼럼만 사용할 수 있다.


--CASE~END문
select  employee_id,
        first_name,
        job_id,
        salary,
        case when job_id = 'AC_ACCOUNT'then salary + salary * 0.1
             when job_id = 'SA_REP'then salary + salary * 0.2
             when job_id = 'ST_CLERK'then salary + salary * 0.3
             else salary
        end "realSalary"
from employees;

--DECODE문
select  employee_id,
        first_name,
        job_id,
        salary,
        decode(job_id, 'AC_ACCOUNT', salary + salary * 0.1,
                        'SA_REP', salary + salary * 0.2,
                        'ST_CLERK', salary + salary * 0.3,
                salary)"realSalary"
from employees;

--직원의 이름, 부서, 팀 출력
--case~end문 사용
select  first_name,
        department_id,
        case when department_id between 10 and 50 then 'A-TEAM'
             when department_id between 60 and 100 then 'B-TEAM'
             when department_id between 110 and 150 then 'C-TEAM'
             else '팀없음'
        end "TEAM"
from employees
order by TEAM;

select  first_name,
        department_id,
        case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
             when department_id >= 60 and department_id <= 100 then 'B-TEAM'
             when department_id >= 110 and department_id <= 150 then 'C-TEAM'
             else '팀없음'
        end "TEAM"
from employees
order by TEAM;


/************************
    JOIN
*************************/
select  employee_id
        ,first_name
        ,salary
        ,department_name
        ,ee.department_id
        ,dd.department_id
from employees ee,departments dd
where ee.department_id = dd.department_id; --employees의 department_id와 departments의 department_id가 같은것만 출력

--모든 직원이름 부서이름, 업무명 출력
select  ee.first_name||' '||ee.last_name,
        dd.department_name,
        jj.job_title,
        ee.salary
from employees ee, departments dd, jobs jj
where ee.department_id = dd.department_id
and ee.job_id = jj.job_id
and ee.salary >= 7000
order by first_name;

select *
from employees;