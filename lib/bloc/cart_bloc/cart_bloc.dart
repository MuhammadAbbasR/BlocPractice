import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/models/product_model.dart';

import '../../data/grocerry_data.dart';
part 'cart_events.dart';
part "cart_states.dart";


class HomeBloc extends Bloc<HomeEvents,HomeStates>{

  HomeBloc():super(HomeInitial()){
on<HomeInitialEvent>(homeInitialEvent);
on<HomeNavigateToCartList>(homeCartListButtonNavigationEvent);
on<HomeNavigateToWishList>(homeWishListButtonNavigationEvent);

add(HomeInitialEvent());

  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event,Emitter<HomeStates> states){

    emit(HomeLoadingState());
    Future.delayed(Duration(seconds: 5));
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
