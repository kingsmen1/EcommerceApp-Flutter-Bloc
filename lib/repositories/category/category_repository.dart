import 'package:block_eccomerce_app/models/category_model.dart';
import 'package:block_eccomerce_app/repositories/category/base_category_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore
      _firebaseFirestore; //creating Instance for FirebaseFirestore

  CategoryRepository(
      {FirebaseFirestore?
          firebaseFirestore}) //initializing variable _firebaseFirestore
      : _firebaseFirestore = firebaseFirestore ??
            FirebaseFirestore.instance; //?? this operator means "if null"

  @override
  Stream<List<Categoryy>> getAllCategories() {
    //For each document we return category class instance / .snapshots() returns a query or list of documents in our collection.
    return _firebaseFirestore.collection('categories').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Categoryy.fromSnapShot(doc)).toList());
  }
}
