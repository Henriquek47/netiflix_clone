import 'package:flutter_modular/flutter_modular.dart';
import 'package:netiflix_clone/screen/loginPage.dart';

class AppModule extends Module{
  
  @override
   final List <Bind> binds = [
   ];

  @override
   final List <ModularRoute> routes = [
     ChildRoute('/', child: (_, __) => LoginPage()),
   ]; 

}