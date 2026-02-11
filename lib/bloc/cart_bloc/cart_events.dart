part of 'cart_bloc.dart';

abstract class HomeEvents {}

class HomeInitialEvent extends HomeEvents {}

class WishListFetchEvent extends HomeEvents{}

class CartListFetchEvent extends HomeEvents{}

class HomeButtonAddToCartListEvent extends HomeEvents {
  final ProductDataModel productDataModel;
  HomeButtonAddToCartListEvent(this.productDataModel);
}

class HomeButtonAddToWishListEvent extends HomeEvents {
  final ProductDataModel productDataModel;
  HomeButtonAddToWishListEvent(this.productDataModel);
}

class HomeButtonRemoveToWishListEvent extends HomeEvents {
  final ProductDataModel productDataModel;
  HomeButtonRemoveToWishListEvent(this.productDataModel);
}

class HomeButtonRemoveToCartListEvent extends HomeEvents {
  final ProductDataModel productDataModel;
  HomeButtonRemoveToCartListEvent(this.productDataModel);
}

class HomeNavigateToCartList extends HomeEvents {}

class HomeNavigateToWishList extends HomeEvents {}
