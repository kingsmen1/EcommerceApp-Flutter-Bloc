import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_eccomerce_app/repositories/category/category_repository.dart';
import '/../models/models.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(LoadCategories event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel(); //first we cancel the previous subscription
    _categorySubscription =
        _categoryRepository.getAllCategories().listen((categories) {
      //we get all the categories by listening to Stream from categoryRepository.getAllCategories method and  then call UpdateCategories Event and pass the categories by mapping into it .
      add(UpdateCategories(categories));
    });
  }

  void _onUpdateCategories(event, Emitter<CategoryState> emit) {
    // This Event is triggered in _onLoadCategories() method . We emit new state of CategoryLoaded by passing event.categories.
    emit(CategoryLoaded(categories: event.categories));
  }
}
