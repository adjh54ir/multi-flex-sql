/**
 * DML 활용 방안에 대한 SQL문을 관리합니다.
 * Reference Link : https://adjh54.tistory.com/314
 */


/**
 * SELECT: 데이터 조회 구조
 * 데이터베이스에서 데이터를 ‘조회’하는 명령어입니다. 특정 테이블의 열 또는 행을 선택하여 데이터를 가져올 수 있습니다.
 */
SELECT column1, column2
FROM table_name
WHERE condition;


/**
 * INSERT: 데이터 삽입 구조
 * 데이터베이스에 새로운 데이터를 삽입하는 명령어입니다. 테이블에 새로운 행을 추가할 수 있습니다.
 */
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);


/**
 * UPDATE: 데이터 업데이트 구조
 * 데이터베이스의 기존 데이터를 수정하는 명령어입니다. 특정 테이블의 열 값을 업데이트할 수 있습니다.
 */
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;



/**
 * DELETE: 데이터 삭제 구조 
 * 데이터베이스에서 데이터를 삭제하는 명령어입니다. 특정 테이블의 행을 제거할 수 있습니다.
 */
-- DELETE: 데이터 삭제 구조 
DELETE FROM table_name
WHERE condition;



/**
 * MERGE: 데이터 삽입 또는 업데이트 구조 
 * 주어진 조건에 따라 데이터를 삽입, 수정 또는 삭제하는 작업을 수행하는 명령어입니다. MERGE 문은 주로 조건에 따라 데이터를 업데이트하거나 삽입하는 데 사용됩니다.
 */
MERGE INTO table_name
USING (
  SELECT column1, column2, ...
  FROM source_table
) source
ON (table_name.column = source.column)
WHEN MATCHED THEN
  UPDATE SET column1 = source.column1, column2 = source.column2, ...
WHEN NOT MATCHED THEN
  INSERT (column1, column2, ...)
  VALUES (source.column1, source.column2, ...);


/**
 * CALL: 저장 프로시저 또는 함수 호출 구조 
 * 데이터베이스 내에서 정의된 저장 프로시저, 함수 또는 사용자 정의 프로그램을 호출하는 명령어입니다.
 */
CALL procedure_name(parameters);


/**
 * EXPLAIN PLAN
 *  데이터베이스에서 쿼리의 실행 계획을 보여주는 도구입니다. 쿼리를 실행할 때 데이터베이스가 어떻게 작업을 수행하는지를 시각적으로 보여줍니다. 이를 통해 쿼리의 성능 문제를 식별하고 최적화할 수 있습니다.
 */
-- Oracle
EXPLAIN PLAN FOR <your_query>;

-- PostgreSQL
EXPLAIN <your_query>;


/**
 * LOCK TABLE
 * 데이터베이스 관리 시스템에서 테이블을 잠그는 명령입니다. 테이블이 잠기면 다른 트랜잭션이 테이블에 접근하거나 수정하는 것을 방지합니다.
 */

LOCK TABLE table_name [READ | WRITE];