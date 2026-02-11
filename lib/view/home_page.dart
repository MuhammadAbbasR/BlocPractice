import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc/cart_bloc.dart';
import 'cartlist_page.dart';
import 'wishlist_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeStates>(
      listenWhen: (previous, current) => current is HomeActionStates,
      buildWhen: (previous, current) => current is! HomeActionStates,
      listener: (context, state) {


        if (state is HomeNavigateCartActionStates) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartPage()),
          );
        }

        if (state is HomeNavigateWishListActionStates) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const WishlistPage()),
          );
        }


        if (state is HomeAddedToCartListState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to Cart 🛒"),
              duration: Duration(seconds: 1),
            ),
          );
        }

        if (state is HomeAddedToWishListState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to Wishlist ❤️"),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },

      builder: (context, state) {

        // Loading State
        if (state is HomeLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Error State
        if (state is HomeErrorState) {
          return const Scaffold(
            body: Center(child: Text("Something went wrong")),
          );
        }

        // Success State
        if (state is HomeSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Fresh Fruits Store"),
              centerTitle: true,
              backgroundColor: Colors.green,
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<HomeBloc>()
                        .add(HomeNavigateToWishList());
                  },
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {
                    context.read<HomeBloc>()
                        .add(HomeNavigateToCartList());
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
              ],
            ),

            body: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final product = state.list[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  child: ListTile(
                    leading: Image.network(
                      product.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border,
                              color: Colors.red),
                          onPressed: () {
                            context.read<HomeBloc>().add(
                              HomeButtonAddToWishListEvent(product),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart,
                              color: Colors.blue),
                          onPressed: () {
                            context.read<HomeBloc>().add(
                              HomeButtonAddToCartListEvent(product),
                            );
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

        return const SizedBox();
      },
    );
  }
}
