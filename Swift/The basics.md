# Swift - The basics

<br />

Swift는 C언어 기반으로 제공하는 언어.

- 자료형 : Int, Double, Float, Bool, String
- Collection Types : Array set, Dictionary

변경할 필요가 없는 값으로 작업할 때 코드를 더 안전하고 명확하게 만드는 Swift.

옵셔널은 Objective-C의 nil 포인터보다 더 안전하고 표현력이 높을 뿐만 아니라 Swift의 가장 강력한 기능의 핵심.

`Type-safe language`  [Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)

<br />

---

<br />

# Constants and Variables

- Constants(상수) : 변하지 않는 값
- Variables(변수) : 변하는 값.

```swift
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
```

ex) 로그인 제한 횟수는 10으로 고정이고, 로그인 시도 횟수는 시도할 때마다 바뀌어야 한다.

> 같은 성격의 변수 한번에 선언하기.
> 

```swift
var x = 0.0, y = 0.0, z = 0.0
```

**상수는 꼭 `let` 을 사용해서 선언해야함*

<br />

---

<br />

# Type Annotations

해당 상수 or 변수가 어떤 value를 가지는 지 콜론(`:`)을 사용해서 작성

> “Declare a variable called `welcomeMessage` that’s of type `String`.”
> 

```swift
var welcomeMessage: String
welcomeMessage = "Hello"
```

> 같은 타입의 변수 여러개 한줄에 선언
> 

```swift
var red, green, blue : Double
```

상수 or 변수를 사용할 때 타입을 바로 알 수 있어 안전하고 명확함.

[Type Safety and Type Inference](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID322)

<br />

---

<br />


# Naming Constants and Variables

여러가지 character,와 유니코드 character를 이름으로 사용할 수 있음.

```swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
```

> Naming Rule
> 
- 공백 문자, 수학 기호, 화살표, 전용 유니코드 스칼라 값 또는 선 및 상자 그리기 문자
- 숫자로 시작(X)
- 한번 선언하면 같은 이름으로 선언하거나 다른 유형의 값 저장하도록 변경 못함.
- 변수 to 상수, 상수 to 변수 안됨.
- Swift 예약어를 불가피하게 이름으로 써야 한다면 backtics(`)으로 선언가능. (비추)

> var는 값변경 가능, let 은 불가능.
> 

```swift
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!"

let languageName = "Swift"
languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed.
```

<br />

---

<br />

# Printing Constants and Variables

`print(_:separator:terminator:)`

```swift
print(friendlyWelcome)
// Prints "Bonjour!"
```

- 콘솔 창에 값을 출력
- 기본적으로 함수는 줄 바꿈을 추가하여 인쇄하는 줄을 종료.
- 뒤에 줄 바꿈 없이 값을 인쇄하려면 빈 문자열을 종결자로 전달.
    - `print(someValue, terminator : “”)`
    - [Default Parameter Values](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID169)

> String Interpolation (문자열 보간)
> 
- 백슬래시(\)와 괄호를 사용해서 문자열 안에 변수를 넣을 수 있음.
- [String Interpolation](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#ID292)

```swift
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!"
```

<br />

---

<br />

# Comments

> 주석 처리 방법
> 
- 주석안에 second 주석을 넣을 수 있음.

```swift
// This is a comment.

/* This is also a comment
but is written over multiple lines. */

/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */
```

<br />

---

<br />

# Semicolons

작성 안해도 되지만, 한줄에 여러 코드를 작성할 때는 필요함.

```swift
let cat = "🐱"; print(cat)
// Prints "🐱"
```

<br />

---

<br />

# Integers

Whole Numbers(정수), no fractional component(분수), signed(-, 0, +) or unsigned(positive or zero)

signed and unsigned integers in 8, 16, 32, and 64bit forms.

- `UInt8` : 8-bit unsigned Integer
- `Int32` : 32-bit signed Integer

**these integer types have capitalized names.*

## Integer Bounds

> min 과 max를 활용해서 최소, 최댓값 표현
> 
- 동일한 유형의 다른 값들과 함께 표현식에서 사용 할 수 있음.

```swift
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
```

## Int

> Int를 사용하면 현재 플랫폼의 기본 단어 크기와 같음.
> 
> 
> 특정 크기의 정수로 작업하지 않는 다면 Int를 사용.
> 
- On a 32-bit platform, `Int` is the same size as `Int32`.
- On a 64-bit platform, `Int` is the same size as `Int64`.

**32비트 플랫폼에서도 Int는 -2,147,483,648에서 2,147,483,647 사이의 모든 값을 저장, 많은 정수 범위에 대해 충분히 큼.*

## UInt

> UInt도 현재 플랫폼의 기본 단어와 크기가 같음
> 
- On a 32-bit platform, `UInt` is the same size as `UInt32`.
- On a 64-bit platform, `UInt` is the same size as `UInt64`.

**꼭 unsigned이어야 하지 않는 다면 Int 사용을 권장. 저장할 값이 nonegative 일 경우에도*

<br />

---

<br />

# Floating-Point Numbers

`a fractional component` : 실수

- `Double` represents a 64-bit floating-point number.
- `Float` represents a 32-bit floating-point number.

Double은 최소 15자리의 정밀도를 갖는 반면 Float의 정밀도는 6자리만큼 작을 수 있음.

작업하기에 적절한 크기를 고려하여 type을 결정하고, 비슷한 상황에서는 `Double`이 선호됨.

<br />

---

<br />

# Type Safety and Type Inference

> Type과 Value를 명확하게 표기해야함.
> 
> 
> flags any mismatched types as errors 로 type을 체크하고 컴파일 하므로, 개발 중에 에러를 빠르게 잡을 수 있음.
> 
> 타입을 분명하게 하지 않는 다면 Swift 자체적으로 type inference(유형 추론)을 하여 적절한 타입으로 작업.
> 
> Type Inference는 컴파일 할때 자동으로 적절한 표현을 통해 추론.
> 
> 다른 언어에 비해 type declaration이 적음.
> 
> 상수와 변수는 여전히 명시적으로 유형이 지정되지만 유형을 지정하는 작업의 대부분은 자동으로 수행.
> 

> 타입을 입력하지 않고 초기값을 설정하면 자동으로(입력한 값으로 추론) 타입이 지정됨.
> 

```swift
let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int

let pi = 3.14159
// pi is inferred to be of type Double
```

> 타입을 섞어서 입력하면 더 큰 범위로 타입이 추론됨.
> 
- 주로 `Double` 로 선언됨 (rather than Float)

```swift
let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double
```
