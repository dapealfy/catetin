import 'package:catetin/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  TextEditingController todo = TextEditingController();

  addTodo() {
    HomeController homeController = Get.put(HomeController());
    homeController.addTodo({
      'todo': todo.text,
      'createdAt': DateTime.now().toString(),
    });
    Get.back();
  }
}
