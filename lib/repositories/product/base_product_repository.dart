import 'package:block_eccomerce_app/models/models.dart';

abstract class BaseProductRepository{
  Stream<List<Product>> getAllProducts();
}