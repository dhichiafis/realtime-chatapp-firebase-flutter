import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MyChatPage extends StatefulWidget {
  const MyChatPage({super.key});

  @override
  State<MyChatPage> createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  final mychats=FirebaseFirestore.instance.collection('chats');
  var message=TextEditingController();
  var auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: mychats.snapshots(), 
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,int index){
                DocumentSnapshot document=snapshot.data!.docs[index];
                final currentUser=auth.currentUser;
                return MessageDocument(isowner: currentUser==document['email'],message: document['message'],);
              });
          }
          return const CircularProgressIndicator();
        }),
        floatingActionButton: FloatingActionButton(onPressed: ()async{
          await addMessage(context);
        },child: Icon(Icons.add),),
    );
  }
  Future<dynamic> addMessage(context) async {
    var currentuser=auth.currentUser;
    return showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          height: 150,width: 200,
          child: Column(  
            children: [
              Flexible(child: TextField()),
              ElevatedButton(onPressed: (){
                 
                mychats.add({'message':message.text,'email':currentuser});
                message.clear();
                Navigator.pop(context);
              }, child: Text('add Message'))
            ],
          ),
        ),
      );
    });
  }
}


class MessageDocument extends StatelessWidget{
  MessageDocument({super.key,required this.isowner,required this.message});
  bool isowner;
  String message;
  @override  
  Widget build(BuildContext context){
    return Material(
      elevation: 5,
      child: Container(  
        decoration: BoxDecoration(
          color: isowner?Colors.greenAccent:Colors.orangeAccent,
          borderRadius: isowner?const BorderRadius.only(
            topLeft: Radius.circular(15),bottomLeft: Radius.circular(15),topRight: Radius.circular(15),bottomRight: Radius.circular(35)
          ):const BorderRadius.only(
            topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(15)
          ),
        ),
        child: Text(message,style: TextStyle(color: isowner?Colors.black:Colors.black12),),
      ),
    );
  }
}