import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockAlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Alert',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text('Stock Alert Page Content'),
      ),
    );
  }
}