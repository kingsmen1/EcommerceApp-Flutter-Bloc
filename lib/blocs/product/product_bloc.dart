import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_eccomerce_app/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProduct);
    on<UpdateProduct>(_onUpdateProduct);
  }

  void _onLoadProduct(event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription =
        _productRepository.getAllProducts().listen((product) {
          add(UpdateProduct(product));
        });
  }

  void _onUpdateProduct(event, Emitter<ProductState> emit) {
    emit (ProductLoaded(products: event.products));
  }
}
