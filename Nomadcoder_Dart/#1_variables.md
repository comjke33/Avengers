## 1.0 Hello world

- main 함수는 코드에서 처음으로 실행되는 부분이다.
- 없다면 오류가 나타난다.
- 파이썬과 문법이 비슷하지만 세미콜론이 있어야한다는 점이 특징이다.
- 세미콜론이 있어야하는 이유는 cascade operator와 밀접한 연관이 있다.

---

## 1.1 The Var Keyword

- dart에서 변수를 만드는 방법
    1. 비(非)명시적 변수 선언
    
    ```dart
    void main() {
      var name = '안녕';
      // 옳지 않은 예시
      // name = 1;
      // name = true;
      // name = false;
    }
    ```
    
    - dart에서는 변수 타입을 특정하지 않아도 변수 안에 들어간 값을 통해 string이라는 변수 타입을 예측한다.
    - 그래서 var name을 문자열의 값과 함께 선언했을 때, int나 bool 타입의 값을 업데이트하면 오류가 발생한다.
    1. 명시적 변수 선언
    
    ```dart
    void main() {
      String name = '안녕';
    }
    ```
    
- 함수나 메소드 내부에 지역 변수를 선언할 때 → var
- class에서 변수나 property를 선언할 때 → 타입 지정 (명시적 변수 선언)

---

## 1.2 Dynamic type

- dynamic은 여러 가지 타입을 가질 수 있는 변수

```dart
void main() {
  var name;
  name = '안녕';
  name = 12;
  name = true;
}
```

- 이렇게 다른 타입의 값을 업데이트해도 오류가 발생하지 않는다.
- dynamic이라고 명시적 변수 선언을 해도 옳다.

```dart
void main() {
  dynamic name;
  if(name is String){
    
  }
}
```

- if문 내에 `name is 특정타입`을 사용하면 이 조건문 안에서는 name이란 변수가 `특정 타입`일 때를 가정해서 다양한 메소드를 사용하게 해준다.

---

## 1.3 Nullable Variables

- dart의 null safety은 원래 없던 기능이다.
- 개발자가 null를 참조할 수 없게 하는 기능이다.

```dart
void main() {
  String? name = '안녕';
  name = null;
  if (name != null) {
    name.isNotEmpty;
  }
}
```

- 원래 null은 참조할 수 없다. 그런데, 변수가 null도 가질 수 있게 하려면 변수 타입 뒤에 물음표(?)를 붙이면 된다.
- 그러면 내가 만든 변수 안에 null이 들어갈 수 있고, 조건문에서도 변수에 들어간 값을 참조해 null을 읽어들일 수 있다.
- 모든 변수의 값은 기본적으로 non-nullable이라서 null이 될 수 없다.
- 변수의 메소드를 사용할 때, 아래와 같이 null이 아닌 값만을 이용하고 싶으면 변수 뒤에 물음표(?)를 사용하면 된다. (위의 코드와 같은 뜻)

```dart
void main() {
  String? name = '안녕';
  name = null;
  name?.isNotEmpty; // name이 null이 아닐 때 
}
```

- null safety 기능은 API에서 data를 가져올 때 주로 사용된다.

---

## 1.4 Final Variables

- Final은 javascript의 const와 같다.
- 처음에 대입한 후에 업데이트할 수 없게 한다.
- 변수 타입과 함께 선언해도 된다.

```dart
void main() {
  final name = '안녕';
  final String name1 = '안녕';
  // 오류 발생 (재선언)
  // name = '안녕';
}
```

---

## 1.5 Late Variables

- late는 final이나 var 앞에 붙여줄 수 있는 수식어이다.
- 변수 선언할 때 데이터를 넣지 않고 나중에 데이터를 받는다는 뜻이다.

```
void main() {
  //옳은 코드
  late final name;
  name = '안녕';
  print(name);
}
```

- 그래서 변수 선언 후 값을 업데이트해야지 이 변수가 활성화된다.
- 따라서 아래와 같은 코드는 사용할 수 없다.
- 개발자의 실수를 방지할 수 있다. (null safety와 비슷한 기능이다)

```
void main() {
  //옳지 않은 코드
  late final name;
  print(name);  
}
```

- 이 기능은 flutter로 data fetching을 할 때 유용한 기능이다.

---

## 1.6 Constant Variables

- javascript의 const는 dart의 final과 비슷하다.
- 그러나 dart의 const와는 같지 않다.
- dart의 const는 compile-time constant를 만들어준다.
- const는 앱스토어에 올리기 전에 이미 알고 있는 값을 상수값으로 정의한다.
- 예를 들어 API를 통해 받아와야하는 값처럼 지금 당장 알 수 없는 값은 final이나 var로 선언해야하고 const로 선언하는 것은 불가능하다.
- 컴파일러가 알고 있는 값을 const로 선언해야한다.
- 사용자가 입력해야 값이 추가되는 경우도 final이나 var로 선언해야한다.

```dart
void main() {
  const key = '121212';
  //옳지 않은 코드
  //const API = fetchAPI();
}
```

---

## 1.7 Recap

- dynamic은 자주 사용하는 것이 권장되지 않는다.
