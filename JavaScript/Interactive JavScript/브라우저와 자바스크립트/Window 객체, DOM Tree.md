# Window 객체

> 전역 객체 Global Object
> 

```jsx
// window: 전역객체 Global Object
console.log(window);
console.log(window.innerWidth);
console.log(window.innerHeight);

window.console.log(window);
window.console.log(window.innerWidth);
window.console.log(window.innerHeight);
```

# DOM

> Document Object Model 문서 객체 모델
> 

DOM을 활용하면 HTML 태그를 객체처럼 자유롭게 활용할 수 있음.

```jsx
// DOM (Document Object Model)
console.log(document);
console.log(typeof document);
console.dir(document);

// DOM (Document Object Model)
const title = document.querySelector('#title');
title.style.color = 'red';
```

# Console.log 와 Console.dir 메소드의 차이

```jsx
const str = 'Codeit';
const num = 123;
const bool = true;
const arr = [1, 2, 3];
const obj = {
  name: 'Codeit',
  email: 'codeit@codeit.kr',
};

function func() {
  console.log('I love Codeit!');
}

console.log('--- str ---');
console.log(str);
console.dir(str);
console.log('--- num ---');
console.log(num);
console.dir(num);
console.log('--- bool ---');
console.log(bool);
console.dir(bool);
console.log('--- arr ---');
console.log(arr);
console.dir(arr);
console.log('--- obj ---');
console.log(obj);
console.dir(obj);
console.log('--- func ---');
console.log(func);
console.dir(func);
```

![Untitled 1](https://user-images.githubusercontent.com/108352215/179678319-5915020b-a455-4e29-ad45-6116d4c31bd3.png)

## 1. 출력하는 자료형이 다르다.

![Untitled 2](https://user-images.githubusercontent.com/108352215/179678321-2b3aee1c-ae22-4f5e-b566-7e5760344b1d.png)

> 문자열, 숫, 불린
> 
- 각 값을 출력할 때 두번째 dir부분에서 출력되는 값의 색이 다름
- dir 메소드는 문자열 표시 형식으로 콘솔에 출력

## 2. log는 값 자체에, dir은 객체의 속성에!

![Untitled 3](https://user-images.githubusercontent.com/108352215/179678323-324370a4-f470-40b1-a9b4-f8d9d51d3739.png)

- log 메소드는 파라미터로 전달받은 값을 위주로 출력, dir 메소드는 객체의 속성을 좀 더 자세히 출력
- dir 메소드는 객체의 유형을 먼저 출력하고, 특히 함수 부분에서는 클릭해서 펼쳤을 때 함수가 가진 속성들을 더 보여주는 모습 확인(log 메소드는 펼쳐지지 않음)

## 3. log는 여러 개, dir은 하나만!

```jsx
console.log(str, num, bool, arr, obj, func);
console.dir(str, num, bool, arr, obj, func);
```

![Untitled 4](https://user-images.githubusercontent.com/108352215/179678327-1006199c-86fc-41a9-8700-b56fbd9ecd1a.png)

- 둘 사이의 차이는 파라미터로 전달할 수 있는 값의 개수도 있음
- log 메소드는 여러값을 쉼표로 구분해서 전달하면 전달받은 모든 값을 출력,
- dir 메소드는 여러값을 전달하더라도 첫 번째 값만 출력

## 4. DOM 객체를 다룰 때…

```jsx
const myDOM = document.body;

console.log(myDOM);
console.dir(myDOM);
```

![Untitled 5](https://user-images.githubusercontent.com/108352215/179678328-f3b7cb8c-dfff-4487-9126-7c9e78639d39.png)

- log와 dir 메소드의 가장 큰 차이는 DOM 객체를 다룰 때 나타남.
- 값에 좀 더 중점을 둔 log 메소드는 대상을 HTML 형태로 출력
- 객체의 속성에 좀 더 중점을 둔 dir 메소드는 대상을 객체 형태로 출력

<aside>
💡 콘솔에서 값 자체를 확인하고 싶다면 log 메소드를, 객체의 속성들을 살펴보고 싶다면 dir 메소드를 활용

</aside>

# DOM 트리

- 요소노드(Element Node)
- 텍스트 노드(Text Node) : 요소노드의 자식노드, 자식노드를 가질 수 없다.

```jsx
// DOM 트리 여행하기
const myTag = document.querySelector('#list-1');

console.log(myTag);

// 형제 요소 노드
console.log(myTag.previousElementSibling);
console.log(myTag.nextElementSibling);

// 부모 요소 노드
console.log(myTag.parentElement);

// 자식 요소 노드
console.log(myTag.children[1]);
console.log(myTag.firstElementChild);
console.log(myTag.lastElementChild);
```

- 노드 중에서도 ‘요소 노드’인 경우에만 존재하는 프로퍼티

> 만약 요소 노드가 아닌 다른 노드들을 이동하고 싶은 경우에는 아래와 같은 프로퍼티를 활용.
> 
- 대부분 요소 노드의 프로퍼티 이름에서 Element라는 단어만 빠짐.
사실 모든 노드가 공통적으로 갖고있는 이 프로퍼티들은 특별한 경우를 제외하면 자주 사용되지 않음.
- 그 이유는 DOM 트리가 만들어질 때 생겨나는 노드들을 좀 더 자세히 살펴보면 알 수 있음.

## DOM 트리를 구성할 때..

브라우저가 HTML 코드를 해석할 때 각 코드들은 상황에 맞게 node를 생성하고 DOM 트리를 구성하는데,

- **HTML 태그**는 **요소 노드**가 되고,
- 문**자들**은 **텍스트 노드,**
- 그리고 **주석**도 **주석 노드**로 DOM 트리에 반영.

```jsx
<!DOCTYPE HTML>
<html>
<head>
  <title>JavaScript</title>
</head>
<body>
  I Love JavaScript
  <!-- I Love Codeit -->
</body>
</html>
```

![Untitled](https://user-images.githubusercontent.com/108352215/179678329-95e65377-29a1-4962-bd62-25de86440d06.png)

- 그런데 텍스트 노드 중에서 붉은 테두리가 있는 부분을 통해 알 수 있듯 태그와 태그사이에 줄 바꿈과 들여쓰기로 인한 띄어쓰기도 **텍스트 노드(Text라고 표시된 부분)**로 생성된 모습을 확인.
- 지금 예시는 간단하기 때문에 어느 정도 DOM 트리를 예상할 수 있지만, 조금만 더 코드가 복잡하거나 혹은 코드의 스타일이 일정하지 않은 경우에는 이런 줄 바꿈과 들여쓰기로 인해 생성된 텍스트 노드의 존재를 파악하기가 쉽지 않을 수 있음.
- 그래서 방금 본, 모든 노드가 공통으로 갖고 있는 프로퍼티를 활용한다면, 예상치 못한 텍스트 노드를 선택하게 되어 의도하지 않은 결과를 만들어 낼 가능성이 커짐.

## **일반적으로 우리가 다루고자 하는 대상은 태그!**

- 자바스크립트로 웹 문서를 다룰 때는 아무래도 텍스트 노드보다는 **`요소  노드`**를 다룰 경우가 더 많음.
만약 의도하는 대상이 HTML 태그라면 `**요소 노드**`에 대한 이동 프로퍼티를 활용하는 것이 훨씬 더 안전.
- 그래도 상황에 따라서는 요소 노드가 아닌 노드들을 이동시켜야할 수도 있으니 모든 노드가 공통으로 갖고 있는 속성들도 잘 기억하기.
