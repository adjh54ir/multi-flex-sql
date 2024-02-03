/**
 * 프로시저의 Dummy 데이터 넣는 방법에 대한 SQL + PL/pgSQL문을 관리합니다.
 * Reference Link : https://adjh54.tistory.com/401
 */ 

-- DDL
create table tb_user
(
    user_sq SERIAL not null
        primary key,
    user_id text,
    user_pw text,
    user_nm text,
    user_st text
);

alter table tb_user
    owner to localmaster;


--💡 프로시저 구성
-- 프로시저는 LOOP를 100번 수행하면서 Dummy 데이터를 tb_user 테이블에 쌓습니다
-- INSERT를 수행한 뒤 LOOP_CNT는 1씩 증가합니다.

--💡 컬럼 구성
-- user_id는 랜덤 한 난수 5개의 숫자와 문자 조합의 난수를 생성하도록 하였습니다.
-- user_pw는 패스워드로 ‘1234’로 고정하였습니다.
-- user_name은 파라미터로 받은 값을 기반으로 동일한 이름을 만들도록 하였습니다.
-- user_st는 모두 ‘A’ 상태인 Active 상태로 구성하였습니다.

CREATE OR REPLACE PROCEDURE PROC_INSERT_SAME_USER(IN pi_user_name TEXT)
LANGUAGE plpgsql
AS $$
DECLARE
    LOOP_CNT INTEGER;
    LOOP_TIME INTEGER;
BEGIN
    -- 지역변수로 사용할 변수 지정
    LOOP_CNT := 0;

    -- 반복 구문
    WHILE LOOP_CNT < 100 LOOP
        INSERT INTO TB_USER (user_id, user_pw, user_nm, user_st)
        VALUES(SUBSTRING(gen_random_uuid()::text, 1, 5), '1234', pi_user_name, 'A');
        LOOP_CNT := LOOP_CNT + 1;
    END LOOP;
    COMMIT;
END;
$$;


-- 프로시저 호출
CALL proc_insert_same_user('홍길동');