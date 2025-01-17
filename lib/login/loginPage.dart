import 'package:coacheers/component/kakaoLogin.dart';
import 'package:coacheers/frame/mainFrame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xfffffffff),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            children: [
              logo(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: SizedBox(
                  width: 300,
                  // child: Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                  //   child: realkakao(),
                  // ),
                  child: Column(
                    children: [
                      facebook(),
                      kakao(),
                      google(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      child: Column(
        children: [
          Image(image: AssetImage('assets/images/Coacheers.png'), width: 300),
          Text(
            "Coacheers",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget facebook() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainFrame(
                        name: "",
                        profileURL: "",
                        subindex: 2,
                        id: 0,
                      )),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/Facebook.png'),
                  width: 40,
                ),
                Text(
                  "Facebook 로그인",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(0xff569BF5),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Color(0xff569BF5))))),
        ),
      ),
    );
  }

  Widget kakao() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            KakaoLogin(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage('assets/images/kakaotalk.png'),
                    width: 40),
                Text(
                  "Kakao 로그인",
                  style: TextStyle(
                    color: Color(0xff392020),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffFEE500)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Color(0xffFEE500))))),
        ),
      ),
    );
  }

  Widget realkakao(){
    return GestureDetector(
      onTap: () => KakaoLogin(context),
      child: Image.asset('assets/images/kakao_login_large_narrow.png'),
    );
  }

  Widget google() {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => MainFrame()),
          // );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/Google.png'), width: 40),
              Text(
                "Google 로그인",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffF7F7F7)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Color(0xffF7F7F7))))),
      ),
    );
  }
}
