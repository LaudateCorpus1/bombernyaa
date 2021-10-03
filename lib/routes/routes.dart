import 'package:bombernyaa/models/constants/route_names.dart';
import 'package:bombernyaa/routes/bindings/game_binding.dart';
import 'package:bombernyaa/routes/bindings/home_binding.dart';
import 'package:bombernyaa/views/game_menu.dart';
import 'package:bombernyaa/views/home.dart';
import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(
      name: routeName.reverse[RouteNames.home]!,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: routeName.reverse[RouteNames.gameMemu]!,
      page: () => GameMenu(),
      binding: GameBinding(),
    ),
  ];
}
