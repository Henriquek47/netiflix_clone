import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:netiflix_clone/models/user.dart';
import 'package:netiflix_clone/screen/loginPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = Modular.get<UserModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            print(user.isLoggedIn());
          } 
          )
        ],
      ),
      body: Container(
        child: Text('Ola ${!user.isLoggedIn() ? '' : user.texto() == null ? 'null' : user.texto()}'),
      ),
    );
  }
}