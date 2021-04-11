import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User{

  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  Future<String> signUp({Map<String, dynamic> userData, String pass, VoidCallback onSuccess, VoidCallback onFail})async{
    isLoading = true;

    try{
      await auth.createUserWithEmailAndPassword(email: userData['email'], password: pass);
      await _saveUserData(userData);
      return 'Signed up';
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  Future<String> signIn(Map<String, dynamic> userData, String pass, VoidCallback onSuccess, VoidCallback onFail)async{
    isLoading = true;

    try{
      await auth.signInWithEmailAndPassword(email: userData['email'], password: pass);
      return 'Signed in';
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  void recoverPass(){
    
  }

  bool isLoggedIn(){

  }

  Future _saveUserData(Map<String, dynamic> userData)async{
    this.userData = userData;
    await FirebaseFirestore.instance.collection('users').doc().set(userData);
  }

}