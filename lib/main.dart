import 'package:chatbot/pages/chatbot.dart';
import 'package:chatbot/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primaryColor: Colors.deepOrange
     ),
     routes: {
       "/" : (context) => LoginPage(),
       "/bot": (context) => ChatBotPage()
     },
   );
  }
}