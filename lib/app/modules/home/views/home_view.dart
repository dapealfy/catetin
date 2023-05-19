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
              Get.dialog(deleteAllDialog(c));
            },
            icon: Icon(Icons.delete_forever),
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
                return Dismissible(
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    color: Colors.red[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    homeController.removeTodo(index);
                  },
                  key: Key(DateTime.now().toString()),
                  child: ListTile(
                    onTap: () {
                      c.checkTodo(index, todo);
                    },
                    title: Text(
                      todo['todo'],
                      style: todo['checked'] == true
                          ? TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            )
                          : TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        homeController.removeTodo(index);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.red[300],
                      ),
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

Widget deleteAllDialog(c) {
  return AlertDialog(
    title: Text('Apa kamu yakin ingin hapus semua?'),
    actions: [
      MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Batal')),
      ElevatedButton(
          onPressed: () {
            c.removeAll();
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Hapus',
            ),
          )),
    ],
  );
}
