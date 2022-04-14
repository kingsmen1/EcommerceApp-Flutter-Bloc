import 'package:block_eccomerce_app/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Categoryy>> getAllCategories();
}