import 'package:block_eccomerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products){
    var quantity = {};
    products.forEach((product){
      if(!quantity.containsKey(product)){
        quantity[product] = 1;
      }else{
        quantity[product] +=1;
      }
    });
    return quantity;
  }

  double get subtotalD {
    return products.fold(
        0, (previousValue, element) => previousValue + element.price);
  }

  double get deliveryFeeD {
    if (subtotalD > 30) {
      return 0.0;
    } else {
      return 10.0;
    }
  }



  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return 'Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add ${missing.toStringAsFixed(2)} for FREE DELIVERY';
    }
  }

  double totalD(subtotal, deliveryfee) {
    return subtotal + deliveryfee;
  }

  String get subtotal {
    return subtotalD.toStringAsFixed(2);
  }

  String get deliverFee {
    return deliveryFeeD.toStringAsFixed(2);
  }

  String get freeDeliveryString {
    return freeDelivery(subtotalD);
  }

  String get total {
    return totalD(subtotalD, deliveryFeeD).toStringAsFixed(2);
  }




}
