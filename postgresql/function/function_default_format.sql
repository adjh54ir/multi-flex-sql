/**
 * 함수 기본 format에 대한 SQL + PL/pgSQL문을 관리합니다.
 * Reference Link : https://adjh54.tistory.com/159
 */ 


-- default format
CREATE [OR REPLACE] FUNCTION function_name (arguments)
RETURNS return_datatype AS $$
DECLARE
    -- 변수 선언

BEGIN
    -- 함수 로직

EXCEPTION
    -- 예외 처리 코드 영역
    WHEN exception_condition THEN

END;
$$ LANGUAGE plpgsql;


-- function 활용 예시 
CREATE FUNCTION hello_world(name TEXT)
RETURNS TEXT AS $$
DECLARE
    greeting TEXT;
BEGIN
    greeting := 'Hello, ' || name || '!';
    RETURN greeting;
END;
$$ LANGUAGE plpgsql;