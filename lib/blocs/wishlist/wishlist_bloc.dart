import 'package:bloc/bloc.dart';
import 'package:block_eccomerce_app/models/models.dart';
import 'package:block_eccomerce_app/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishList>(_onLoadWishList);
    on<AddProductToWishList>(_onAddProductToWishList);
    on<RemoveProductFromWishList>(_onRemoveProductFromWishList);
  }

  void _onLoadWishList(event, Emitter<WishlistState> emit) async{
    emit( WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
    emit (const WishlistLoaded());
    } catch (_) {}
  }

  void _onAddProductToWishList(event, Emitter<WishlistState> emit)  {
    final state  =  this.state;
    if (state is WishlistLoaded) {
      try {
        emit( WishlistLoaded(
            wishList: WishList(
            products: List.from(state.wishList.products)
          ..add(event.product))));
    } on Exception {
        emit (WishlistError());
      }
  }
  }

  void _onRemoveProductFromWishList(event, Emitter<WishlistState> emit) {
    final state  =  this.state;
    if (state is WishlistLoaded) {
      try {
        emit( WishlistLoaded(
            wishList: WishList(
            products: List.from(state.wishList.products)
          ..remove(event.product))));
    } on Exception{
        emit (WishlistError());
      }
  }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {


  }



}
