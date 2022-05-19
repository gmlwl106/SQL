/*문제1.
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
(56건)*/
select  count(salary)
from employees
where salary < (select avg(salary)
                from employees);

/*문제2. 
평균급여 이상, 최대급여 이하의 월급을 받는 사원의
직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차
순으로 정렬하여 출력하세요
(51건)*/
select  employee_id
        ,first_name
        ,salary
from employees e, (select avg(salary) avg_s
                          ,max(salary) max_s
                    from employees)
where salary >= avg_s
and salary <= max_s;


/*문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소
를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주
(state_province), 나라아이디(country_id) 를 출력하세요
(1건)*/
select  l.location_id
        ,l.street_address
        ,l.postal_code
        ,l.city
        ,l.state_province
        ,l.country_id
from locations l, (select  d.location_id
                            ,first_name
                            ,last_name
                    from employees e, departments d
                    where e.department_id = d.department_id
                    and first_name = 'Steven'
                    and last_name = 'King') dd
where l.location_id = dd.location_id;


/*문제4.
job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로
출력하세요 -ANY연산자 사용
(74건)*/
select  employee_id
        ,first_name
        ,salary
from employees
where salary <any (select salary
                    from employees
                    where job_id = 'ST_MAN');
                    
                    
/*문제5. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여
(salary) 부서번호(department_id)를 조회하세요
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)*/

