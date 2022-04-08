part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState extends Equatable {
  const WishlistState();
}

class WishlistLoading extends WishlistState {
  @override
  List<Object?> get props => [];
}

class WishlistLoaded extends WishlistState {
  final WishList wishList;

  const WishlistLoaded({this.wishList = const WishList()});

  @override
  List<Object?> get props => [wishList];
}

class WishlistError extends WishlistState {
  @override
  List<Object?> get props => [];
}
