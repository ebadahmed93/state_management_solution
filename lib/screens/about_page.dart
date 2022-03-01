import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_solution/controllers/my_home_controller.dart';
import 'package:state_management_solution/controllers/product_controller.dart';
import 'package:state_management_solution/model/Item.dart';
import 'package:state_management_solution/screens/add_form.dart';
import 'package:state_management_solution/screens/form_list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AboutPage extends StatelessWidget {
  final Products _p = Get.put(Products());

  AboutPage({Key? key}) : super(key: key);
 int pos=0;
  bool firstTime = true;

  delete( int index) {

     // _p.deleteItem(index);
   _p.deleteItem(index);

  }

  void doNothing(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Form'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // This button also shows you how many items in the wish list
          // It lets you go to the WishListScreen
          InkWell(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              // Use Obx(()=> to update Text() whenever _wishList.items.length is changed
              child: Obx(() => Text(
                    'Form List: ${_p.wishListItems.length}',
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  )),
            ),
            onTap: () => Get.to(FormListScreen()),
          ),

          const SizedBox(
            height: 20,
          ),

          Expanded(
            // Display all products in home screen
            child: Obx(
              () => ListView.builder(
                  itemCount: _p.items.length,
                  // List item widget
                  itemBuilder: (context, index) {
                    final product = _p.items[index];
                    return Card(
                      key: ValueKey(product.id),
                      margin: EdgeInsets.all(5),
                      color: Colors.amberAccent,
                      child: Slidable(
                          // Specify a key if the Slidable is dismissible.
                          key: UniqueKey(),


                          // The start action pane is the one at the left or the top side.
                          startActionPane: ActionPane(
                            // A motion is a widget used to control how the pane animates.
                            motion: const StretchMotion(),

                            // A pane can dismiss the Slidable.

                            // All actions are defined in the children parameter.
                            children: [
                              // A SlidableAction can have an icon and/or a label.
                              SlidableAction(
                                onPressed: doNothing,
                                backgroundColor: Color(0xFF21B7CA),
                                foregroundColor: Colors.white,
                                icon: Icons.share,
                                label: 'Share',
                              ),
                              SlidableAction(
                                onPressed:(context){ delete(index);},
                                backgroundColor: Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),

                          // The end action pane is the one at the right or the bottom side.

                          // The child of the Slidable is what the user sees when the
                          // component is not dragged.
                          child: ListTile(
                            title: Text(product.name),
                            // subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                            subtitle: Text(product.detail),
                            // Use Obx(()=> to update icon color when product.inWishList change
                            trailing: Obx(() => IconButton(
                                  onPressed: () {
                                    if (product.inWishList.value == false) {
                                      _p.addItem(product.id);
                                    } else {
                                      _p.removeItem(product.id);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: product.inWishList.value == false
                                        ? Colors.white
                                        : Colors.red,
                                  ),
                                )),
                          )),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddForm());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
