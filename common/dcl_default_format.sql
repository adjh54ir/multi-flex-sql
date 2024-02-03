/**
 * DCL 활용 방안에 대한 SQL문을 관리합니다.
 * 데이터베이스에서 데이터의 접근 권한을 제어하는 데 사용됩니다. 주로 데이터베이스 관리 시스템(DBMS)에서 제공하는 SQL(Structured Query Language) 명령어를 사용하여 수행됩니다.
 * Reference Link : https://adjh54.tistory.com/314
 */



/**
 * GRANT
 * 데이터베이스 객체(테이블 또는 뷰 등)에 대한 권한을 사용자나 역할에게 부여하는 기능을 제공합니다. 이 명령어는 데이터베이스의 접근을 제어하고, 사용자나 역할이 객체에서 수행할 수 있는 작업을 결정하는 데 사용됩니다.
 */

-- GRANT: 사용자에게 특정 권한을 부여
GRANT privilege_name
ON object_name
TO user_name;

-- 사용자에게 테이블에 대한 SELECT, INSERT, UPDATE, DELETE 권한을 부여합니다.
GRANT SELECT, INSERT, UPDATE, DELETE 
ON 테이블명 
TO 사용자명;


/**
 * REVOKE
 * 사용자나 역할에게 부여된 권한을 취소하는 기능을 제공합니다. 이 명령어를 사용하여 데이터베이스 객체에 대한 권한을 제거하거나 사용자의 접근 권한을 제한할 수 있습니다.
 */

 -- REVOKE: 사용자로부터 특정 권한을 취소
REVOKE privilege_name
ON object_name
FROM user_name;

-- 사용자에게 테이블에 대한 SELECT, INSERT, UPDATE, DELETE 권한을 취소합니다.
REVOKE SELECT, INSERT, UPDATE, DELETE 
ON 테이블명 
FROM 사용자명;
