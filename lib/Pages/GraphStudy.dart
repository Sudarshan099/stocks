import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphStudyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph Study',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text('Graph Study Page Content'),
      ),
    );
  }
}