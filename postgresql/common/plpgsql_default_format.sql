/**
 * PL/pgSQL에서 공통으로 사용하는 예시 관리
 */


/**
 * PL/pgSQL 로깅  
 * 로깅 종류 : WARNING, INFO, NOTICE, LOG, DEBUG5 / DEBUG4 / DEBUG3 / DEBUG2 / DEBUG1
 */ 
DO
$$
DECLARE
    -- 선언부
BEGIN
    RAISE DEBUG 'INFO 로그 : %', current_timestamp;
    RAISE LOG 'LOG 로그 : %', current_timestamp;
    RAISE INFO 'INFO 로그 : %', current_timestamp;
    RAISE NOTICE 'NOTICE 로그 : %', current_timestamp;
    RAISE WARNING 'WARNING 로그 : %', current_timestamp;
END $$
LANGUAGE plpgsql;


-- PL/pgSQL 로깅 레벨 확인
SHOW client_min_messages;


-- PL/pgSQL 로깅 레벨 변경
SET client_min_messages = 'WARNING'