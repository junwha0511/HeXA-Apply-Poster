import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeXAApply(),
    );
  }
}

class HeXAApply extends StatefulWidget {
  @override
  _HeXAApplyState createState() => _HeXAApplyState();
}

class _HeXAApplyState extends State<HeXAApply> {
  double _top = 220;
  bool isOnPlay = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Welcome to HeXA")),
          backgroundColor: Color(0xff468fc5)),
      body: Column(
        children: [
          AnimatedContainer(
            margin: EdgeInsets.fromLTRB(15, _top, 0, 0),
            duration: Duration(seconds: 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _top = 30;
                        isOnPlay = true;
                      });
                    },
                    child:
                        Image.asset("asset/logo.png", width: 100, height: 100)),
                SizedBox(width: 10),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HeXA",
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        "Hacker's eXciting Academy",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          _buildExplain(),
        ],
      ),
    );
  }

  Widget _buildExplain() {
    return isOnPlay
        ? FutureBuilder(
            future: Future.delayed(Duration(seconds: 1, milliseconds: 500)),
            builder: (c, s) => s.connectionState == ConnectionState.done
                ? _buildAnimatedText(
                    "지원 대상: 프로그래밍과 해킹, 프로젝트에 관심이 있는 누구나\n\n지원 기간: 2021.02.22~2021.03.06\n\n지원서 제출: http://apply.hexa.pro\n\n카카오톡 오픈채팅방: \nhttp://open.kakao.com/o/gAuHe8Xc\n\n페이스북: \nhttps://www.facebook.com/unist.hexa")
                : SizedBox(height: 0),
          )
        : SizedBox(height: 0);
  }

  Widget _buildAnimatedText(String _text) {
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: TyperAnimatedTextKit(
        text: [_text],
        textStyle: TextStyle(
          fontFamily: "Nanum",
          height: 1.3,
          fontSize: 20,
        ),
        speed: Duration(milliseconds: 30),
        repeatForever: false,
        totalRepeatCount: 1,
      ),
    );
  }
}
