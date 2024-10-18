import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  var email=TextEditingController();
  var password=TextEditingController();
  var key=GlobalKey<FormState>();
  User? loggedinuser;
  final auth=FirebaseAuth.instance;

  @override
  void initState(){
    super.initState();
    Firebase.initializeApp().whenComplete((){
      setState(() {
        
      });
    });
    getUser();
  }
  void getUser(){
    try {
      final user=auth.currentUser;
      loggedinuser=user;
        }catch(e){
      throw e.toString();
    }
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Register user'),
          Form(
            key: key,
            child: Column(    
              children: [
                Padding(padding: const EdgeInsets.all(8),
                child: TextFormField(  
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      
                    )
                  ),
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(  
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23)
                      )
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    
                  });
                  try {
                    final user=auth.createUserWithEmailAndPassword(email:email.text,password:password.text);
                    Navigator.pushNamed(context, '/chat');
                                    }catch(e){
                    throw e.toString();
                  }
                  setState(() {
                    
                  });
                }, child: const Text('Register',style: TextStyle(fontSize: 25),))
              ],
            ),
          )
        ],
      ),
    );
  }
}