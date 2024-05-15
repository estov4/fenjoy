import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String? category;
  String? gredients;
  String? image;
  String? make;
  String? name;

  Food({
    this.category,
    this.gredients,
    this.image,
    this.make,
    this.name,
  });

  factory Food.fromFirestore(DocumentSnapshot snapshot) {
    Map d = snapshot.data() as Map<dynamic, dynamic>;
    return Food(
      category: d['category'],
      gredients: d['gredients'],
      image: d['image'],
      make: d['make'],
      name: d['name'],
    );
  }
}
