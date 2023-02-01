## 1.
VS code 프로그램 이용해서 HTML 페이지 하나 만들기

```html
<html>
    <head>

    </head>
    <body>
        
    </body>
</html>
```

- <> 를 태그라고 함.
- `<!—tag—>`는 주석
- utf-8은 한글을 사용할 때 쓰는 것, 아스키코드는 영어를 쓸 때 이용
- 닫는 방법 2가지
    - <meta ~~> <meta/>
    - <meta ~~/>
- <title>~~<title/> → 제목
- 테스트 하는 방법
    - open preview
- Web browser ↔ HTML ↔ Web server
- 127.0.0.1 은 본인의 IP주소 그 뒤에 5500은 번지수

## 2.
**Heading 이해하기**

굵은 글씨로 적고 싶다면 이용하는 것

```html
<html>
    <head>

    </head>
    <body>
        <!--heading h1, h2, --- h6 -->
        <h1>H1입니다.</h1>
        <h2>H2입니다.</h2>
        <h3>H3입니다.</h3>
        <h4>H4입니다.</h4>
        <h5>H5입니다.</h5>
        <h6>H6입니다.</h6>
    </body>
</html>
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7d289f86-4b3f-4f5a-841c-41c751a24fd9/Untitled.png)

---

Link 태그(anchor tag의 attribute, href(hypertext reference))

누르면 링크로 연결되는 것을 만들고 싶다면 이용.

```html
<a href="https://www.google.co.kr"> 구글 </a>
```

---

입력창 만들기

```html
<input type ="text"/>
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/81d9dfe5-7cfa-4f5a-82f5-d6aa7ae89b99/Untitled.png)

---

버튼 만들기

```html
<button> 가입, 가자 </button>
```

- input과 button은 줄바꿈이 없다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/842d333c-13b1-45ee-a2f9-9e78f02fff94/Untitled.png)

---
    
## 3.
그룹화하고 점으로 작성

```html
<html>
    <head>

    </head>
    <body>
        <ol> <!-- unordered list -->
            <li>첫번째</li> <!-- list item-->
            <li>두번째</li> 
            <li>세번째</li>
            <li>네번째</li>
        </ol>
        <ul> <!-- unordered list -->
            <li>첫번째</li> <!-- list item-->
            <li>두번째</li> 
            <li>세번째</li>
            <li>네번째</li>
        </ul>
    </body>
</html>
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c8b0b2e8-be5c-43a5-b048-bcf191243b18/Untitled.png)

ul : unordered list → 순서 없이 list를 만듬

ol : ordered list → 순서 있는 list를 만듬

---

hr: 줄 표시

```html
<hr>
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9c1f8a5e-46b5-4cd3-985f-16151f5621f5/Untitled.png)

---

img 태그

```html
<img src="./grass.jpg" alt="풀깎지 않은 엉망 풍경"> <!-- ./같은 폴더--> <!--alternative, 대체-->
```

- src는 저장된 사진 파일 이름
- alt은 alternative의 줄임말로 사진이 없을 때 대체로 표현될 텍스트
