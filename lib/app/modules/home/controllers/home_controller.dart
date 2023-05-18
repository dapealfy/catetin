import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  Box? box;

  void openBoxFavorite() async {
    box = await Hive.openBox('favoritePlace');
    update();
  }

  removeAll() {
    box!.clear();
    update();
  }

  addTodo(data) {
    openBoxFavorite();
    box!.put(DateTime.now().toString(), data);
    update();
  }

  removeTodo(index) {
    box!.deleteAt(index);
    update();
  }

  updateBox() {
    box = box;
    update();
  }
}
