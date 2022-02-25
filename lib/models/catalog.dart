import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state_management_solution/models/dummy_list.dart';

class CatalogModel {
  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) => Item(id, itemArray[id % itemArray.length].name,
      itemArray[id % itemArray.length].price);

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.

    return getById(position);
  }

  DummyList dummyList = DummyList();

  List<Item> itemArray = List<Item>.generate(5, (index) => Item(index+1, "Item no "+(index+1).toString(),(index+1)*10));
/*;(){
     List<Item> dummyList=[];



  return dummyList;
  } as List<Item>;*/

}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price; //= Random().nextInt(100);

  Item(this.id, this.name, this.price)
      // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
