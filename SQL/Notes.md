#  SQL 개념 정리
## 100.
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

---
---
## 101.
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

---
---
## 102.
database를 구축하는 순서

1. create database
2. create table
3. insert data
4. retrieve data

---

user → RDBMS(mysql) → computer(C)

mySQL workbench가 mySQL를 잘 이용할 수 있도록 해준다! = IDE(통합개발환경)

---
---
## 103. 
내 DB 만들어보기

SSL: secure socket layer

useSSL=0 추가 → 암호화 X

---
---
## 104.
DBMS version check

- administation → server status → 관련 정보 다 나옴

---

Create table for temperature from buildings

- BEMS (building energy management system)
- 조명, 냉난방, 신재생 에너지, 가스 등
- 센서 → DB → 모니터링, 분석
- 요소
    - building id, int
    - temperature, float
    - time(UTC)
- Case-sensitivity(대소문자 구분)
    - system variable 확인, lower
        - 0 : 구분함
        - 1 : 구분하지 않음 (windows)
        - 2 : 구분하지 않음 (저장할 때는 다르게 저장, 확인할 때는 상관없이)

---
---
## 105.
table name, charset, comments

- table name: 테이블명
- charset → utf-8
- comments: 그냥 설명

---

- int
- smallint
- float
- timestamp

---

- UN: unsigned 부호없는
- NN: not null null이 없는, 허용하지 않음
- AI: auto increment 번호를 자동으로 증가시킴
- PK: primary key 반드시 다른 값 하나를 꼭 가져야함 (rid는 꼭 체크!)

---
---
## 106.
- 자료형별로 byte 크기가 다르다.
- ZF: zero fill 0으로 채운다.
- INT(10): 무조건 자리는 10자리가 되어야함.

---

UTC 알아서 세계시간을 한국시간에 맞춰줌

TIMESTAMP 이용

---
---
## 117.
- create table
- auto_increment
- insert into ~ values
- insert ignore into ~ values

---

1. **Create table**

기존: 불필요한 중복, 수정 불편 

Relational DB의 특징을 활용해서 해결

→ 두 번째 테이블을 만들어서 따로 저장(1번 테이블에 빌딩 온도, 2번 테이블에 빌딩 정보)

SQL query “join”을 통해 테이블끼리 정보를 엮는다.

```sql
use FirstDatabase;
create table Building_Info
(
	rid int auto_increment primary key,
	building_id smallint unique,
	building_name varchar(100)
);	
```

- varchar → 100글자로 제한.
- auto_increment → 번호를 자동으로 매겨줌
- primary key → 모든 테이블에서 적어도 하나의 column은 번호를 매기는 것.
- unique → 같은 것을 넣었을 때, ERROR를 띄워서 사고를 미연에 방지함.

```sql
insert into Building_Info values(null,1,'연구동')
insert into Building_Info values(null,3,'기숙사')
insert into Building_Info values(null,8,'식당')
insert into Building_Info values(null,9,'체육관')

select * from Building_Info
```

→ 테이블에 값을 넣는 것.

---
---
## 118.
1. **auto_increment,**
2. **insert into ~ values**

```sql
alter table `Building_Info` auto_increment=10;
insert into Building_Info values(null,2,'수영장');
```

- alter table → 테이블에 값을 추가
- auto_increment=n 설정을 추가하면, 순서대로 2 3 4에서 갑자기 10으로 넘어갈 수 있다.
    
    ex) 1, 2, 3, 4, 10, 11, 12 순
    

---

1. **insert ignore into ~ values**

```sql
(틀린 코드)
insert into Building_Info values(null,1,'기초연구동');
insert into Building_Info values(null,5,'과학연구동');
```

- Infomation → DDL(data definition language) ⇒ 테이블에 대한 속성 확인 가능
- 이것은 unique로 속성이 추가되어있기 때문에 에러가 발생. → duplicated
- 순차적으로 실행하기 때문에 하나의 에러가 발생하면, 뒷 코드는 실행할 수 없음.
- 이때 사용하는 것이, insert ignore (에러가 발생한 것을 제외하고 모두 실행)

```sql
(옳은 코드)
insert ignore into Building_Info values(null,1,'기초연구동');
insert ignore into Building_Info values(null,5,'과학연구동');
```
---
---
## 119.
1. **update**

```sql
select * from Building_Info;
update `Building_Info` set `building_name` = '첨단연구동' where `building_id` = 1;
```

- 테이블의 빌딩 이름 column을 첨단연구동으로 바꾼다. id가 1인 column을!

---

1. **alter table add**

```sql
alter table `Building Info`
add max_capacity smallint unsigned;
```

- 테이블에 새로운 column을 만들기 위해 사용하는 명령어
- max_capacity라는 column을 부호없는 smallint로 선언

```sql
update `Building Info` set `max_capacity` = 200;
```

- where를 안 적어서 모든 max_capacity의 column이 200으로 바뀐다. → 그래서 주의해야함!!

```sql
update `Building Info` set `max_capacity` = -200;
```

- 만약 부호 없는 것으로 선언했는데 음수를 넣었다면, 0으로 자동 변환해준다.

```sql
update `Building Info` set `max_capacity`= `max_capacity`*2 where `Building_name` = `식당`;
```

- 식당에 있는 최대 인원을 2배로 증축했다면?

---

1. **on duplicate key update**

```sql
insert into `Building_Info` values(null,1,`자연연구동`, 200)
on duplicate key update `Building_name` = `자연연구동`;
```

- unique라서 원래는 ERROR를 일으키지만, 만약 에러가 나면 자연연구동으로 바꿔달라는 명령어

---

1. **delate from ~ where**

```sql
delate from `Building_Info` where `max_capacity` > 200;
```

- delate는 매우 위험한 명령어 → 꼭 조건을 달아서 지우도록!!
- 최대 인원이 200 이상인 곳만 값을 지워라.

---
---
## 120.
1. **join**

```sql
select * from Building_Info;
select * from Building_Temperature;
select * from Building_Humidity;

select *
from Building_Info join Building_Temperature on Building_info.building_id = Building_Temperature.building_id 
```

- 두 테이블에서 id가 같게 붙여서 보여주는 명령어

```sql
select Building_Info.Building_name, Building_Temperature.temperature, Building_Temperature.reg_date
from Building_Info join Building_Temperature on Building_Info.building_id = Building_Temperature.building_id;
```

- 필요한 테이블 정보만 불러서 id에 맞게 붙여서 보여주는 명령어

```sql
select a.building_name, b.Temperature, b.reg_date
from Building_Info a join Building_Temperature b on a.building_id = b.building_id;
```

- 이름이 너무 길다… 별명을 지어서 테이블의 이름을 간단히 지어보자
- alias 띄어쓰기 하고 이름 적으면 끝!
