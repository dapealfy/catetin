import 'package:catetin/app/modules/home/controllers/add_todo_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddTodoView extends GetView {
  const AddTodoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catetan'),
        centerTitle: true,
      ),
      body: GetBuilder<AddTodoController>(
          init: AddTodoController(),
          builder: (addTodoController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: TextField(
                    controller: addTodoController.todo,
                    decoration: InputDecoration(labelText: 'Deskripsi'),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      addTodoController.addTodo();
                    },
                    child: Text('Tambah'),
                  ),
                )
              ],
            );
          }),
    );
  }
}
