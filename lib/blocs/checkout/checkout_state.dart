part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();
}

class CheckoutLoading extends CheckoutState {
  @override
  List<Object> get props => [];
}

class CheckoutLoaded extends CheckoutState {
  final String? fullName,
      email,
      address,
      city,
      country,
      zipCode,
      subtotal,
      deliveryFee,
      total;
  final List<Product>? products;
  final Checkout checkout;

  CheckoutLoaded({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.products,
  }) : checkout = Checkout(
            products: products,
            address: address,
            city: city,
            country: country,
            deliveryFee: deliveryFee,
            email: email,
            fullName: fullName,
            subtotal: subtotal,
            total: total,
            zipCode: zipCode);

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        subtotal,
        deliveryFee,
        total,
        products,
        checkout,
      ];
}
