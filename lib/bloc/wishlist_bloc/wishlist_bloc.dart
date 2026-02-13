import 'dart:async';

import 'package:bloc/bloc.dart';

part  'wishlist_events.dart';
part 'wishlist_states.dart';


class WishListBloc extends Bloc<WishlistEvents,WishListStates>{
  //WishListBloc(super.initialState);


  WishListBloc():super(WishlistInitialStates()){// on<WishListFetch>(_wishListFetch);
  }

  FutureOr<void> _wishListFetch(){}

}
