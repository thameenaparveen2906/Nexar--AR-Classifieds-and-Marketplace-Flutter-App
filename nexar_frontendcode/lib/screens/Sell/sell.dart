import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/Sell/automotive.dart';
import 'package:ecommerce/screens/Sell/electronics.dart';
import 'package:ecommerce/screens/Sell/furniture.dart';
import 'package:ecommerce/screens/Sell/homedecor.dart';
import 'package:ecommerce/screens/Sell/toys.dart';
import 'package:ecommerce/screens/nav_bar_screens.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.chair, 'label': 'Furniture'},
    {'icon': Icons.home, 'label': 'Home Decor'},
    {'icon': Icons.devices, 'label': 'Electronics & Gadgets'},
    {'icon': Icons.directions_car, 'label': 'Automotive'},
    {'icon': Icons.toys, 'label': 'Toys & Games'},
  ];

  // Keep track of the selected state for each category
  List<bool> selectedStates = List<bool>.generate(5, (index) => false);

  void _navigateToCategory(String label) {
    Widget? targetPage;

    switch (label) {
      case 'Furniture':
        targetPage = const FurniturePage();
        break;
      case 'Home Decor':
        targetPage =
            const HomeDecorPage(); // Replace with your HomeDecorPage widget
        break;
      case 'Electronics & Gadgets':
        // Replace with your ElectronicsPage widget
        targetPage = const ElectronicsPage();
        break;
      case 'Automotive':
        // Replace with your AutomotivePage widget
        targetPage = const AutomotivePage();
        break;
      case 'Toys & Games':
        // Replace with your ToysPage widget
        targetPage = const ToysAndGamesPage();
        break;
      default:
        break;
    }

    if (targetPage != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => targetPage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BottomNavBar(),
              ),
            );
          },
        ),
        title: Text(
          "What do you want to sell?",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedStates[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedStates[index] =
                    !selectedStates[index]; // Toggle the state
              });

              // Delay navigation to allow the UI to reflect the selection change
              Future.delayed(const Duration(milliseconds: 100), () {
                _navigateToCategory(category['label']);
              });
            },
            child: CategoryCard(
              icon: category['icon'],
              label: category['label'],
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? kcontentColor : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(color: kprimaryColor, width: 2)
            : Border.all(color: Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: isSelected
                ? kprimaryColor
                : Colors.black, // Color based on isSelected
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? kprimaryColor
                  : Colors.black, // Change text color as well
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
