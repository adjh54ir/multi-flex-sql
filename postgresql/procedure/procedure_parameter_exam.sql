/**
 * 프로시저의 파라미터의 방법에 대한 SQL + PL/pgSQL문을 관리합니다.
 * Reference Link : https://adjh54.tistory.com/408
*/ 

-- 프로시저 IN 활용 예시 
CREATE OR REPLACE FUNCTION proc_increase_salary(pi_emp_id IN int, pi_increase IN int)
RETURNS void AS $$
BEGIN
  UPDATE tb_employees SET salary = salary + pi_increase WHERE id = pi_emp_id;
END;
$$ LANGUAGE plpgsql;

-- 프로시저 IN 활용 예시 호출부
CALL PROC_INCREASE_SALARY(1, 100);




-- 프로시저 OUT 활용 예시 
CREATE OR REPLACE FUNCTION proc_total_column (OUT po_total int)
LANGUAGE plpgsql
AS $$
BEGIN
  SELECT COUNT(*) INTO pi_total FROM tb_employees;
END;
$$;

-- 프로시저 OUT 활용 예시 호출부 
SELECT multiflex_scma.proc_total_column();





-- 프로시저 INOUT 활용 예시 
CREATE OR REPLACE FUNCTION proc_update_salary(pio_emp_id INOUT int, pio_increase INOUT int)
LANGUAGE plpgsql AS $$
BEGIN
  UPDATE tb_employees SET salary = salary + pio_increase WHERE id = pio_emp_id;
  SELECT salary INTO pio_increase FROM tb_employees WHERE id = pio_emp_id;
END;
$$;

-- 프로시저 INOUT 활용 예시 호출부
SELECT * FROM proc_update_salary(1, 100);