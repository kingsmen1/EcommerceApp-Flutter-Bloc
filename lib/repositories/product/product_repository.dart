import 'package:block_eccomerce_app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    //by snapshots() we retrieve all documents inside the collection
    return _firebaseFirestore.collection('products').snapshots().map(
        (snapShot) =>
            snapShot.docs.map((doc) => Product.fromSnapShot(doc)).toList());
  }
}