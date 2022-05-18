-------------------------------------------------
--rownum

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
--정렬을 하면 rownum이 섞인다 -->정렬을 하고 rownum 을 준다
select  rownum,
        employee_id,
        first_name,
        salary
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