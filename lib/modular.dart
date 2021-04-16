import 'package:flutter_modular/flutter_modular.dart';
import 'package:netiflix_clone/models/user.dart';
import 'package:netiflix_clone/screen/homePage.dart';

class AppModule extends Module{
  
  @override
   final List <Bind> binds = [
     Bind((i) => UserModel()),
   ];

  @override
   final List <ModularRoute> routes = [
     ChildRoute('/', child: (_, __) => HomePage()),
   ]; 

}