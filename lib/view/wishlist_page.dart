import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc/cart_bloc.dart';
import '../data/wishlist_items.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist Page")),
      body: BlocBuilder<HomeBloc, HomeStates>(

        builder: (context, state) {
          final items = wishlistItems; // always use the shared list

          if (items.isEmpty) {
            return const Center(
              child: Text("Your wishlist is empty 😢"),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final product = items[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.red),
                  title: Text(
                    product.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.grey),
                    onPressed: () {

                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
