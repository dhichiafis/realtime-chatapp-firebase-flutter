import 'package:flutter/material.dart';
import 'package:realtime/firebase_options.dart';
import 'package:realtime/pages/chatpage.dart';
import 'package:realtime/pages/loginpage.dart';
import 'package:realtime/pages/registerpage.dart';
import 'package:realtime/pages/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override   
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/':(context)=>const MyWelcomePage(),
        '/login':(context)=>const MyLoginPage(),
        '/register':(context)=>const MyRegisterPage(),
        '/chat':(context)=>const MyChatPage()
      }
    );
  }
}