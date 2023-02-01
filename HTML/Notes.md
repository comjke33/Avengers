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
