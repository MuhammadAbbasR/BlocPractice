import 'package:bloc_practice/view/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc/cart_bloc.dart';
import 'cartlist_page.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeBloc homeBloc = HomeBloc();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeStates>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionStates,
      buildWhen: (previous, current) => current is! HomeActionStates,
      listener: (context, state) {
        if (state is HomeNavigateCartActionStates) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        } else if (state is HomeNavigateWishListActionStates) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistPage()),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {

          case HomeLoadingState :
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Fresh Fruits Store",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.green[700],
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToWishList());
                      // homeBloc.
                    },
                    icon: Icon(Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToCartList());
                    },
                    icon: Icon(Icons.shopping_bag_outlined,
                    color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: Center(child: CircularProgressIndicator()),
            );

          case HomeErrorState :

            return Scaffold(body: Center(child: Text('Error')));

          case HomeSuccessState:

            final successState= state as HomeSuccessState;

            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Fresh Fruits Store",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.green[700],
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToWishList());
                      // homeBloc.
                    },
                    icon: Icon(Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToCartList());
                    },
                    icon: Icon(Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: successState.list.length,
                  itemBuilder: (context, index) {
                    final product = successState.list[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                //   BlocProvider.of<HomeBloc>(context)
                                //       .add(HomeProductWishlistButtonClickedEvent(
                                //       clickedProduct: product));
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                //   BlocProvider.of<HomeBloc>(context)
                                //       .add(HomeProductCartButtonClickedEvent(
                                //       clickedProduct: product));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );


          default:

            return SizedBox();
            
        }
      },
    );
  }
}
