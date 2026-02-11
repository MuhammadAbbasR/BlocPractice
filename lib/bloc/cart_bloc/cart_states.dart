part of 'cart_bloc.dart';

abstract class HomeStates {}

abstract class HomeActionStates extends HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeErrorState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<ProductDataModel> list;
  HomeSuccessState(this.list);
}

class HomeSuccessCartListFetchState extends HomeStates{

}

class HomeSuccessWishListFetchState extends HomeStates{

}

class HomeNavigateCartActionStates extends HomeActionStates {}

class HomeNavigateWishListActionStates extends HomeActionStates {}

class HomeAddedToWishListState extends HomeActionStates {}

class HomeAddedToCartListState extends HomeActionStates {}

class HomeRemovedToWishListState extends HomeActionStates {}

class HomeRemovedToCartListState extends HomeActionStates {}



