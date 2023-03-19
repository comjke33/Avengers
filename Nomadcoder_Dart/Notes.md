### #0 introduction
## 0.0. Dart란

- Flutter 애플리케이션을 구축하기 위해 필요한 언어 → Dart
- Dart를 배우면 iOS, Android, PC, Web flutter 앱을 제작할 수 있다.

---

## 0.0. Welcome

- 객체지향
- 구글이 만듬
- User interface를 구축하기 편함
- 다양한 플랫폼을 만들 수 있음.

---

## 0.1. Why Dart

- UI를 만들기 쉬움
- 생산적인 개발환경을 가짐
- 모든 플랫폼에서 빠르다.
- dart web : dart → javascript
- dart native → 여러 CPU에 맞게 컴파일
- JIT(just-in-time) : 내가 쓴 코드의 결과를 바로 보여준다. (가상머신을 이용)
- AOT(ahead-of-time) : 컴파일 후 특정 아키텍쳐를 위한 기계어로 바꾼다.
- null safety : 값이 null이어도 오류를 일으키지 않는다.
- flutter 프레임워크도 구글이 만든 것이기 때문에, 만약 flutter에게 필요한 기능이 있으면 dart 언어를 수정해 최적화할 수 있다.

---

## 0.2. How To Learn

- `dartpad.dev/`
- VScode에서도 dart extension을 추가해서 editing이 가능하다.
- 내 첫 dart

```dart
void main() {
  print("hello world");
}
```

- ⚠️ - launch.json이 뜨면서 컴파일되지 않는 오류
    - json 파일에 `"program" : "0_2.dart"`처럼 파일명을 추가해준다.
    
    ```dart
    {
        // Use IntelliSense to learn about possible attributes.
        // Hover to view descriptions of existing attributes.
        // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
        "version": "0.2.0",
        "configurations": [
            {
                "name": "Dart & Flutter",
                "request": "launch",
                "type": "dart",
                "program" : "0_2.dart"
            }
        ]
    }
    ```
