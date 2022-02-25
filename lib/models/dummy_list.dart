import 'catalog.dart';

class DummyList {
  List<Item> itemList = [];

  List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
  ];

  List<int> itemValues = [10, 20, 30, 40, 50, 60];

  List<Item> getDummyListArray() {
    if (itemList.isNotEmpty) {
      return itemList;
    } else {
      for (int i = 0; i < 6; i++) {
        Item item = Item(i + 1, itemNames[i], itemValues[i]);
        itemList.add(item);
      }
      return itemList;
    }
  }
}
