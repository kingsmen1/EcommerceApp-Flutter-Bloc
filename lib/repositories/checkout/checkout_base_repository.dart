import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout (Checkout checkout);
}