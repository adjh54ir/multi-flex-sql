/**
 * 프로시저의 Exception 방법에 대한 SQL + PL/pgSQL문을 관리합니다.
 * Reference Link : https://adjh54.tistory.com/413
*/ 


-- Exception Exam DDL
CREATE TABLE tb_employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    emp_position VARCHAR(100),
    emp_salary INT
);

-- Exception DDL
INSERT INTO tb_employee (emp_id, emp_name, emp_position, emp_salary)
VALUES (1, 'Kim', 'Manager', 5000000),
       (2, 'Park', 'Assistant', 3000000),
       (3, 'Lee', 'Intern', 1000000),
       (4, 'Choi', 'Manager', 6000000),
       (5, 'Jung', 'Assistant', 2500000),
       (6, 'Han', 'Intern', 1200000),
       (7, 'Yoon', 'Manager', 5500000),
       (8, 'Im', 'Assistant', 2700000),
       (9, 'Jang', 'Intern', 1300000),
       (10, 'Kang', 'Manager', 6000000),
       (11, 'Cho', 'Assistant', 2800000),
       (12, 'Go', 'Intern', 1100000),
       (13, 'Baek', 'Manager', 5400000),
       (14, 'Seo', 'Assistant', 3200000),
       (15, 'Ahn', 'Intern', 1200000),
       (16, 'Song', 'Manager', 5500000),
       (17, 'Lee', 'Assistant', 3000000),
       (18, 'Kim', 'Intern', 1300000),
       (19, 'Park', 'Manager', 5700000),
       (20, 'Choi', 'Assistant', 3100000);


-- Exception Raise
DO
$$
DECLARE
    v_emp_id int = 21;
BEGIN
    -- 만약 emp_id 값이 21인 직원이 존재하지 않으면 예외를 발생시킵니다.
    IF NOT EXISTS (SELECT 1 FROM tb_employee WHERE emp_id = v_emp_id) THEN
        RAISE EXCEPTION '직원 ID %가 존재하지 않습니다.', v_emp_id;
    END IF;
END;
$$
LANGUAGE plpgsql;



-- Exception SQLSTATE
DO
$$
DECLARE
	rec record;
	v_emp_id int = 21;
BEGIN
	-- 직원 선택
	SELECT emp_id, emp_name
	INTO strict rec
	FROM tb_employee
	WHERE emp_id = v_emp_id;

        -- 예외 처리
	EXCEPTION
	   WHEN sqlstate 'P0002' THEN
	      raise exception 'ID가 %인 직원을 찾을 수 없습니다', v_emp_id;
	   WHEN sqlstate 'P0003' THEN
	      raise exception 'ID가 %인 직원이 중복입니다', v_emp_id;
END;
$$
language plpgsql;


-- Exception Retrun 
DO
$$
DECLARE
    v_emp_id int = 21;
    v_emp_name varchar(100) = 'Yoo';
    v_emp_position varchar(100) = 'Engineer';
    v_emp_salary int = 4000000;
    v_result text;
BEGIN
    -- 새로운 직원 추가
    BEGIN
        INSERT INTO tb_employee (emp_id, emp_name, emp_position, emp_salary)
        VALUES (v_emp_id, v_emp_name, v_emp_position, v_emp_salary);
        v_result := '직원 추가 성공';
    EXCEPTION WHEN unique_violation THEN
        -- emp_id가 이미 존재하는 경우
        v_result := 'ERROR: 직원 ID가 이미 존재합니다.';
    WHEN others THEN
        -- 그 외의 오류
        v_result := 'ERROR: 직원 추가 중 알 수 없는 오류가 발생했습니다.';
    END;

    -- 결과 반환
    RAISE NOTICE '%', v_result;
END;
$$
LANGUAGE plpgsql;