import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/Profile/my_listings.dart';

import 'package:flutter/material.dart';

class ProductListedSuccessPage extends StatelessWidget {
  const ProductListedSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white, // White background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tick mark with gradient and shadow
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(), // Shadow color
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.yellow[700]!, // Top gradient color
                    Colors.yellow[400]!, // Bottom gradient color
                  ],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(20.0), // Padding inside the circle
                child: Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.white, // White checkmark inside the gradient
                ),
              ),
            ),
            SizedBox(height: 20),
            // Title text
            Text(
              'Your Product Has Been Listed!',
              style: TextStyle(
                fontSize: 22,
                color: kprimaryColor, // Yellow text color
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Subtitle text
            Text(
              'Thank you for listing your product.\nIt\'s now visible to potential buyers.\n We\'ll notify you when someone shows interest.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700], // Neutral text color
              ),
            ),
            SizedBox(height: 30),
            // Button to go to My Listings
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyListings()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kprimaryColor, // Yellow button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: Text(
                'Go to My Listings',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // White text on the button
                ),
              ),
            ),
            SizedBox(height: 10),
            // Close button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                'Close',
                style: TextStyle(
                  fontSize: 16,
                  color: kprimaryColor, // Yellow text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
