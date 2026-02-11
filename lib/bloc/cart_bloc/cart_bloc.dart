import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../data/grocerry_data.dart';
import '../../data/cart_items.dart';
import '../../data/wishlist_items.dart';
import '../../models/product_model.dart';

part 'cart_events.dart';
part 'cart_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_homeInitialEvent);
    on<HomeNavigateToCartList>(_homeNavigateToCartList);
    on<HomeNavigateToWishList>(_homeNavigateToWishList);
    on<HomeButtonAddToCartListEvent>(_homeAddToCart);
    on<HomeButtonAddToWishListEvent>(_homeAddToWishList);
    on<HomeButtonRemoveToCartListEvent>(_homeRemoveToCart);
    on<HomeButtonRemoveToWishListEvent>(_homeRemoveToWishList);
    add(HomeInitialEvent());
  }

  Future<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeStates> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // simulate API call
    emit(HomeSuccessState(
      GroceryData.groceryProducts.map((e) => ProductDataModel(
        id: e['id'],
        name: e['name'],
        description: e['description'],
        price: e['price'],
        imageUrl: e['imageUrl'],
      )).toList(),
    ));
  }

  void _homeNavigateToCartList(
      HomeNavigateToCartList event, Emitter<HomeStates> emit) {
    emit(HomeNavigateCartActionStates());
  }

  void _homeNavigateToWishList(
      HomeNavigateToWishList event, Emitter<HomeStates> emit) {
    emit(HomeNavigateWishListActionStates());
  }

  void _homeAddToCart(
      HomeButtonAddToCartListEvent event, Emitter<HomeStates> emit) {
    cartItems.add(event.productDataModel);
    emit(HomeAddedToCartListState());
  }

  void _homeRemoveToCart(
      HomeButtonRemoveToCartListEvent event, Emitter<HomeStates> emit
      ){
    cartItems.remove(event.productDataModel);
    emit(HomeSuccessCartListFetchState());
  }

  void _homeAddToWishList(
      HomeButtonAddToWishListEvent event, Emitter<HomeStates> emit) {
    wishlistItems.add(event.productDataModel);
    emit(HomeAddedToWishListState());
  }

  void _homeRemoveToWishList(
      HomeButtonRemoveToWishListEvent event,Emitter<HomeStates> states
      ){
    wishlistItems.remove(event.productDataModel);
    emit(HomeSuccessWishListFetchState());
  }

}
