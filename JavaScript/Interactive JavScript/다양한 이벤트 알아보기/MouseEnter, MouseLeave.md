# MouseEnter, MouseLeave

마우스 이벤트 타입에는 **`mouseover, mouseout`**과 비슷한 **`mouseenter`**와 **`mouseleave`**라는 타입이 있습니다.

이름에서도 알 수 있듯이 
**`mouseenter`**는 **`mouseover`**처럼 **마우스 포인터가 요소 바깥에서 안쪽으로 들어갈 때**, **`mouseleave`**는 **`mouseout`**처럼 **마우스 포인터가 요소 안쪽에서 바깥으로 나갈 때** 발생하는데요.

그럼 **`mouseover, mouseout`**과 어떤 차이가 있을까요?

일단 아래의 결과보기 버튼을 눌러서 코드를 한 번 실행해 봅시다.

```html
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>JS with Codeit</title>
  </head>
  <body>
    <div id="box1" class="box">
      <b class="title">mouseover event count: 0</b>
    </div>

    <div id="box2" class="box">
      <b class="title">mouseenter event count: 0</b>
    </div>
    <script>
      const box1 = document.querySelector('#box1');
      const box2 = document.querySelector('#box2');

      let mouseenterCount = 0;
      let mouseoverCount = 0;

      box1.addEventListener('mouseover', function () {
        mouseenterCount++;
        const msg = `mouseover event count: ${mouseenterCount}`;
        box1.lastElementChild.textContent = msg;
      });

      box2.addEventListener('mouseenter', function () {
        mouseoverCount++;
        const msg = `mouseenter event count: ${mouseoverCount}`;
        box2.lastElementChild.textContent = msg;
      });
    </script>
  </body>
</html>
```

```css
.box {
  display: inline-block;
  width: 200px;
  margin: 20px;
  padding: 60px 35px;
}

#box1 {
  background-color: #B6FFAA;
}

#box2 {
  background-color: #ACFFFC;
}

.title {
  display: inline-block;
  padding: 20px;
  font-size: 18px;
  text-align: center;
  background-color: #FFFFFF;
  border: 1px solid #333333;
}
```

<img width="700" alt="스크린샷 2022-08-01 오후 10 54 29" src="https://user-images.githubusercontent.com/108352215/182163857-3fdd1ee3-d637-4fc8-af54-7fb50e0ea3fa.png">

위 코드에서는 **`mouseover`**와 **`mouseenter`**를 비교했지만, **`mouseout`**과 **`mouseleave`**의 관계도 동일하다는 점 참고해주세요! :)

아무튼, 이 둘의 차이를 살펴봅시다.

# **1. 버블링이 일어나지 않는다.**

**`mouseenter`**와 **`mouseleave`**는 **버블링이 일어나지 않습니다.**

위 코드 결과에서 **`mouseover`** 타입으로 이벤트 핸들러가 등록된 **`div#box1`**요소(왼쪽)에서 마우스를 움직여 보세요.

당연히 해당 요소 바깥에서 안쪽으로 마우스 커서가 이동할 때도 이벤트가 발생하지만, **버블링과 이벤트 위임**의 원리로 자식요소인 **`b.title`** 부분으로 마우스 커서가 이동할 때도 이벤트가 발생합니다.

하지만 **`mouseenter`** 타입으로 이벤트 핸들러가 등록된 **`div#box2`**요소(오른쪽)에서는 해당 요소 바깥에서 안쪽으로 마우스 커서가 이동할 때만 이벤트 핸들러가 동작하는 모습을 확인할 수 있습니다.

# **2. 자식 요소의 영역을 계산하지 않는다.**

**`mouseenter`**와 **`mouseleave`**는 **자식 요소의 영역을 계산하지 않습니다.**

다시 **`mouseover`** 타입으로 이벤트 핸들러가 등록된 **`div#box1`**요소(왼쪽)에서 마우스를 움직여 봅시다.

버블링에 의해 자식 요소로 마우스 커서가 이동할 때도 이벤트 핸들러가 동작하지만, 자식 요소에서 다시 **`div#box1`**요소로 마우스 커서가 이동할 때도 이벤트 핸들러가 동작하죠? **`mouseover`**는 자식 요소의 영역을 구분하기 때문입니다.

반면, **`mouseenter`**는 자식 요소의 영역을 구분하지 않기 때문에 **`mouseenter`** 타입으로 이벤트 핸들러가 등록된 **`div#box2`**요소(오른쪽)에서는 자식 요소에서 이벤트 핸들러가 동작하지 않는 것뿐만 아니라 자식 요소의 영역에 들어갔다 나올 때도 이벤트 핸들러가 동작하지 않는 모습을 볼 수 있습니다.

# **정리**

**`mouseover/mouseout`**과 비교하면서 **`mouseenter/mouseleave`**에 대해 살펴봤는데요.
간단하게 정리하면, **이벤트가 자식 요소에 영향끼치는지**가 둘의 가장 큰 차이라고 할 수 있습니다.

그래서 이벤트 핸들러가 자식 요소에까지 영향을 끼치게 하고싶은 경우에는 **`mouseover/mouseout`**을, 자식 요소에는 영향을 끼치지 않고 해당 요소에만 이벤트 핸들러를 다루고자 한다면 **`mouseenter/mouseleave`**를 활용하면 좋겠죠?
