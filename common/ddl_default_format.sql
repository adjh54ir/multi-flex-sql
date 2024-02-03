/**
 * DDL 활용 방안에 대한 SQL문을 관리합니다.
 * Reference Link : https://adjh54.tistory.com/314
 */


/**
 * CREATE
 * 데이터베이스 및 데이터베이스 내의 객체(테이블, 뷰, 인덱스, 프로시저, 트리거)를 ‘생성’하는데 사용되는 SQL문입니다.
 */

-- 데이터베이스 생성
CREATE DATABASE database_name;

-- 테이블 생성
CREATE TABLE 테이블이름 (
   열1 데이터_유형,
   열2 데이터_유형,
   ...
);

-- 인덱스 생성
CREATE INDEX index_name 
ON table_name (column1, column2, ...);

-- 뷰 생성
CREATE VIEW view_name AS 
SELECT column1, column2, ... 
FROM table_name 
WHERE condition;

-- 프로시저 생성
CREATE PROCEDURE procedure_name (parameter1 datatype, parameter2 datatype, ...) AS 
BEGIN ... END;

-- 트리거 생성
CREATE TRIGGER trigger_name BEFORE/AFTER INSERT
ON table_name 
FOR EACH ROW 
BEGIN ... END;


/**
 * ALTER
 * 데이터베이스 및 데이터베이스 내의 객체(테이블, 뷰, 프로시저, 트리거 등..)를 ‘수정’하는데 사용되는 SQL문입니다.
 */

 -- 데이터베이스 수정
ALTER DATABASE database_name 
MODIFY NAME = new_database_name;

-- 테이블 수정
ALTER TABLE table_name 
ADD column_name datatype;

-- 뷰 수정
ALTER VIEW view_name AS 
SELECT new_column1, new_column2, ... 
FROM table_name 
WHERE condition;

-- 프로시저 수정
ALTER PROCEDURE procedure_name (new_parameter1 datatype, new_parameter2 datatype, ...);

-- 트리거 수정
ALTER TRIGGER trigger_name INSTEAD OF UPDATE
ON table_name FOR EACH ROW 
BEGIN ... END;


/**
 * DROP
 * 데이터베이스 및 데이터베이스 내의 객체(테이블, 뷰, 프로시저, 트리거 등..)를 ‘삭제’하는데 사용되는 SQL문입니다.
 */
-- 데이터베이스 삭제
DROP DATABASE database_name;

-- 테이블 삭제
DROP TABLE table_name;

-- 인덱스 삭제
- DROP INDEX index_name ON table_name;

-- 뷰 삭제
DROP VIEW view_name;

-- 프로시저 삭제
DROP PROCEDURE procedure_name;

-- 트리거 삭제
- DROP TRIGGER trigger_name ON table_name;


/**
 * RENAME
 * 데이터베이스 및 데이터베이스 내의 객체(데이터베이스, 테이블, 뷰, 프로시저, 트리거 등..)의 ‘이름을 변경’하는 데 사용되는 SQL문입니다.
 */

-- 데이터베이스 이름 변경
ALTER DATABASE old_database_name RENAME TO new_database_name;

-- 테이블 이름 변경
ALTER TABLE old_table_name RENAME TO new_table_name;

-- 뷰 이름 변경
ALTER VIEW old_view_name RENAME TO new_view_name;

-- 인덱스 이름 변경
- ALTER INDEX old_index_name RENAME TO new_index_name;

-- 프로시저 이름 변경
ALTER PROCEDURE old_procedure_name RENAME TO new_procedure_name;

-- 트리거 이름 변경
ALTER TRIGGER old_trigger_name RENAME TO new_trigger_name;


/**
 * TRUNCATE
 * 데이터베이스의 ‘테이블’에서 ‘모든 데이터를 삭제’하는 데 사용되는 SQL 문입니다. 이를 사용하면 테이블의 모든 행이 삭제되지만, 테이블 자체는 삭제되지 않습니다.
 */
TRUNCATE TABLE 테이블이름;


/**
 * COMMENT
 * 데이터베이스 객체(데이터베이스, 테이블, 컬럼,  뷰, 프로시저, 트리거)에 대한 주석을 추가하는 데 사용되는 SQL 문입니다. 주석은 데이터베이스 개체에 대한 설명, 비고, 문서화 등의 목적으로 사용될 수 있습니다.
 */
-- 테이블 주석 추가
COMMENT ON TABLE table_name IS '주석 내용';

-- 컬럼 주석 추가
COMMENT ON COLUMN table_name.column_name IS '주석 내용';

-- 인덱스에 주석 추가
COMMENT ON INDEX index_name IS '주석 내용';

-- 뷰에 주석 추가
COMMENT ON VIEW view_name IS '주석 내용';

-- 프로시저에 주석 추가
COMMENT ON PROCEDURE procedure_name IS '주석 내용';

-- 트리거에 주석 추가
COMMENT ON TRIGGER trigger_name ON table_name IS '주석 내용';