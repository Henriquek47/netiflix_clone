import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1000,
            height: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/imageBackground.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          Center(
            child: Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.black45
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    alignment: Alignment.center,
                    width: 230,
                    height: 60,
                    child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Email',
                    ),
                  ))))),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    alignment: Alignment.center,
                    width: 230,
                    height: 60,
                    child:  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Senha',
                    ),
                  ))))),
                  Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 20),),
                      height: 65,
                      width: 265,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ))),
                ],
              ),
            )),
            Align(
            alignment: Alignment(-0.45, -0.45),
            child: Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}