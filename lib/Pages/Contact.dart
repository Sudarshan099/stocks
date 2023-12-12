import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepaltradingysytem/Pages/Homepage.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController _fullNameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact and Feedback',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Feedback',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildContactForm(),
            SizedBox(height: 32.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildContactDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _fullNameController,
          decoration: InputDecoration(
            labelText: 'Full Name',
          ),
        ),

        SizedBox(height: 16.0),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _messageController,
          decoration: InputDecoration(
            labelText: 'Message',
            alignLabelWithHint: true,
          ),
          maxLines: 4,
        ),
        SizedBox(height: 16.0),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseFirestore.instance.collection('feedback').add({
                  'fullName': _fullNameController.text,

                  'email': _emailController.text,
                  'message': _messageController.text,
                });

                // Display a success message or navigate to another screen
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Feedback Submitted'),
                      content: Text('Thank you for your feedback!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                                  (route) => false,
                            ); // Close the dialog box
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } catch (e) {
                // Handle registration errors
                print('Error : $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                  content: Text('Error Occured!'),
                  ),
                );
              }
            },
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }

  Widget _buildContactDetails() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue[100], // Change the background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Contact:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Icon(Icons.phone), // Add an icon
            ],
          ),
          SizedBox(height: 8.0),
          Text('+977 9862480885'), // Add your actual contact number
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Email:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Icon(Icons.email), // Add an icon
            ],
          ),
          SizedBox(height: 8.0),
          Text('nepstock@gmail.com'), // Add your actual email
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Address:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Icon(Icons.location_on), // Add an icon
            ],
          ),
          SizedBox(height: 8.0),
          Text('Kupandole, Lalitpur'), // Add your actual address
        ],
      ),
    );
  }

}



