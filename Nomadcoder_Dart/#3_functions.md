## 3.0 Defining a Function

```dart
void sayHello(String name) {
  print('Hello $name nice to meet you!');
}

String sayHello1(String name) {
  return ('Hello $name nice to meet you!');
}

void main() {
  sayHello('경은');
  print(sayHello1('하영'));
}
```

- 자료형을 앞에 달고 함수명을 지으면 → return 값이 존재
- void 함수이면 → return값이 없어서 바로 실행해야함.
- fat arrow syntax는 ⇒ 화살표 함수로 곧바로 return한다는 뜻이다. 아래의 코드처럼 사용하면 된다.

```dart
String sayHello(String name) => ('Hello $name nice to meet you!');

num plus(num a, num b) => a + b;
void main() {
  print(sayHello('경은'));
  print(plus(1, 2));
}
```

- 화살표 함수는 한 줄 함수일 때 주로 사용된다.

---

⭐⭐⭐(헷갈림)

## 3.1 Named Parameters

- named parameter는 flutter에서 자주 사용된다.
- 함수의 입력인자로 어떤 순서로 무엇이 들어가는지 헷갈릴 개발자를 위해 제공하는 기능이다.
- 원래는 아래 코드처럼 인수의 종류와 순서를 맞게 함수의 입력 인자로 보내야 한다.

```dart
void sayHello(String name, int age, String country) {
  print("Hello $name, you are $age, and you come from $country");
}

void main() {
  sayHello('경은', 21,'South Korea');
}
```

- 입력할 때 어떤 입력 인수인지 적고 함수의 입력 인자 부분에는 중괄호{}로 표현하면 된다.
- 함수 내에 초기값을 주면 null safety 기능에 따라 인수를 전부 주지 않아도 호출했을 때 정상적으로 작동한다.
- 입력인수의 순서를 다르게 줘도 정상적으로 작동한다.

```dart
String sayHello({
  String name = '경은',
  int age = 10,
  String country = 'South Korea',
}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello());
}
```

- 아래는 required modifier를 이용해 필수 값으로 만드는 과정이다.
- 만약 required를 붙여서 입력인자로 받도록 해두었는데, 함수의 입력인자로 필요한 값이 모두 오지 않으면 컴파일 오류가 난다.

```dart
String sayHello({
  required String name ,
  required int age,
  required String country,
}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello(
    age:14,
    name: '하영',
    country: 'South Korea',
  ));
}
```

---

## 3.2 Recap

parameter

- positional parameter
- named parameter

---

## 3.3 Optional Positional Parameters

- 함수의 입력인자 중 일부는 default로 주고 나머지는 받은 정보로 처리하는 방법이다.

```dart
String sayHello(String name, int age, [String? country = 'South Korea']) =>
    'Hello $name, you are $age years old from $country';

void main() {
  var results = sayHello('경은', 21);
  print(results);
}
```

- 위와 같이 입력인자를 2개만 순서에 맞춰 주면, 나머지 인자는 default값으로 이용된다.
- 하지만 이런 방식은 거의 사용되지 않는다.

---

## 3.4 QQ Operator

- null이 포함될 수 있는 문자열을 대문자로 바꿔서 출력하는 코드

```dart
String capitalizeName(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return '경은';
}

void main() {
  print(capitalizeName('kyeongeun'));
}
```

- 더 짧은 코드로 작성하였다. 조건 ? 참일 때 : 거짓일 때;

```dart
String capitalizeName(String? name) => name != null ? name.toUpperCase() : '경은';

void main() {
  print(capitalizeName('kyeongeun'));
}
```

- 아래와 같이 QQ operator를 사용하여 더 짧게 작성하였다.
- name이란 변수명 뒤에 ?를 붙여준 이유는 메소드 실행 전 변수가 null일 경우를 고려해서 null이 아니었을 조건을 규정해주어야하기 때문이다.
- `변수명.메소드() ?? 거짓일 때 반환값` : 변수가 null이 아닐 때 toUpperCase() 메소드를 실행한 결과를 반환하고 null일 때는  거짓일 때의 값을 반환한다.

```dart
String capitalizeName(String? name) => name?.toUpperCase() ?? '경은';

void main() {
  print(capitalizeName('kyeongeun'));
}
```

- ??는 null일 때의 삽입할 값을 정할 수 있다.

```dart
void main() {
  String? name; //null일 수도 있는 문자열 선언
  name ??= 'kyeongeun'; //null이면 kyeongeun을 넣음
  name ??= 'another'; 
  //오류가 발생하는 이유
  //바로 윗 코드에서 이미 name에는 값이 꼭 들어가기 때문에
  //이 코드는 절대 실행되지 않기 때문이다.
}
```

---

## 3.5 Typedef

- 자료형이 헷갈릴 때 별명을 짓는 것
- `typedef 자료형별명 = 자료형` 형식으로 선언하면 된다.
- toList() 메소드를 이용하는 이유는 List를 reversed 메소드를 이용해서 반전시킨 이후에 literable이라는 배열 일반화 객체로 선언되기 때문에, 다시 List 자료형으로 변환하는 과정이 필요하다.

```dart
typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}

void main() {
  print(reverseListOfNumbers([1, 2, 3]));
}
```

- Map의 String, String을 typedef로 선언하고 싶을 때 이렇게 작성한다.

```dart
typedef UserInfo = Map<String, String>;
String sayHi(UserInfo userInfo) {
  return "Hi ${userInfo['name']}";
}

void main() {
  print(sayHi({"hi there":"kyeongeun"}));
}
```
