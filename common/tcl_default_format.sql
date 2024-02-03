/**
 * TCL 활용 방안에 대한 SQL문을 관리합니다.
 * 데이터베이스에서 트랜잭션의 원자성, 일관성, 독립성, 지속성을 제어하는데 사용됩니다.
 * Reference Link : https://adjh54.tistory.com/314
 */


/**
 * COMMIT
 * 트랜잭션을 확정하고 변경사항을 영구적으로 저장
 */
COMMIT;


/**
* ROLLBACK
* 데이터베이스 트랜잭션 내에서 특정 지점에 저장점을 설정하는 명령어입니다.
*/
ROLLBACK;


/**
 * SAVEPOINT
 * 데이터베이스 트랜잭션의 특성을 설정하는 명령어입니다.
 */
-- SAVEPOINT: 트랜잭션 내에서 저장점을 설정하여 특정 지점까지만 롤백 가능
SAVEPOINT savepoint_name;

-- SAVEPOINT 사용예시:
SAVEPOINT sp1;

UPDATE table_name
SET column1 = value1
WHERE condition1;

SAVEPOINT sp2;

UPDATE table_name
SET column2 = value2
WHERE condition2;

ROLLBACK TO SAVEPOINT sp1;


/**
 * SET TRANSACTION
 * SET TRANSACTION를 통해서 트랜잭션의 격리 수준, 잠금 방식 등을 설정할 수 있습니다.
 */

SET TRANSACTION [ ISOLATION LEVEL { SERIALIZABLE | REPEATABLE READ | READ COMMITTED | READ UNCOMMITTED } ]
    [ READ WRITE | READ ONLY ]
    [ DEFERRABLE | NOT DEFERRABLE ]
    [ [ NOT ] DEFERRED ]
    [ [ NOT ] ENFORCED ]
    [ [ NOT ] AUTOCOMMIT ]
    [ [ NOT ] SNAPSHOT ]
    [ [ NOT ] READ ONLY ]
    [ [ NOT ] READ WRITE ]
    [ [ NOT ] STARTED ]
    [ [ NOT ] IN PROGRESS ]
    [ [ NOT ] COMMITTED ]
    [ [ NOT ] COMMIT ]
    [ [ NOT ] ROLLBACK ]
    [ [ NOT ] SAVEPOINT ]
    [ [ NOT ] WORK ]
    [ [ NOT ] TRANSACTION ]
    [ [ NOT ] NAME 'transaction_name' ]
    [ [ NOT ] ISOLATION LEVEL { SERIALIZABLE | REPEATABLE READ | READ COMMITTED | READ UNCOMMITTED } ]
    [ [ NOT ] READ WRITE | [ NOT ] READ ONLY ]
    [ [ NOT ] DEFERRABLE | [ NOT ] NOT DEFERRABLE ]
    [ [ NOT ] DEFERRED | [ NOT ] NOT DEFERRED ]
    [ [ NOT ] ENFORCED | [ NOT ] NOT ENFORCED ]
    [ [ NOT ] AUTOCOMMIT | [ NOT ] NOT AUTOCOMMIT ]
    [ [ NOT ] SNAPSHOT | [ NOT ] NOT SNAPSHOT ]
    [ [ NOT ] READ ONLY | [ NOT ] NOT READ ONLY ]
    [ [ NOT ] READ WRITE | [ NOT ] NOT READ WRITE ]
    [ [ NOT ] STARTED | [ NOT ] NOT STARTED ]
    [ [ NOT ] IN PROGRESS | [ NOT ] NOT IN PROGRESS ]
    [ [ NOT ] COMMITTED | [ NOT ] NOT COMMITTED ]
    [ [ NOT ] COMMIT | [ NOT ] NOT COMMIT ]
    [ [ NOT ] ROLLBACK | [ NOT ] NOT ROLLBACK ]
    [ [ NOT ] SAVEPOINT | [ NOT ] NOT SAVEPOINT ]
    [ [ NOT ] WORK | [ NOT ] NOT WORK ]
    [ [ NOT ] TRANSACTION | [ NOT ] NOT TRANSACTION ]
    [ [ NOT ] NAME 'transaction_name' ]