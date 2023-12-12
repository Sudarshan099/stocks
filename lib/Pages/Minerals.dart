import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MineralPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minerals',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Minerals Price',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 16.0),
              _buildMineralCard('Petrol', 'Rs. 180 per liter', Icons.local_gas_station, Colors.orange),
              _buildMineralCard('Diesel', 'Rs. 140 per liter', Icons.local_gas_station, Colors.orange),
              _buildMineralCard('Kerosene', 'Rs. 170 per liter', Icons.local_gas_station, Colors.orange),
              _buildMineralCard('LPG Gas', 'Rs. 2000 per cylinder', Icons.local_gas_station, Colors.orange),
              _buildMineralCard('Gold (per tola)', 'Rs. 1,10,000', Icons.attach_money, Colors.amber),
              _buildMineralCard('Silver (per tola)', 'Rs. 9,200', Icons.attach_money, Colors.amber),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMineralCard(String mineral, String price, IconData icon, Color color) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 40.0,
                  color: color,
                ),
                Text(
                  mineral,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: $price',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
