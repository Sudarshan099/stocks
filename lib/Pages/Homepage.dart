import 'package:flutter/material.dart';
import 'package:nepaltradingysytem/Pages/Calculator.dart';
import 'package:nepaltradingysytem/Pages/Contact.dart';
import 'package:nepaltradingysytem/Pages/GraphStudy.dart';
import 'package:nepaltradingysytem/Pages/Minerals.dart';
import 'package:nepaltradingysytem/Pages/PredictedGraph.dart';
import 'package:nepaltradingysytem/Pages/Price.dart';
import 'package:nepaltradingysytem/Pages/StockGraph.dart';
import 'package:nepaltradingysytem/Pages/WatchList.dart';

import 'Login.dart';
import 'Profile.dart';
import 'StockAlert.dart';
import 'StockPrice.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NepStock',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            buildDrawerItem(Icons.person, 'Profile', context),
            buildDrawerItem(Icons.dashboard, 'Dashboard', context),
            buildDrawerItem(Icons.attach_money, 'Stock Price', context),
            buildDrawerItem(Icons.notifications, 'Stock Alert', context),
            buildDrawerItem(Icons.show_chart, 'Price/Volume', context),
            buildDrawerItem(Icons.folder, 'Minerals', context),
            buildDrawerItem(Icons.list, 'Watch List', context),
            buildDrawerItem(Icons.timeline, 'Stock Graph', context),
            buildDrawerItem(Icons.calculate, 'Calculator', context),
            buildDrawerItem(Icons.trending_up, 'Predicted Graph', context),
            buildDrawerItem(Icons.school, 'Graph Study', context),
            buildDrawerItem(
                Icons.contact_mail, 'Contact and Feedback', context),
            Divider(),
            buildDrawerItem(Icons.exit_to_app, 'Logout', context),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0),
          Container(
            width: 1000,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey,
            ),
            child: Text(
              'Index',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Gainer',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Top Loser',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Close the drawer
        Navigator.pop(context);

        // Handle onTap for each menu item
        if (title == 'Profile') {
          // Navigate to the profile page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        } else if (title == 'Logout') {
          // Show a confirmation dialog before logging out
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Logout'),
                content: Text('Are you sure you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the login page
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                            (route) => false,
                      );
                    },
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        } else if (title == 'Calculator') {
          // Navigate to the calculator page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalculatorPage()),
          );
        } else if (title == 'Stock Price') {
          // Navigate to the stock price page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StockPricePage()),
          );
        } else if (title == 'Stock Alert') {
          // Navigate to the stock alert page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StockAlertPage()),
          );
        } else if (title == 'Price/Volume') {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PricePage()),
          );
        } else if (title == 'Minerals') {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MineralPage()),
          );
        } else if (title == 'Watch List') {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WatchListPage()),
          );
        } else if (title == 'Stock Graph') {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StockGraphPage()),
          );
        } else if (title == 'Predicted Graph') {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PredictedGraphPage()),
          );
        } else if (title == 'Graph Study') {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GraphStudyPage()),
          );
        } else if (title == 'Contact and Feedback') {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactPage()),
          );
        }
      },
    );
  }

}



