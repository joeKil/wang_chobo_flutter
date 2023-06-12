import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  String _text = '';
  final _textController = TextEditingController();

  @override
  // 텍스트 에딧팅 컨트롤러를 쓸 때는 이걸 꼭 넣어줘야 메모리 문제를 해결할 수 있음
  // 해지하는 코드임
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 뼈대
      appBar: AppBar(
        title: Text('홈'), // 앱바안에 홈이라는 텍스트 넣는다는 뜻
      ),
      body: Center(
        child: SingleChildScrollView(
          // 스크롤 생김
          child: Column(
            // 컬럼으로 감싼다는 뜻 알트 + 엔터키 누르면됨
            mainAxisAlignment: MainAxisAlignment.center,
            // 메인 방향 정렬이라는 속성 .center 가운데로 오게하겠다
            children: [
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
              SizedBox(height: 30),
              // 크기만 지정할 때 사용하고 패딩을 사용해도 되지만 사박을 사용해도된다, 컨테이너도 가능하지만 성능적으로 우위를 가져감
              // 대괄호는 감싼다는 뜻
              Text(
                '숫자',
                style: TextStyle(color: Colors.black, fontSize: 40), // 스타일 내는법
              ),
              Text(
                '$count',
                style: TextStyle(color: Colors.red, fontSize: 70), // 스타일 내는법
              ),
              ElevatedButton(
                  onPressed: () {
                    print('엘리베이터버튼');
                  },
                  child: Text('엘레베이터버튼')),
              TextButton(
                  onPressed: () {
                    print('텍스트버튼');
                  },
                  child: Text('텍스트버튼')),
              OutlinedButton(
                  onPressed: () {
                    print('아웃라인버튼');
                  },
                  child: Text('아웃라인버튼')),
              Row(
                children: [
                  Expanded( // 이걸 쓰면 안나오던 애들도 나오는 경우도 있음
                    flex: 3,
                    child: TextField( // 텍필은 가로를 꽉채워서 엘베 버튼이 그냥 들어가면 에러남
                      controller: _textController, // 얘를 통해서 텍스트 필드안에 있는 값을 얻을 수 있음
                      decoration: InputDecoration(
                        labelText: '글자',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        _text = text;
                        // 누를때마다 값이 바뀜
                        // print(text);
                      },
                    )
                  ),
                  Expanded( // 텍스트필드와 균등하게 쓰고싶다면 쓰자
                    flex: 2, // 텍스트필드는 3 얘는 2 이런식으로 영역을 사이즈를 바꿀 수 있음
                    child: ElevatedButton(
                      onPressed: () {
                        print(_textController.text); // 온체인지드를 안쓰면 이걸로도 충분

                        // 화면 갱신
                        setState(() { // 이걸 넣어야 로그인 밑에 텍스트가 나타남
                          // 아무것도 쓰지 않아도 화면 갱신하는 코드로 사용 가능
                        });
                      },
                      child: Text('로그인'),
                    ),
                  ),
                ],
              ),
              Text(_textController.text),
              Container(
                // 컨테이너는 자식 위젯의 크기를 따르는데, 따로 설정하면 그 크기로 변함 자식도 그 크기가됨
                color: Colors.green,
                width: 120,
                height: 120, // 이런식으로 잘 사용안함
                child: Padding(
                  // 패딩을 주면됨, 패딩으로 여백 표현해주기 ~
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/'
                    'images?q=tbn:ANd9GcR-Lis2mHbg0cAYsF4KCjyqpiavZkmxObWUsQ&usqp=CAU',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover, // 내가 정한 사이즈 꽉차게
                  ),
                ),
              ),
              Image.asset(
                'assets/megi.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // 화면 갱신
            count++;
          });
          print('클릭');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
