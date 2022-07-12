# Id로 태그 선택하기

```java
// id로 태그 선택하기
const myTag1 = document.getElementById('myNumber');
console.log(myTag1);

const myTag2 = document.getElementById('btns');
console.log(myTag2);

const myTag3 = document.getElementById('codeit');
console.log(myTag3);
```

- 존재하지 않는 Id를 가져오려고 하면 null 값.

<br />

---

<br />

# Class로 태그 선택하기

```java
const myTags1 = document.getElementsByClassName('color-btn');
console.log(myTags1);
console.log(myTags1[1]);
console.log(myTags1.length);

for (let tag of myTags1) {
	console.log(tag);
}

const myTags2 = document.getElementsByClassName('red');
console.log(myTags2);
console.log(myTags2[0]);

const myTags3 = document.getElementsByClassName('white');
console.log(myTags3);
console.log(myTags3 === null);
console.log(myTags3.length);
```

- 여러 태그를 한번에 선택할 때 유용
- 존재하지 않는 class를 가져오려고 하면 [ ] 빈 배열이 가져와짐.
- 유사배열(HTMLCollection) : 형태는 유사하지만 배열의 메소드는 사용하지 못하는 것을 묶어서 칭함.
- red 하나만을 가져오려고 하면, 요소 한개가 들어있는 HTMLCollection이 가져와짐,
    - 따라서 인덱스 접근을 통해 원하는 태그에 접근해야함.

<br />

---

<br />

# 유사배열(Array-Like Object) 이란?

<aside>
💡 배열과 모양은 같지만, 완벽히 배열은 아닌 배열과 유사한 객체,

</aside>

## 1. 숫자 형태의 indexing이 가능하다.

![화면 캡처 2022-07-12 112843](https://user-images.githubusercontent.com/108352215/178395545-7c851c8b-2201-4b14-96de-d804968919e5.png)

- 배열은 각 요소에 0부터 순서대로 매겨진 index를 통해 요소끼리의 관계도 파악할 수 있고 그 index를 통해 요소에 접근할 수 있음. ⇒ indexing
- 유사배열도 index 존재.

## 2. length 프로퍼티가 있다.

- 유사배열도 객체가 가지고 있는 요소의 갯수를 저장하는 `length` 프로퍼티 존재.
- 숫자 형태의 index가 있더라도 `length` 프로퍼티가 없으면 유사배열 이라기보단 그냥 숫자 형태의 key로 구성된 일반객체

## 3. 배열의 기본 메소드를 사용할 수 없다.

- 유사배열의 가장 큰 특징.
- indexing을 통해 유사배열의 요소에 접근하는 건 쉽지만 수정하거나 삭제하는 작업은 까다로움.
- 따라서 내부의 요소들은 배열처럼 다룰 수 있게 하면서, 배열의 메소드 사용을 막고 싶거나, 혹은 일반 배열에는 없는 특별한 메소드를 제공하고 싶을 때 유사 배열을 만들어 활용.

## 4. Array.isArray(유사배열)은 false다.

![화면 캡처 2022-07-12 112900](https://user-images.githubusercontent.com/108352215/178395542-177bd65a-77ac-41dd-9b43-20cfdd358662.png)

- Array 객체의 `isArray` 메소드는 파라미터로 전달한 값이 배열인지 아닌지를 평가 후 불린 형태의 값으로 리턴.
- 유사배열은 결괏값이 false.

## 주의사항 : 유사 배열은 다양하다!

> 유사배열은 다양한 형태로 존재.
> 
> 
> 어떤 경우는 HTMLCollection의 경우 for..of 문이 사용가능하지만 안되는 경우도 존재.
> 
> 배열의 기본메소드를 사용하지 못하지만, 직접 구현으로 배열처럼 사용할 수 도 있음.
> 
> 하지만 직접 구현이 아닌 이미 만들어진 유사배열에 접근하는 경우엔 위 4가지 특징을 다가지고 있으므로 참고하기.
> 

<br />

---

<br />


> 질문 1. class 속성을 통해 태그를 선택하는 방법
> 
- `document` 객체의 `getElementByClassName` 메소드를 활용하면 `class` 속성을 통해 태그 선택 가능.
- `getElementsByClassName` 메소드로 태그를 선택하면 여러개의 요소들의 묶음이기 때문에 일반적인 배열로 다룰 수 없음(유사배열)
- 태그들 순서는 깊이와 관계없이 위에서부터 차례대로.
- 존재하지 않는 class 값으로 태그를 선택하면 그 값은 빈 `HTMLCollection`이 됨.

> 질분 2. 다음의 코드 결과로 올바른 것.
> 

```java
const members = document.getElementsByClassName('member');

for (let i = 1; i < members.length; i++) {
  if (i % 2 == 0) {
    console.log(members[i]);
  }
}
```

⇒ 인덱스 2, 4, 6 일대 해당 index에 있는 요소 출력.

(유사배열도 Length를 가진다는 것 시사)

<br />

---

<br />

# 태그 이름으로 태그 선택하기

```jsx
document.getElementsByTagName('태그이름')

const btns = document.getElementByTagName('button');
```

> HTML 문서 내에 있는 모든 `button` 태그 선택.

- **`document.getElementsByClassName('class')`** 메소드와 마찬가지로 태그 이름으로 요소를 찾는 경우에 여러 개의 요소가 선택될 수 있기 때문에 메소드 이름에 **`Element(s)`**, *s* 가 있고, 실행결과 역시 HTMLCollection을 리턴.

> ‘ * ‘ 값을 전달하면 모든 태그 선택
> 

```jsx
const btns = document.getElementsByTagName('button');
const allTags = document.getElemntsByTagName('*');
```

- CSS 스타일링 시 에도 태그 이름으로 스타일링 하는 경우 없음.
- 명확한 의도가 없이 이렇게 많은 요소들을 한꺼번에 다루면, 예상치 못한 실수를 할 수 있는 가능성이 있어 사용 빈도 적음.
