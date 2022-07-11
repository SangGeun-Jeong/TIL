# Amazon RDS

![11](https://user-images.githubusercontent.com/108352215/177930807-18658425-9d54-4d14-a080-2afc838efa45.png)

# 학습 목표

1. AWS 클라우드 RDS의 개념을 설명할 수 있다.
2. AWS 클라우드 RDS의 사용 방법을 설명할 수 있다.

---

# AWS 클라우드 RDS의 개념

RDS(Relational Database Service) : 관계형 데이터베이스(RDBMS)를 손쉽게 생성하고 확장

- DB 인스턴스 생성 가능
- 스토리지 용량과 IOPS를 증가
- Failover 기능으로 장애가 발생해도 정상적인 서비스 제공
- Read Replica(복사본) 를 이용한 읽기 성능 향상

# RDS DB 인스턴스

- 확장 가능한 관계형 데이터베이스를 제공하는 RDS

```jsx
db.t1.micro, db.t2.micro (마이크로)
db.m3.medium, db.m3.2xlarge, db.m1.small (스탠다드)
db.m2.xlarge, db.m2.4xlarge (메모리 최적화)
```

![22](https://user-images.githubusercontent.com/108352215/177930811-49569675-c33c-4140-b032-9921ebd7e412.png)

- RDS 예약 인스턴스 : 시간당 사용 요금 대폭 할인
- RDS가 지원하는 데이터베이스 엔진 : 데이터베이스 소프트웨어(DB인스턴스에 미리 설치되어 있음)

> RDS 예약 인스턴스의 3가지 유형
> 
- Light 사용률 예약 인스턴스
- Medium 사용률 예약 인스턴스
- Heavy 사용률 예약 인스턴스

> RDS DB 인스턴스
> 
- MySQL
    - Maria DB
    - Community Edition, 추가요금 없음
- PostgreSQL
    - 요금은 MySQL보다 조금 높음
- Oracle
    - Oracle Standard Edition One
    - Standard Edition
    - Enterprise Edition
- Microsoft SQL Server

---

# AWS 클라우드 RDS의 사용방법 1

## RDS DB 인스턴스 생성

- 신규생성 클릭
- 엔진선택(MySQL, Maria DB PostgreSQL, Oracle)
- 목적에 맞게 Provisioned IOPS Storage 사용할 것인지 선택 (개발용, 상업용)
- 인스턴스 Spec 설정(version, storage type, ID, VPC Security Groups, Port)
- 백업 설정 (기간, Monitoring, Maintenace)

> 인스턴스 주요 특징
> 
- `Backup` : PIT(Point in Time) 자동 백업/복구 옵션
- `Backup Retention Period` : 백업 데이터 유지 기간
- `Maintenance Window` : 기본값은 No Preference

- RDS DB 인스턴스 목록(Instance)으로 돌아옴 → 방금 설정한 DB 인스턴스가 생성됨(완전히 생성되기까지 약 10분 정도 소요)

> 생성한 DB 접속


- RDS DB 인스턴스가 완전히 생성되면 exampledb 인스턴스를 선택
- `>`를 클릭하면 DB 인스턴스의 세부 내용이 표시, Endpoint부분에 `[exampledb인스턴스.cnlconsezo7y.ap-northeast-1.rds.amazonaws.com:3306](http://exampledb인스턴스.cnlconsezo7y.ap-northeast-1.rds.amazonaws.com:3306)` 처럼 DB에 접속 가능한 주소 표시
- 이후에도 이 주소로 DB 접속

> RDS DB 인스턴스 Security Group 생성 및 설정
> 
- RDS DB 인스턴스의 설정 변경
- Security Group에서 방금 생성한 MySQL DB Instance를 선택하고 아래쪽 Continue 버튼 클릭

> RDS DB 인스턴스 사용 방법
> 
- RDS DB 인스턴스의 생성이 완료되었으면 실제로 생성이 되었는지 확인
    - GUI 도구인 MySQL Workbench 사용
- 다운로드 파일을 설치 한 후 `MySQLWorkbench.exe` 실행
- 실행되면 MySQL Connections 옆의 + 버튼을 클릭하여 Connection 추가
- RDS DB 인스턴스를 생성할 때 설정한 Master Password 입력 후 OK 버튼 클릭

**뒤쪽의 3306(Port) 번호는 name 옆 Port 칸에 입력하기*

> 입력 정보
> 
- `Connection Name` : 연결의 이름 Connection Method : Standard(TCP/IP) 사용
- `Hostname` : RDS DB 인스턴스의 엔드 포인트 주소 입력(엔드 포인트 주소는 RDS DB 목록에서 DB 인스턴스를 선택한 뒤 확인 가능)
- `Port` : 3306, MySQL 접속 포트 번호 기본값
- `Username` : RDS DB 인스턴스를 생성할 때 설정한 Master Username(여기서는 admin으로 설정)

> DB 테이블(ExampleTable) 생성 방법
> 
- Column Name : id, DataType : INT, PK 체크, NN 체크, AI 체크
- Column Name : name, DataType : VARCHAR(45)
- Column Name : address, DataType : VARCHAR(45)

> RDS DB 인스턴스 사용
> 
- 테이블 내용 SELECT 방법
    - 엑셀처럼 데이터 입력 가능

> RDS DB Snapshot
> 
- DB Instance 의 현재 시점의 정보를 snapshot 파일로 생성
- 이후에 Recovery 할 때 활용 가능.

---

# AWS 클라우드 RDS의 사용방법 2

## RDS DB 특정 시점(PiT) 복구

- RDS를 어떤 데이터를 추가/삭제 전으로 복구할 때
- RDS DB 인스턴스 목록에서 마우스 우클릭 → Restore to Point in Time 클릭
    
    

> 복구 옵션
> 
- Use Custom Restore Time
    - MySQL Workbench에서 데이터를 추가하기 이전의 시간으로 설정
- Source DB Instnace
    - 자동 백업을 했던 DB 인스턴스의 이름 표시
- DB Instance Identifier
    - 자동 백업의 특정 시점으로 새로 생성될 DB 인스턴스의 이름, exampledb 인스턴스3를 입력
    

> RDS Instace DB에 로컬에서 접속하기
> 
1. 특정 RDS 선택 후 도메인 이름과 보안 그룹 확인
2. MySQL 포트 허용 및 인바운드 접속 허용 확인
3. MySQL 접속 도구의 Workbench 생성 후 접속 생성
4. 엔드포인트 주소를 복사 후 Hostname에 붙여넣기
5. 패스워드 입력 후 AWS DB 접속
    - 새로운 DB 스키마 및 테이블 생성 가능
    

---

<aside>
💡 1. AWS RDS에서 생성한 DB Instace에 MySQL Workbench로 접속이 안될 때 체크할 부분은?

</aside>

- `Security Group`

<aside>
💡 2. 다음 중 RDS DB 규모 중 스토리지 용량이 가장 높은 것은?

</aside>

- `db.m2.4xlarge`

<aside>
💡 RDS에서 지원하는 데이터베이스 엔진에 해당하는 것은?

</aside>

- MySQL, Microsoft SQL Server, Oracle

---

# 정리하기

## 1. AWS 클라우드 RDS의 개념

- 확장 가능한 관계형 데이터베이스를 제공하며 DB 인스턴스를 손쉽게 생성하고 확장할 수 있는 서비스
- 클릭 몇 번 만으로 손쉽게 DB 인스턴스를 생성/확장/삭제 등이 가능
- MySQL : Community Edition, PostgreSQL, Oracle, Microsoft SQL Server 등 다양한 엔진 지원

## 2. AWS 클라우드 RDS의 사용 방법

- 장애에 대응할 수 있는 이중화르 위한 다중 가용 영역( Multi-AZ) 복제와 고성능 I/O 를 제공하는 Procisioned IOPS Storage를 사용할 것인지 선택
- Security Group 생성 가능
- RDS DB 인스턴스의 생성이 완료되었으면 실제로 생성이 되었는지 확인
    - GUI 도구인 MySQL Workbench 사용
- Snapshot 기능 제공
- 특정시점(Point Time) 복구 기능 제공


---

# 학습 내용 정리

[4회차 AWS 클라우드 RDS 활용](https://velog.io/@topgeun7913/4%ED%9A%8C%EC%B0%A8-AWS-%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C-RDS-%ED%99%9C%EC%9A%A9)

