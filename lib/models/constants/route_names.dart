import 'package:bombernyaa/utils/enum_values.dart';

enum RouteNames { home, gameMemu }

final routeName = EnumValues({
  '/': RouteNames.home,
  '/game_menu': RouteNames.gameMemu,
});
