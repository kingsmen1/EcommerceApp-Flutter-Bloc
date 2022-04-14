import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Categoryy extends Equatable {
  final String name;
  final String imageUrl;

  const Categoryy({required this.name, required this.imageUrl});

  @override List<Object?> get props => [name, imageUrl];

  static Categoryy fromSnapShot(DocumentSnapshot snap) {
    Categoryy category =
        Categoryy(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Categoryy> categories = [
     Categoryy(
        name: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=708&q=80'),
    Categoryy(
        name: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    Categoryy(
        name: 'Water',
        imageUrl:
            'https://images.unsplash.com/photo-1561041695-d2fadf9f318c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  ];
}
