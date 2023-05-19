import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init('${(await getApplicationDocumentsDirectory()).path}/databases');
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      title: "Catetin",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
