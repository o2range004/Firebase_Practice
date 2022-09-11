import 'package:do_practice_web/presentation/controllers/auth_controller.dart';

import 'package:do_practice_web/routes/route_list.dart';
import 'package:do_practice_web/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB4aUe4jzruqaKz05OS9yJajDCo8BFGqak",
      appId: "1:1025329905093:web:6279198f6c7bb934b2dfac",
      messagingSenderId: "1025329905093",
      projectId: "fir-spike-10a91",
    ),
  ).then((value) => Get.put(
        AuthController(),
      ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.routes,
      initialRoute: RouteList.LOGINPAGE,
    );
  }
}
