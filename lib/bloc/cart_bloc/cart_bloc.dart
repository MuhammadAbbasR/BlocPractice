import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/cart_items.dart';
import 'package:bloc_practice/data/wishlist_items.dart';
import 'package:bloc_practice/models/product_model.dart';
import '../../data/grocerry_data.dart';
part 'cart_events.dart';
part "cart_states.dart";


class HomeBloc extends Bloc<HomeEvents,HomeStates>{

  HomeBloc():super(HomeInitial()){
on<HomeInitialEvent>(homeInitialEvent);
on<HomeNavigateToCartList>(homeCartListButtonNavigationEvent);
on<HomeNavigateToWishList>(homeWishListButtonNavigationEvent);
on<HomeButtonAddToCartListEvent>(homeAddToCartButtonEvent);
on<HomeButtonAddToWishListEvent>(homeAddToWishListEvent);

add(HomeInitialEvent());

  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event,Emitter<HomeStates> states)async{

    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 5));
    emit(HomeSuccessState(
         GroceryData.groceryProducts
            .map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl']))
            .toList()));
    
  }

  
  FutureOr<void> homeAddToCartButtonEvent(
      HomeButtonAddToCartListEvent event,Emitter<HomeStates> states
      ){
     
    cartItems.add(event.productDataModel);
   // emit(HomeAddToCartState());
    print("Event cartlist pressed");
    emit(HomeAddedToCartListState());
  //  print("Current state: ${state.runtimeType}");

  }

  FutureOr<void> homeAddToWishListEvent(
      HomeButtonAddToWishListEvent event, Emitter<HomeStates> states
      )async{

    wishlistItems.add(event.productDataModel);
 //   emit(HomeAddToWishListState());
    print("Event wishlist pressed");
   emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));

    emit(HomeAddedToWishListState());
   // print("Current state: ${state.runtimeType}");

  }
  
  FutureOr<void> homeWishListButtonNavigationEvent(
      HomeNavigateToWishList event, Emitter<HomeStates> states)
  {

    print('NAVIGATE TO WISH LIST EVENT PRESS');
    emit(HomeNavigateWishListActionStates());

  }

  FutureOr<void> homeCartListButtonNavigationEvent(
      HomeNavigateToCartList event, Emitter<HomeStates> states
      ){

    print('NAVIGATE TO Cart LIST EVENT PRESS');
    emit(HomeNavigateCartActionStates());

  }

}
