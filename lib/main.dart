import 'package:bombernyaa/routes/bindings/home_binding.dart';
import 'package:bombernyaa/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.route,
      initialRoute: '/',
      initialBinding: HomeBinding(),
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
