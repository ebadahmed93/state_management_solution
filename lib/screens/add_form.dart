import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_solution/controllers/product_controller.dart';
import 'package:state_management_solution/model/Item.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  AddFormPageState createState() => AddFormPageState();
}

class AddFormPageState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  final Products _p = Get.find<Products>();

  final nameController = TextEditingController();
  final detailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(80.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Insert new item',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  TextFormField(
                    controller: detailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter detail';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Detail',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    child: const Text('ENTER'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Item data = Item(
                            id: _p.items.length,
                            name: nameController.text,
                            detail: detailController.text,
                            inWishList: true.obs);

                        _p.insertItem(data);
                       Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}