part of 'cart_bloc.dart';



abstract class HomeEvents{}

class HomeInitialEvent extends HomeEvents{}

class HomeButtonAddToCartListEvent extends HomeEvents{

  final ProductDataModel productDataModel;
  HomeButtonAddToCartListEvent(
      this.productDataModel
      );

}

class HomeButtonAddToWishListEvent extends HomeEvents{

  final ProductDataModel productDataModel;
  HomeButtonAddToWishListEvent(
      this.productDataModel
      );




}


class HomeNavigateToCartList extends HomeEvents{}

class HomeNavigateToWishList extends HomeEvents{}

