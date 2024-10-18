
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  var email=TextEditingController();
  var password=TextEditingController();
  var key=GlobalKey<FormState>();
  var auth=FirebaseAuth.instance;
  @override 
  void initState(){
    super.initState();
    Firebase.initializeApp().whenComplete((){
      setState(() {
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(  
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login'),
          Form(
            key: key,
            child: Column(  
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23)
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23)
                      )
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    
                  });
                  try{
                    final user=auth.signInWithEmailAndPassword(email:email.text,password:password.text);
                    if(user!=null){
                      Navigator.pushNamed(context, '/chat');
                    }
                  }catch(e){
                    throw e.toString();
                  }
                  setState(() {
                    
                  });
                }, child: const Text('Login'))
              ],
            ),
          )
        ],
      ),
    );
  }
}