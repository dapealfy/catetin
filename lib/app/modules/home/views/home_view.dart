import 'package:catetin/app/modules/home/views/add_todo_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catetin'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              c.removeAll();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (state) {
            c.openBoxFavorite();
          },
          builder: (homeController) {
            return ListView.builder(
              itemCount: homeController.box == null
                  ? 0
                  : homeController.box!.values.length,
              itemBuilder: (context, index) {
                var todo = homeController.box!.getAt(index);
                return ListTile(
                  title: Text(todo['todo']),
                  trailing: IconButton(
                    onPressed: () {
                      homeController.removeTodo(index);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddTodoView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
