import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_solution/controllers/my_home_controller.dart';

import 'about_page.dart';


class MyHomePage extends StatelessWidget {
  final String title;
  final MyHomePageController controller = Get.put(MyHomePageController());
  MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is home page\nClick on Fab icon to move',
            ),
            // Obx(
            //       () => Text(
            //     '${controller.count.value}',
            //     style: Theme.of(context).textTheme.headline4,
            //   ),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {Get.to(AboutPage());},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}