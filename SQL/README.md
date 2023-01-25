#  SQL 개념 정리
### 100
web, client → server(web server 多) → DBMS (database management system)

대부분 DBMS 하나만 둠

---

Relational Database (RDBMS)

1970년에 처음으로 생김 → IBM

Relation = Tuple(records) + Attribute

excel의 sheet와 매우 비슷하다.

---

 database server = instance(다룰 수 있도록 하는 프로그래밍 영역) + database(데이터베이스)

아래아(DB) + HWP(DB) ⇒ DBMS

DBMS 

- Logging
- Checkpoint : 문제가 생겼을 때 되돌릴 수 있는 기능

SQL

### 101
RDBMS: relational database management system

상업용 RDBMS

- Oracle → 유료
- MySQL → 일부만 무료 (오라클이 인수)
- Microsoft SQL Server
- SQLite → 무료 (memory footprint이 작음→ 요구량이 적음)
- Microsoft Access
- MariaDB → 무료 (MySQL의 오픈소스 버전)
- Hive

---

SQL : Structured Query Language

- create table:  테이블을 제작하라
- alter table: 테이블을 수정해달라
- truncate table: sheet만 냅두고 값만 모두 지워달라
- drop table: 모두 지워달라
- select: 값을 읽어오라(read)
- insert into: 값을 넣어달라(write)
- update: 값을 수정해달라
- delete: 값을 지워달라

C언어랑 다른 점이 많음. 주의!
