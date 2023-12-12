import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PricePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Price/Volume ',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text('Price Volume Page Content'),
      ),
    );
  }
}