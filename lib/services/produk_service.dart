import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductService {
  final DatabaseReference _database =
      FirebaseDatabase.instance.reference().child('product_list');

  Stream<Map<String, String>> getProductList() {
    return _database.onValue.map((event) {
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;
      // print('Snapshot data: ${snapshot.value}');
      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          // print('Key: $key'); // Print the key
          // print('Value: $value'); // Print the value
          items[key] =
              'Product Code :${value['kode']} \nProduct Name : ${value['nama']}';
        });
      }
      return items;
    });
  }

  void addProductItem(
      String itemName1, String itemName2, BuildContext context) {
    if (itemName1.isEmpty || itemName2.isEmpty) {
      const warning = SnackBar(content: Text('Produk masih kosong '));
      ScaffoldMessenger.of(context).showSnackBar(warning);
    } else {
      _database.push().set({'kode': itemName1, 'nama': itemName2});
    }
  }

  Future<void> removeProductItem(String key) async {
    await _database.child(key).remove();
  }
}
