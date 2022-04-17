import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_eccomerce_app/blocs/blocs.dart';
import 'package:block_eccomerce_app/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ?  CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                total: (cartBloc.state as CartLoaded).cart.total,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotal,
                deliveryFee: (cartBloc.state as CartLoaded).cart.deliverFee)
            : CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(
          cart: state.cart,
        ));
      }
    });
  }

  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      //we check if the input is not null we take the input else we take the previous state value
      emit(CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliverFee ?? state.deliveryFee,
          subtotal: event.cart?.subtotal ?? state.subtotal,
          total: event.cart?.total ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode));
    }
  }

  void _onConfirmCheckout(
      ConfirmCheckout event, Emitter<CheckoutState> emit) async {
    final state = this.state;
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('done');
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }
}
