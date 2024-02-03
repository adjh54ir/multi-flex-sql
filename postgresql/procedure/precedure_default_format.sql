/**
 * 프로시저의 기본 format에 대한 SQL + PL/pgSQL문을 관리합니다.
 * Reference Link : https://adjh54.tistory.com/159
 */ 

 -- 프로시저 기본 format
CREATE [OR REPLACE] PROCEDURE procedure_name (arguments)
LANGUAGE plpgsql
AS $$
DECLARE
    -- 변수 선언 영역
BEGIN
    -- 저장 프로시저 로직 영역
EXCEPTION
    -- 예외 처리 코드 영역
    WHEN exception_condition THEN
END;
$$;


-- 프로시저 호출
CALL procedure_name('test');