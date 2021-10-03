import 'package:bombernyaa/controllers/game_controller.dart';
import 'package:get/get.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GameControler>(GameControler());
  }
}
