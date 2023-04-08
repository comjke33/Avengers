## 4.0 Your First Dart Class

- 모든 것이 Class고 많이 쓰일 것이다.
- 다른 언어와 Class가 어떻게 다른지도 숙지해야한다.
- function 내에서 변수를 사용하기 위해 var처럼 타입을 명시하지 않아도 되었었던 것과 달리, Class에서는 property를 선언할 때 꼭 타입을 명시한다.
- Class 선언 후 새로운 class 변수를 선언할 때, new를 붙여도 되고 안 붙여도 된다.
- 만약 class 내의 변수를 한번만 대입하고 다시 업데이트하지 못하게 하려면 class 선언하는 부분 내의 객체에 final를 붙여주면 된다.
- class 내에서 새로운 함수를 선언할 수 있다.
    - 만약에 class 내의 변수인 name를 사용하고 싶으면 ${this.name}로 사용하면 된다.
    - 하지만 딱히 함수 내에서 선언된 변수와 이름이 겹치지 않는다면 this를 적지 않아도 알아서 class 내의 변수를 사용한다.

```dart
class Player {
  final String name = '경은';
  int xp = 1500;
  void sayHello() {
    var name = 'none';
    print("Hi my name is ${this.name}");
  }
}

void main() {
  var player = new Player();
  player.sayHello();
}
```

---

## 4.1 Constructors

- class에 정해진 값이 아니라 동적으로 자유롭게 값을 넣기 위해 아래와 같은 코드를 작성했다.
- 데이터를 나중에 받을 때 지금처럼 late를 사용하면 된다.

```dart
class Player {
  late String name;
  late int xp;
  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }
	//같은 동작을 수행한다.
	//Player(this.name, this.xp); 
  void sayHello() {
    var name = 'none';
    print("Hi my name is ${this.name}");
  }
}

void main() {
  var player1 = new Player("경은", 1000);
  player1.sayHello();
  var player2 = new Player("하영", 1000);
  player2.sayHello();
}
```

- 위의 코드의 대입 부분이 너무 길어서 `Player([this.name](http://this.name/), this.xp);`로 대신할 수도 있다.
- 이미 자료형에 대한 정보는 있기 때문에 알아서 순서에 맞게 넣어준다.

---

## 4.2 Named Constructor Parameters

- class 변수를 선언할 때 입력인수가 어떤 것인지 알기 어렵기 때문에, 어떤 종류인지 지정하면서 key:value로 선언한다.
- 전에 named parameter처럼 중괄호 {}로 묶고 문자열이 null일 때를 대비해서 required로 선언해주면 된다.

```dart
class Player {
  final String name;
  late int xp;
  String team;
  int age;
	// 아래 부분을 Named Constructors Parameters라고 한다.
  Player({required this.name, required this.xp, required this.team, required this.age});
  void sayHello() {
    var name = 'none';
    print("Hi my name is ${this.name}");
  }
}

void main() {
  var player1 = new Player(name:"경은", xp:1000, team: 'blue', age:21,);
  player1.sayHello();
  var player2 = new Player(name:"하영", xp:1000, team: 'blue', age:12,);
  player2.sayHello();
}
```

- 이 Named Constructors는 flutter에서 많이 쓰인다.

---

## 4.3 Named Constructors

- 중복되는 자료형의 변수는 콤마(,)로 구분해서 한꺼번에 선언할 수 있다.
- Constructor(생성자)가 main에서 보내온 입력인수에 맞는 값들을 가지고 class property에 할당해서 새로운 class 변수를 선언한다.
- 원하는 입력인수만 주고 나머지는 defalut값으로 처리하고 싶을 때, 아래와 같이 코드를 작성한다.
- 문자열은 null이 될 수 있으니 null safety에 따라 원하는 입력인수는 required로 선언하고 콜론(:)을 전체적인 parameter를 선언한다. 일부만 `this.변수명`으로 삽입하고 나머지는 default값을 주면 된다.

```dart
class Player {
  final String name;
  late int xp;
  String team;
  int age;

  Player.createBluePlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = 'blue',
        this.xp = 1000;
}

void main() {
  var player1 = Player.createBluePlayer(
    name: '경은',
    age: 21,
  );
}
```

- 만약 positional Constructors로 선언하고 싶다면, 아래와 같이 코드를 작성한다.

```dart
class Player {
  final String name;
  late int xp;
  String team;
  int age;

  Player.createRedPlayer(String name, int age)  : 
        this.age = age,
        this.name = name,
        this.team = 'Red',
        this.xp = 1000;
}

void main() {
  var player2 = Player.createRedPlayer('하영', 14);
}
```

- 간단하지만 가독성이 떨어진다는 단점이 존재한다.

---

⭐⭐⭐(어려움)

## 4.4 Recap

- API를 받아오는 시뮬레이션을 진행하는 코드이다.
- 먼저 main에 apiData 3개를 임의로 선언했다.
- 그리고 Player.fromJson이라는 Constructors를 선언하고 이를 forEach() 메소드를 이용해서 요소를 각각 Player의 fromJson라는 생성자의 입력인수로 넣는다.
- 생성자는 String, dynamic로 이루어진 Map 타입 playerJson 요소들을 하나씩 받고 그 요소들의 요소인 name, xp, team을 각각 class의 인자에 맞게 대입한다.
- 대입한 후에, 인자에 맞게 sayHello() 함수를 호출한다.

