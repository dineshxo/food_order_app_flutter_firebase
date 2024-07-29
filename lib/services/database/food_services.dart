import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_order/models/food.dart';

class FoodService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Food>> fetchFoodMenu() async {
    final QuerySnapshot snapshot = await _firestore.collection('foods').get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Food.fromMap(data);
    }).toList();
  }
}
