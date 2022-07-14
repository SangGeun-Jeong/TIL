# CSS 선택자로 태그 선택하기.

```jsx
// css 선택자로 태그 선택하기
// id
const myTag = document.querySelector('#myNumber');
console.log(myTag);

// class
const myTag2 = document.getElementById('myNumber');
console.log(myTag2);

// class -> 가장 첫번째 요소 선택.
const myTag3 = document.querySelector('.color-btn');
console.log(myTag3);

// class -> NodeList라는 유사배열 콘솔에 출력. 여러 요소 선택
const myTags1 = document.querySelectorAll('.color-btn');
console.log(myTags1);

// html -> HTMLCollection
const myTags2 = document.getElementsByClassName('color-btn');
console.log(myTags2);
```

- querySelector 가 하나의 요소에 접근하므로, 사용 빈도수가 높음!

> querySelectorAll 을 사용할 때 존재하지 않는 요소를 선택하면 비어있는 NodeList 리턴.
> 
> 
> querySelector 메소드는 getElementyBy와 동일하게 null값 리턴.
> 

> 다음과 같은 결과를 나타내는 코드
> 

```jsx
<li id="javascript" class="language">JavaScript</li>
```

```jsx
console.log(document.querySelectorAll('.language')[0]);
console.log(document.querySelector('#list li');
console.log(document.querySelector('.language'));
```

---

# 이벤트와 버튼 클릭

```jsx
// 이벤트(Event)와 버튼 클릭
const btn = document.querySelector('#myBtn');

// 이벤트 핸들링(Event Handling)
btn.onclick = function() { // 이벤트 핸들러(Event Handler)
	console.log('Hello Codeit!');
};
```

- 이벤트 핸들러는 HTML 태그에서도 사용가능

```jsx
<button id="myBtn" onclick="console.log('Hello JS!')">Click!</button>
```

- 하지만 코드의 가독성이 안좋아지고, 코드가 섞이게 되어 코드의 일관성을 잃어 유지보수가 어려워짐.