```dart
class Player {
  final String name;
  int xp;
  String team;
  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];
  void sayHello() {
    print('Hi my name is $name');
  }
}

void main() {
  var apiData = [
    {
      "name": '경은',
      "team": 'red',
      "xp": 0,
    },
    {
      "name": '하영',
      "team": 'red',
      "xp": 0,
    },
    {
      "name": '경서',
      "team": 'red',
      "xp": 0,
    },
  ];
  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0c182f10-3294-4277-9a8b-7bdb7afc3887/Untitled.png)

---

## 4.5 Cascade Notation

- 클래스의 변수를 선언한 뒤에 요소를 새로 업데이트하고 싶을 때 직접 `변수명.요소명=값`을 해서 업데이트할 수도 있지만 아래처럼 세미콜론(;)를 제거하고 점을 추가해서 간단하게 업데이트할 수도 있다.

```dart
class Player {
  String name;
  int xp;
  String team;

  Player({required this.name, required this.xp, required this.team});
  void sayHello() {
    print('Hi my name is $name');
  }
}

void main() {
  /*
  var kyeongeun = Player(name: '경은', xp: 120, team: 'red');
  kyeongeun.name = '하영';
  kyeongeun.xp = 120;
  kyeongeun.team = 'blue';
  */
  var kyeongeun = Player(name: '경은', xp: 120, team: 'red')
  ..name = '하영'
  ..xp = 120
  ..team = 'blue';
}
```

- 위의 코드는 주석 처리한 부분과 동일하게 작동한다.
- 요소 업데이트한 부분과 가장 가까운 클래스를 조작한다.

---

## 4.6 Enums

- 개발자들이 실수하지 않게 도와주는 기능이다.
- 문자열이라고 해서 따옴표를 굳이 적지 않아도 된다. (관계없다)
- 선언할 때 세미콜론(;)을 적지 않는다.
- class를 선언하는 부분의 자료형을 enum형 이름으로 작성하면 된다.
- flutter에서 매우 많이 사용한다.

```dart
enum Team {red, blue}
enum XPLevel {beginner, medium, pro}

class Player {
  String name;
  XPLevel xp;
  Team team;

  Player({required this.name, required this.xp, required this.team});
  void sayHello() {
    print('Hi my name is $name');
  }
}

void main() {
  var kyeongeun = Player(name: '경은', xp: XPLevel.pro, team: Team.blue)
  ..name = '하영'
  ..xp = XPLevel.pro
  ..team = Team.red;
}
```

---

## 4.7 Abstract Classes

- 추상화 클래스는 객체를 작성할 수 없다.
- 추상화 클래스는 다른 클래스들이 어떤 청사진을 가지고 있어야 하는지 정의해주기 때문에 유용하게 사용된다.
- 약간 헤더파일(.h)처럼 return 여부와 그에 따른 메소드를 정의하는 부분같다. (내 생각)

```dart
abstract class Human {
  void walk();
}

enum Team { red, blue }

enum XPLevel { beginner, medium, pro }

class Player extends Human {
  String name;
  XPLevel xp;
  Team team;

  Player({required this.name, required this.xp, required this.team});

  void walk() {
    print("I\'m walking");
  }

  void sayHello() {
    print('Hi my name is $name');
  }
}

class Coach extends Human {
  void walk() {
    print('The coach is walking');
  }
}

void main() {
  
}
```

---

⭐⭐⭐⭐⭐(매우 어려움)

## 4.8 Inheritance

- 객체지향 프로그래밍의 핵심인 ‘상속’ 개념이다.
- class 선언 부분은 전과 같다.
- enum으로 Team을 열거형으로 선언했다.
- Player라는 class에서 Human이란 class에 들어있는 부분을 모두 이용하고 싶을 때 extends를 이용해 확장한다.
- 그러면, Player class는 자식 객체가 되고, Human class는 부모 객체가 된다.
- 간단히 말해서 자식 객체인 Player에서 부모 객체인 Human의 name 요소를 가져다가 쓰고 싶을 때 그냥 바로 this.name으로 적는 것이 아니라, `super(부모객체요소명)`으로 적어서 가져오는 것이다.
- `@override`라는 명령어는 부모 객체의 함수를 가져오는데 커스터마이징을 진행하고 싶을 때 앞에 붙인다.
- 이 코드에서는 부모 객체의 sayHello 함수를 불러와서 인삿말을 출력하고 그 뒤에 추가로 자식 객체의 요소를 이용해 추가적으로 문자열을 출력한다. 부모객체의 sayHello 함수는 `super.sayHello()`로 적으면 호출된다.

```dart
class Human {
  final String name;
  Human({required this.name});
  void sayHello() {
    print('Hi, my name is $name');
  }
}

enum Team { red, blue }

class Player extends Human {
  final Team team;
  Player({required this.team, required String name}) : super(name: name);
  @override
  void sayHello() {
    super.sayHello();
    print('and I play for ${team}');
  }
}

void main() {
  var player = Player(team: Team.red, name: '경은',);
}
```

---

## 4.9 Mixins

- Mixin은 생성자가 없는 클래스만 가능하다.
- extend와 비슷한 위치에 사용되지만, with을 사용하는 mixin은 속성과 메소드만 긁어온다.
- 다양한 클래스에 메소드를 긁어붙일 수 있다.
- 굳이 부모 객체에 상속되지 않아도 가능하다.

```dart
class Strong {
  final double strengthLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print('ruuuuuuun!');
  }
}

class Tall {
  final double height = 1.99;
}

enum Team { blue, red }

class Player with Strong, QuickRunner, Tall {
  final Team team;
  Player({
    required this.team,
  });
}

class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}

void main() {
  var player = Player(
    team: Team.red,
  );
  player.runQuick();
}
```

---

## 4.10 Conclusions

- [nomadcoders.co/dart-for-beginners](http://nomadcoders.co/dart-for-beginners) ✅
- [nomadcoders.co/flutter-for-beginners](http://nomadcoders.co/flutter-for-beginners)
- [nomadcoders.co/tiktok-clone](http://nomadcoders.co/tiktok-clone)

---
