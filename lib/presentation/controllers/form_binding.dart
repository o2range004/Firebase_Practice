import 'package:do_practice_web/presentation/controllers/form_controller.dart';
import 'package:get/instance_manager.dart';

class FormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(() => FormController());
  }
}
