import 'package:do_practice_web/presentation/controllers/users_controller.dart';
import 'package:get/instance_manager.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
  }
}
