import 'package:get/get.dart';

class Item {
  int id;
  String name;
  String detail;
  RxBool
      inWishList; // Make inWishList observable by using the RxBool type and adding ".obs" (".obs" will be added in the Products class).
  Item(
      {required this.id,
      required this.name,
      required this.detail,
      required this.inWishList});
}
