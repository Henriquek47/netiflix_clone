import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel{

  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential user;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  Future<String> signUp({Map<String, dynamic> userData, String pass, VoidCallback onSuccess, VoidCallback onFail})async{
    isLoading = true;

    try{
      await auth.createUserWithEmailAndPassword(email: userData['email'], password: pass).then((user)async{
        this.user = user;
        await _saveUserData(userData);
        isLoading = false;
        print('suuucesso');
      });
      return 'Signed up';
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  Future signIn(String email, String pass)async{
    isLoading = true;

      await auth.signInWithEmailAndPassword(email: email, password: pass).then((user){
        this.user = user;
        isLoading = false;
        print('sucesso2');
      }).catchError((e){
        print('$e deu erro aqui');
      });
    }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    user = null;
    userData = Map();
  }

  bool isLoggedIn(){
    return user != null;
  }

  Future _saveUserData(Map<String, dynamic> userData)async{
    this.userData = userData;
    await FirebaseFirestore.instance.collection('users').doc().set(userData);
  }

  String texto(){
    return userData['email'];
  }

}