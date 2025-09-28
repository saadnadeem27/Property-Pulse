import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import '../controllers/auth_controller.dart';
import '../controllers/location_controller.dart';
import '../controllers/property_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Core controllers that need to be initialized at app start
    Get.put(AppController(), permanent: true);
    Get.put(AuthController(), permanent: true);
    Get.put(LocationController(), permanent: true);
    Get.put(PropertyController(), permanent: true);
  }
}