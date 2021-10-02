import 'package:bombernyaa/routes/bindings/home_binding.dart';
import 'package:bombernyaa/views/home.dart';
import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/',
      page: () => Home(),
      binding: HomeBinding(),
    ),
  ];
}
