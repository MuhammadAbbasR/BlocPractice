part of 'cart_bloc.dart';

abstract class HomeStates{}

abstract class HomeActionStates extends HomeStates{

}

class HomeInitial extends HomeStates{}

class HomeLoadingState extends HomeStates{}

class HomeErrorState extends HomeStates{}

class HomeSuccessState extends HomeStates{

  final List<ProductDataModel> list;

  HomeSuccessState(
      this.list
      );

}

class HomeNavigateCartActionStates extends HomeActionStates{}

class HomeNavigateWishListActionStates extends HomeActionStates{}
