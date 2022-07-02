# 📌 Final

- 변수, 메서드, 클래스에 사용
- 어떤 곳에 사용되냐에 따라 다른의미를 가지며, 무언가를 제한한다는 의미를 가짐.
- 한 번 값을 넣어두면 절대 바뀌지 않음.

<br />

# Final 클래스

**Final이 붙어있는 클래스는 상속할 수 없음. 보안이나 효율성 측면에서 장점**

```java
public final class MyFinalClass {...} // final 클래스 선엄

public class ThisIsWrong extends MyFinalClass {...} // 상속 불가!
```

<br />
# Final 메서드

**어떤 클래스를 상속하는데 그 안에 final 메서드가 있다면, 오버라이딩으로 수정 할 수 없음**

```java
public class Base
{ 
		public void m1() {...}
		public final void m2() {...} // final 메서드 선언
}

public class Derived extends Base
{
		public void m1() {...} // Base 클래스의 m1() 상속
		public void m2() {...} // 오버라이딩, 즉 상속받은 메서드 수정 불가!
```
<br />

# Final 변수

**해당 변수가 생성자나 대입 연산을 통해 한번만 초기화 됨을 의미하며, 상수 값을 만들 때 주로 사용**

> 선언방법
> 
1. 필드 선언시에 초기값 선언
2. 생성자를 통해서 초기값 부여
    1. 복잡한 초기화 코드가 필요하거나,
    2. 객체 생성시에 외부 데이터로 초기화를 해야할 때
    
    ⇒ 생성자는 final 필드의 최종 초기화를 마쳐야 하는데, 만약 초기화가 되지 않은 final 필드가 있다면 `컴파일 에러`가 발생.
    

```java
final int number = 1; // final 타입 필드 [=초기값]
```

```java
public class Sphere {
		// PI 변수는 상수로 선언되어 수정할 수 없음
		public static final double PI = 3.1459235353524;

		public final double radius;
		public final double xPos;
		public final double yPos;
		public final double zPos;

		Sphere(double x, double y, double z, double r) {
				radius = r;
				xPos = x;
				yPos = y;
				zPos = z;
		}
		
		[...]
}
```

⇒ **final 변수는 한번 값을 할당하면 수정할 수 없음, 즉 초기화는 한번만 가능!**

```java
public class Test {
		//선언만 하고 초기화는 각 인스턴스에서 진행
		private final int value;
		
		public Test(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
}
```

> 이렇게 먼저 선언해놓고 각각 다른 값을 갖도록 초기화 할 수 도 있음.
> 
> 
> 물론 이렇게 한 번 값을 할당하면 다음부터는 수정할 수 없음.
> 
> 이러한 형태를 `blank final` 변수라고 함.
> 

- 원시 타입에 대한 final
    
    원시타입의 값에 재대입 불가!
    
    
```java
public void finalTest() {
		final int x = 10;
		// x = 11; => 컴파일 에러, 원시타입의 값에 재대입 불가
}
```
