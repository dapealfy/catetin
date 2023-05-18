import 'package:get/get.dart';

import 'package:catetin/app/modules/home/controllers/add_todo_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(
      () => AddTodoController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
