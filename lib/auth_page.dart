import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/Screens/Home_Page.dart';
import 'package:todolist/LoginOrRegisterPage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){

          //if user is logged in
          if(snapshot.hasData){
            return HomePage();
          }
          //if not user logged in
          else{
            return LoginOrRegisterPage();
          }
        }
      )
    );
  }
}
