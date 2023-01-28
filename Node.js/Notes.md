## 1.

Front-end(프론트엔드) : HTML, CSS, JAVASCRIPT

Back-end(백엔드): Java, SpringFrame, ASP, NET, C#

Node.js란?

- Chrome Js 안에 V8 engine이 있는데, 이것을 밖으로 꺼내서 자유롭게 활용하는 것

## 2.

DB에 SQL로 접근해서 서버를 구축할 수 있는 방법

1) java→webserver

2) (new!) node.js

FE + BE ⇒ Full Stack Engineer

- micro server도 생김
- full stack engineer가 모두 맡아서 진행할 수 있게 됨.

```jsx
console.log('Hello, node.js') 
```

- `ctrl + `` ⇒ terminal에서 node.js를 실행하는 방법
- `dir` : 파일 목록
- `node —version` : node.js 버전 확인

## 3.

### function

```jsx
function sayHello(name){
	console.log('Hello '+name)
}
sayHello('John')
sayHello('Alice')
```

- 이름 부르며 인사하는 함수

```jsx
const v = 10
if(v>5){
	console.log('It is a big number')
}
else{
	console.log('작은 숫자야!!')
}
```

- 나이가 많으면 많다고 말해주는 함수

```jsx
setInterval(() => {
	console.log('Node.js 연습 중입니다...)
},3000);
```

- 밀리세컨드 단위로 몇 밀리초마다 한번씩 실행하는 함수

```jsx
setTimeout(() => {
	console.log('타임아웃, 한번만 실행')
},3000)
```

- 밀리세컨드 단위로 몇 밀리초 후에 딱 한번 실행하고 마는 함수.

### Module

```jsx
function showLogMessage(msg) {
	console.log('----------------------')
	console.log('로그 메세지는 '+$(msg))
	console.log('----------------------')
}
module.exports.showLogMessage = showLogMessage
```

- logger.js 라는 파일에 있는 함수를 사용하고 싶다면!
- module를 다른 곳에서 열람하고 싶다면… `module.exports.함수이름 = 함수이름`

## 4.

### 모델을 불러오는 방법

```python
const logger = require('./logger.js')
logger.showLogMessage('모듈에 대한 테스트 중입니다.')
```

- `require(’파일명’)` : 모듈 불러오기
- `express` 모듈은 웹서버를 구축할 때 사용하면 좋을 모듈

### 또 다른 함수 생성

```jsx
function showLogMessage(msg) {
	console.log('----------------------')
	console.log('로그 메세지는 '+$(msg))
	console.log('----------------------')
}

function showLogMessage2(msg){
	console.log('---------------------')
	console.log('로그 메세지는: $(msg)')
	console.log('---------------------')
}

const precious_value = 78

module.exports.showLogMessage = showLogMessage
module.exports.secondLog = showLogMessage2
module.exports.pvalue = precious_value
```

```python
const logger = require('./logger.js')

logger.showLogMessage('첫번째 로그메세지') # string형
logger.secondLog('두번째 로그메세지') # string형
console.log('Logger 모듈에 들어있는 소중한 값은: '+logger.pvalue) # int형
```

`module.exports.내가원하는명 = 함수 이름`

→ (중요) 함수 이름으로 불러와도 사용불가능!

## 6.

npm 설치 후 시작!

`npm init -y` : 정보 보기

`npm install express —save` : express 모듈 설치

`cd node_modules` : 모듈에 대한 정보를 볼 수 있음.

package.json : `“이름” : “version”` 

version 정보를 저장해둔 것 → package.json

다른 컴퓨터에 node.js 프로젝트를 옮길 때는 `package.json`과 `package-lock.json`을 그대로 옮기면 된다.

## 7.

```jsx
const express = require('express') //npm install express --save
const app = express() //express라는 함수를 app으로 받음
app.listen(3000)

```
