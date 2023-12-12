import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),

        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350.0,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff99f1e9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildProfileField('Full Name', 'full_name'),
                buildProfileField('Email', 'email'),
                buildProfileField('Contact', 'contact'),
                buildProfileField('Address', 'address'),
                buildProfileField('Date of Birth', 'dob'),
                buildProfileField('Gender', 'gender'),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildProfileField(String label, String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('users').doc(user?.uid).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic>? data = snapshot.data?.data() as Map<String, dynamic>?;

              return Text(
                data?[fieldName] ?? '',
                style: TextStyle(color: Colors.black,fontSize: 16.0),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}



