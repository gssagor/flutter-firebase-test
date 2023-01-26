import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(controller: controller,),
        actions: [
          IconButton(onPressed: (){
            final name = controller.text;
            createUser(name:name);
          },
              icon: Icon(Icons.add),
          )
        ],
      ),
      body: Container(),
    );

  }
  Future createUser({required String name})async{
  final docUser= FirebaseFirestore.instance.collection('users').doc('hey there');

  final json={
    'name':name,
    'age':21,
    'birthday':DateTime(1995,10,16),
  };
  await docUser.set(json);
}
}
