import 'package:equatable/equatable.dart';

import 'models.dart';

class Checkout extends Equatable {
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

  const Checkout(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.subtotal,
      this.deliveryFee,
      this.total,
      this.products});

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
        products
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;
    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products':products!.map((product) => product.name).toList(),
      'subtotal':subtotal!,
      'deliveryFee':deliveryFee!,
      'total': total!
    };
  }
}
