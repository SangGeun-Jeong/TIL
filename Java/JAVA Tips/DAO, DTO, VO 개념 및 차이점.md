# DAO (Data Access Object)

> 데이터 베이스의 DATA에 접근하기 위한 객체.

DB에서 데이터를 가져오는 작업을 클래스에서 각가 해주게 되면, 

엄청나게 많은 커넥션이 일어나기 떄문에, ConnectionPool을 효율적으로 하기 위해.

DB에 접속하는 전용객체를 만들고 DB와의 연결을 하도록 하는 것.

**데이터베이스 접근을 하기 위한 로직**과 **비즈니스 로직**을 분리하기 위해 사용.

<br />

사용자 → 자신이 필요한 Interface → DAO

DAO → Interface를 구현한 객체 → 사용자

<br />

- DB Connection : DB 접속
- Statement 객체 : 쿼리 준비
- ResultSet 혹은 정수형 변수에 리턴을 담음

<br />

# DTO (Data Transfer Object)

> =VO, 계층 간 데이터 교환을 위한 자바 빈즈(Java Beans)

**데이터베이스 레코드의 데이터를 매핑**하기 위한 데이터 객체.

보통 로직을 가지고 있지 않고,

Data와 Data 에 접근을 하기 위한 **getter, setter**만 가지고 있다.

<br />

⇒ DB에서 Data를 얻어 Service나 Controller 등으로 보낼 때 사용하는 객체.

<br />

# VO (Value Object)

DTO와 혼용해서 쓰지만 다른점은 **각 오브젝트로써 값을 위해** 쓰인다는 점.

자바는 값 타입을 표현하기 위해 불변 클래스를 만들어 사용하는데, 

불변이라는 것은 **read only**특징을 가진다.

<br />

- DTO와 공통점 : 넣어진 데이터를 getter를 통해 사용.
- DTO와 다른 점 : DAO는 가변적인 성격을 가진 클래스(setter 활용), 반면 VO는 불변의 성격
