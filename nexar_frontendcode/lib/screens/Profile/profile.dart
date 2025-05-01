import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/Cart/cart_screen.dart';
import 'package:ecommerce/screens/Profile/my_listings.dart';
import 'package:ecommerce/screens/nav_bar_screens.dart';
import 'package:ecommerce/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _username = "Loading...";
  String _email = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  // Load user info from SharedPreferences
  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? "Unknown User";
      _email = prefs.getString('email') ?? "No email provided";
    });
  }

  // Sign out function
  Future<void> _signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all stored preferences (including token)
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (route) => false, // Removes all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: const Text(
          "Account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BottomNavBar(),
              ),
            );
            // Add your back button functionality here
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: kprimaryColor,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'images/toy.jpg'), // Replace with your image URL
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _username, // Dynamic username
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _email, // Dynamic email
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildListTile(
                  icon: Icons.shopping_cart,
                  title: 'My Listings',
                  subtitle: 'Add, remove products and move to checkout',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyListings(),
                      ),
                    );
                  },
                ),
                _buildListTile(
                  icon: Icons.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove products and move to checkout',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
                _buildListTile(
                  icon: Icons.list_alt,
                  title: 'My Orders',
                  subtitle: 'In-progress and Completed Orders',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  subtitle: 'Set any kind of notification message',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.privacy_tip,
                  title: 'Account Privacy',
                  subtitle: 'Manage data usage and connected accounts',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.logout,
                  title: 'Sign Out',
                  subtitle: 'Log out of your account',
                  onTap: _signOut, // Call the sign-out function
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: kprimaryColor),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
