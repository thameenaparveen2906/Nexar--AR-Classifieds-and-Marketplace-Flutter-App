import 'dart:convert';
import 'package:ecommerce/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/nav_bar_screens.dart';

class MyListings extends StatefulWidget {
  const MyListings({super.key});

  @override
  State<MyListings> createState() => _MyListingsState();
}

class _MyListingsState extends State<MyListings> {
  List<dynamic> _productList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  // Fetch products from the backend
  Future<void> fetchProducts() async {
    final uri = Uri.parse(listing); // Replace with your actual API URL
    try {
      final response = await http.get(uri);
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is List) {
          // Ensure the response is a list of products
          setState(() {
            _productList = data;
            _isLoading = false;
          });
        } else {
          throw Exception('Unexpected response format: ${response.body}');
        }
      } else {
        throw Exception(
            'Failed to fetch products. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
      setState(() {
        _isLoading = false;
      });

      // Show user-friendly error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Delete a product
  Future<void> deleteProduct(String productId) async {
    final uri = Uri.parse('$deletep/$productId');

    try {
      setState(() {
        _isLoading = true; // Show loading while deleting
      });

      final response = await http.delete(uri);

      print('Delete Response Status Code: ${response.statusCode}');
      print('Delete Response Body: ${response.body}');

      setState(() {
        _isLoading = false; // Stop loading after deletion
      });

      if (response.statusCode == 200) {
        // Remove the product from the list
        setState(() {
          _productList.removeWhere((product) => product['_id'] == productId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product deleted successfully')),
        );
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product not found.')),
        );
      } else {
        throw Exception(
            'Failed to delete product. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting product: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        title: const Text(
          "My Listings",
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
          },
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _productList.isEmpty
              ? const Center(child: Text("No products listed yet"))
              : ListView.builder(
                  itemCount: _productList.length,
                  itemBuilder: (context, index) {
                    final product = _productList[index];
                    final String imageUrl = product['image'] != null
                        ? (product['image'].startsWith('http')
                            ? product['image']
                            : '$url${product['image']}')
                        : ''; // Build complete URL or use fallback

                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kcontentColor,
                              ),
                              child: imageUrl.isNotEmpty
                                  ? Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(
                                          Icons.broken_image,
                                          size: 50,
                                        ); // Fallback if image fails to load
                                      },
                                    )
                                  : const Icon(Icons.image, size: 50),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'] ?? 'No name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    product['category'] ?? 'No category',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Rs ${product['price']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Confirm before deleting
                                if (product['_id'] != null) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Product'),
                                      content: const Text(
                                          'Are you sure you want to delete this product?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            deleteProduct(product['_id']);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Product ID is missing.')),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
