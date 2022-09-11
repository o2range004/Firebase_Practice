import 'package:do_practice_web/presentation/controllers/auth_controller.dart';
import 'package:do_practice_web/routes/route_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget SideMenu() {
  VoidCallback signOut = Get.find<AuthController>().signOut;
    return Container(
      width: 250,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      color: Color(0xffEBE8E4),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50, bottom: 30),
                    child: Text("App",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.folder),
                    title: const Text("My Forms"),
                    onTap: () => Get.toNamed(RouteList.FORMPAGE),
                  ),
                  ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text("Users"),
                    onTap: () =>  Get.toNamed(RouteList.USERSPAGE),
                  ),
                  const Expanded(
                    child: SizedBox(width: double.infinity),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: signOut,
                      child: const Text("Sign out"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
 
}

class MYANIMELIST {
}
