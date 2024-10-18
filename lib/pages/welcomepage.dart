import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyWelcomePage extends StatefulWidget {
  const MyWelcomePage({super.key});

  @override
  State<MyWelcomePage> createState() => _MyWelcomePageState();
}

class _MyWelcomePageState extends State<MyWelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              
              onPressed: (){
                Navigator.pushNamed(context, '/login');

            }, child: const Text('LOGIN',style: TextStyle(fontSize: 25,fontWeight:FontWeight.w600),)),
            const SizedBox(height: 23,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/register');
            }, child: const Text('REGISTER',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),))
          ],
        ),
      ),
    );
  }
}