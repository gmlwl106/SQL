/*************
selet 문
    select 절
    from 절
**************/

--모든 칼럼 조회하기
select *
from employees;

select *
from departments;

--원하는 칼럼만 조회하기
select employee_id, first_name, last_name
from employees;


--예제)
--사원의 이름(first_name)과 전화번호 입사일 연봉을 출력하세요
select first_name, phone_number, hire_date, salary
from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
select   first_name "이름"
        ,last_name  "성"
        ,salary "급여"
        ,phone_number "전화번호"
        ,email "이메일"
        ,hire_date "입사일"
from employees;

--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
select   first_name as 이름
        ,last_name 성
        ,salary "Salary"
        ,phone_number hp --따옴표 없으면 대문자로 나옴
        ,email "이 메 일"
        ,hire_date 입사일
from employees;

--연결연산자(칼럼을 붙이기)
select first_name || last_name
from employees;

select first_name ||' '|| last_name
from employees;

select first_name ||' hire date is '|| hire_date "입사일"
from employees;

--산술 연산자
select  first_name,
        salary "월급",
        salary*12 "연봉"
from employees;

select job_id*12 --job_id가 숫자가 아니라서 계산안된
from employees;

--예제
select first_name ||'-'|| last_name "성명"
        ,salary "급여"
        ,salary*12 "연봉"
        ,salary*12+5000 "연봉2"
        ,phone_number "전화번호"
from employees;

--WHERE
SELECT * 
FROM employees
where department_id = 10;

--연봉이 15000이상인 사원들의 이름과 월급
select  first_name "이름"
        , salary "연봉"
from employees
where salary*12 >= 15000;

--07/01/01일 이후에 입사한 사원들의 이름과 입사일
select  first_name "이름"
        , hire_date "입사일"
from employees
where hire_date > '07/01/01';

--이름이 Lex인 직원의 연봉
select  first_name "이름"
        , salary "연봉"
from employees
where first_name = 'Lex';

--연봉이 14000 이상 17000이하인 사원의 이름과 연봉
select  first_name
        ,salary
from employees
where salary >= 14000
and salary <= 17000;

--입사일이 01/01/01에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select  first_name
        ,hire_date
from employees
where hire_date > '04/01/01'
and hire_date < '05/12/31';

--연봉이 14000 이상 17000 이하인 사원의 이름과 연봉을 구하시오
select  first_name
        ,salary
from employees
where salary between 14000 and 17000;

--이름이 Neena, Lex, John인 사람의 이름 성 연봉 출력
select first_name
        ,last_name
        ,salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉
select first_name
        ,salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

--Like 연산자로 비슷한것들 모두 찾기
select first_name
        ,last_name
        ,salary
from employees
where first_name like 'L%';

--이름에 am을 포함한 사원의 이름과 연봉 출력
select  first_name
        ,salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력
select  first_name
        ,salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a인 사원의 이름을 출력
select first_name
from employees
where first_name like '___a%';

--이름이 4글자인 사원 중 끝에서 두번째 글자가 a인 사원의 이름을 출력
select first_name
from employees
where first_name like '__a_';

--커미션 비율이 있는 사원의 이름과 연봉 커미션 비율을 출력하세요
select  first_name
        ,salary
        ,commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션 비율이 없는 직원의 이름
select first_name
from employees
where manager_id is null
and commission_pct is null;

--order by 절을 사용해 보기 좋게 정렬하기
select  first_name
        ,salary
from employees
order by salary desc; --내림차순

select  first_name
        ,salary
from employees
order by salary asc; --오름차순

--이름 오름차순으로 정렬
select *
from employees
order by first_name asc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력
select  department_id
        ,salary
        ,first_name
from employees
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰 직원부터 출력
select  first_name
        ,salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름 출력
select  department_id
        ,salary
        ,first_name
from employees
order by department_id asc, salary desc, first_name desc; --순서대로 적용됨

/*
단일행 함수
*/
--문자함수 - INITCAP(컬럼명)
--부서번호 100인 직원의 이메일주소와 부서번호를 출력
select  email
        ,initcap(email) "email2"
        ,department_id
from employees
where department_id = 100;

--문자함수 - LOWER(컬럼명) / UPPER(컬럼명)
select  first_name
        ,upper(first_name) "upper"
        ,lower(first_name) "lower"
from employees
where department_id = 100;

--문자함수 - SUBSTR(컬럼명, 시작위치, 글자수)
select  first_name
        ,substr(first_name,1,3)
        ,substr(first_name,-3,2)
from employees
where department_id = 100;

--문자함수 - LPAD(컬럼명, 자리수, '채울문자') / RPAD(컬럼명, 자리수, '채울문자')
select  first_name
        ,lpad(first_name,10,'*')
        ,rpad(first_name,10,'*')
        ,lpad(rpad(first_name,10,'*'),15,'*')
from employees
where department_id = 100;

--문자함수 - REPLACE(칼럼명, 문자1, 문자2)
select  first_name
        ,replace(first_name, 'a', '*')
        ,substr(first_name, 2,3)
        ,replace(first_name, 'anc', '***')
from employees
where department_id = 100;

select replace('abcdefg', 'bc', '******')
from dual; --테스트용 빈 db

select substr('941006-266666', 8, 1)
from dual;

--숫자함수 - ROUND(숫자, 출력을 원하는 자리수)
select  round(123.346, 2) r2
        ,round(123.346, 0) r0
        ,round(123.346, -1) "r-1"
from dual;

--숫자함수 - TRUNC(숫자, 출력을 원하는 자리수)
select  trunc(123.346, 2) r2
        ,trunc(123.346, 0) r0
        ,trunc(123.346, -1) "r-1"
from dual;

--날짜함수 - SYSDATE()
select sysdate
from dual;

select months_between('22/05/12', '22/04/12')
from dual;

select months_between(sysdate, hire_date)
from employees
where department_id = 110;

--TO_CHAR(숫자, '출력모양') 숫자형->문자형으로 변환하기
select  first_name
        ,to_char(salary*12, '$099999')
from employees
where department_id = 110;

select  to_char(9876, '99999')
        ,to_char(9876, '099999')
        ,to_char(9876, '$99999')
        ,to_char(9876, '9999.99')
        ,to_char(9876123123, '999,999,999,999')
        ,to_char(9876123123, '999,999,999,999.99')
from dual;

--변환함수>TO_CHAR(날짜, '출력모양') 날짜->문자형으로 변환하기
select  sysdate
        ,to_char(sysdate, 'yyyy')
        ,to_char(sysdate, 'yy')
        ,to_char(sysdate, 'mm')
        ,to_char(sysdate, 'month')
        ,to_char(sysdate, 'dd')
        ,to_char(sysdate, 'day')
        ,to_char(sysdate, 'hh24')
        ,to_char(sysdate, 'mi')
        ,to_char(sysdate, 'ss')
        ,to_char(sysdate, 'yyyy-mm-dd')
from dual;