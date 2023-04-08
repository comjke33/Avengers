import 'package:flutter/material.dart';

class Player {
  String name;
  //String? name;
  //-> name에 parameter가 들어가지 않아도 이해해줌
  Player(this.name);
  //Player(this.name) -> 기본
  //Player({required this.name})
  //-> named parameter : parameter의 종류를 명시하도록 함
  //positional parameter constructor : parameter의 순서가 중요
}
//class Player를 선언했다.
//문자열 name이 속성이고,
//Player 괄호 안은 name 속성이 들어감을 명시했다.

void main() {
  var nico = Player("potato");
  //Player name은 potato이다.
  //nico.name -> potato를 받아옴
  //var nico = Player(name: "potato");
  //-> named parameter라면 이렇게 변수를 선언하면 된다.
  runApp(App());
}
//flutter는 main 함수에서 시작한다.
//flutter는 Widget이라는 레고를 합치는 방식으로 구성한다.
//flutter catalog에 가면 다른 사람들의 위젯을 구경하거나, 커뮤니티에서 구한 위젯도 가져와서 사용할 수 있다.
//가운데 정렬을 위한 위젯도 존재한다. (→ 즉 모든 것이 위젯이다)
//우리는 먼저 App 자체의 위젯을 제작할 것이다.
//따라서 void main의 runApp(App()) 함수만 남기고 전부 삭제하였다.

class App extends StatelessWidget {
  //App이라는 위젯으로 사용하고 싶다면, flutter SDK에 있는 3개의 위젯 중에서 하나를 extend 받아야한다.
  //지금 우리는 가장 기초적이고 쉬운 StatelessWidget을 가져온다.
  @override
  Widget build(BuildContext context) {
    //모든 위젯은 build 메소드를 구현해야한다.
    //`build`만 쳐도 build 메소드가 자동완성된다.
    //`@override`의 의미는 부모 class에 이미 있는 메소드를 override한다는 것이다.
    //이미 build가 구현되어있고 그것을 불러옴.

    return MaterialApp(
      //모든 앱의 버튼 등이 root Widget를 통해 만들어진다.
      //따라서 material(구글)이랑 cupertino(애플) 둘 중 하나를 꼭 return해야한다.

      home: Scaffold(
        //Scaffold는 정렬을 도와주는 메소드이다.

        appBar: AppBar(
          //appBar는 앱의 윗 바를 의미한다.
          centerTitle: false,
          //title 가운데 정렬 bool형
          elevation: 10,
          //그림자 표현
          title: Text('Hello flutter!'),
          //제목은 Text 명령어로 지정되었다.
        ),
        body: Center(
          //가운데 정렬

          child: Text('Hello world!'),
          //Center의 자식 Text로 지정한다.
        ),
      ),
    );
  }
}
