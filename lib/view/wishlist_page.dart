import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist Page")),
      body: const Center(
        child: Text(
          "This is the Wishlist Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
