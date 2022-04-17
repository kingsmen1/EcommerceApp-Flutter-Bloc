part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName, email, address, city, country, zipCode;
  final Cart? cart;

  UpdateCheckout({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.cart,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [fullName, email, address, city, country, zipCode,
  cart];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  ConfirmCheckout({required this.checkout});

  @override
  // TODO: implement props
  List<Object?> get props => [checkout];
}
