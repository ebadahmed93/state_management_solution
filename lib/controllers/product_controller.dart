import 'package:get/get.dart';
import 'dart:math';

import 'package:state_management_solution/model/Item.dart';

class Products extends GetxController {
  // All products
  // In production, these things usually be loaded them from API or database or something like that
  final RxList<Item> _items = List.generate(
      5,
          (index) => Item(
          id: index,
          name: 'Product $index',
          detail: 'Price of the product is '+(Random().nextDouble().toStringAsFixed(2)  ).toString(),
          inWishList: false.obs)).obs;

  // Use this to retrieve all products
  List<Item> get items {
    return [..._items];
  }

  // This will return the products that were added to wish list
  List<Item> get wishListItems {
    return _items.where((item) => item.inWishList.value == true).toList();
  }

  // Add an item to the wish list
  void addItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = true;
  }

  // Remove an item from the wish list
  void removeItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = false;
  }

  void insertItem(item) {
    _items.add(item);
  }

  void deleteItem(int index) {
    _items.removeAt(index);
  }
}