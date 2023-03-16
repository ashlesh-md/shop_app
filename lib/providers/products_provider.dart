import 'package:flutter/cupertino.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [];
  get items => [..._items];

  void addProduct(Product item) {
    _items.add(item);
    notifyListeners();
  }
}
