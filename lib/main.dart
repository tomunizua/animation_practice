import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'product.dart';

// Entry point of the application
void main() {
  runApp(MyApp());
}

// MyApp class which sets up the application
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// State class for MyApp
class _MyAppState extends State<MyApp> {
  // Boolean to keep track of the theme mode
  bool _isDarkMode = false;
  // Variable to keep track of the selected product
  String? selectedProductName;

  // List of products
  final List<Product> products = [
    Product(name: 'Product 1', imageUrl: 'assets/product1.jpg', price: 29.99),
    Product(name: 'Product 2', imageUrl: 'assets/product1.jpg', price: 19.99),
    Product(name: 'Product 3', imageUrl: 'assets/product1.jpg', price: 49.99),
    Product(name: 'Product 4', imageUrl: 'assets/product1.jpg', price: 99.99),
  ];

  // Build method to render the UI
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Theme Switcher',
      // Toggle between light and dark themes
      theme: _isDarkMode ? MyTheme.darkTheme : MyTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Store'),
          actions: [
            // IconButton to switch themes
            IconButton(
              icon: Icon(_isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
          ],
        ),
        // GridView to display the products
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final isSelected = selectedProductName == product.name;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedProductName = isSelected ? null : product.name;
                });
                // Snackbar to display selected product
                Get.snackbar('Product Selected', product.name,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 1),
                );
              },
              // AnimatedContainer for visual effect
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  // Highlight the border if the product is selected
                  border: Border.all(
                    color: isSelected ? Colors.pink : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Card(
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display product image
                      Image.asset(
                        product.imageUrl,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      // Display product name and price
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${product.price}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
