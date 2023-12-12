import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PredictedGraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicted Graph',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text('Predicted Graph Page Content'),
      ),
    );
  }
}