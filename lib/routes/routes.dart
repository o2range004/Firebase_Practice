import 'package:do_practice_web/presentation/controllers/form_binding.dart';
import 'package:do_practice_web/presentation/controllers/login_binding.dart';
import 'package:do_practice_web/presentation/controllers/users_binding.dart';
import 'package:do_practice_web/presentation/pages/form_page.dart';
import 'package:do_practice_web/presentation/pages/login_page.dart';
import 'package:do_practice_web/presentation/pages/users_page.dart';
import 'package:do_practice_web/routes/route_list.dart';
import 'package:get/route_manager.dart';

class Routes {
  static List<GetPage> routes = [
    GetPage(name: RouteList.FORMPAGE, page: () => FormPage(), binding: FormBinding()),
    GetPage(name: RouteList.USERSPAGE, page: () => UsersPage(), binding: UsersBinding()),
    GetPage(name: RouteList.LOGINPAGE, page: () => LoginPage(), binding: LoginBinding()),
  ];
}
