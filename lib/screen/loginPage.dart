import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:netiflix_clone/models/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final user = Modular.get<User>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

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
                      controller: email,
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
                      controller: pass,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Senha',
                    ),
                  ))))),
                  Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: GestureDetector(
                      onTap: (){

                        Map<String, dynamic> userData = {
                          'email': email.text,
                        };

                        setState(() {
                          user.signUp(userData: userData, pass: pass.text);
                        });
                      },
                      child: Container(
                      alignment: Alignment.center,
                      child: !user.isLoading ? Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 20)) :
                      CircularProgressIndicator(),
                      height: 65,
                      width: 265,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )))),
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