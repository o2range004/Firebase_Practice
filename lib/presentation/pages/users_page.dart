import 'package:do_practice_web/model/user_model.dart';
import 'package:do_practice_web/presentation/common/side_menu.dart';
import 'package:do_practice_web/presentation/controllers/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../common/form_field.dart';

class UsersPage extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Row(
        children: [
          SideMenu(),
          UserTable(context),
        ],
      ),
    ));
  }

  Expanded UserTable(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Users",
                  style: TextStyle(fontSize: 36),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
                              children: <Widget>[
                                Container(
                                  width: 400,
                                  height: 400,
                                  child: Form(
                                    key: controller.formKey,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Add User", style: TextStyle(fontSize: 24)),
                                        formField(
                                            labelText: 'Name',
                                            hintTexthandler: 'Name',
                                            inputController:
                                                controller.nameController),
                                        formField(
                                            labelText: 'Email',
                                            hintTexthandler: 'Email',
                                            inputController:
                                                controller.emailController),
                                        formField(
                                            labelText: 'Company',
                                            hintTexthandler: 'Company',
                                            inputController:
                                                controller.companyController),
                                        formField(
                                            labelText: 'Role',
                                            hintTexthandler: 'Role',
                                            inputController:
                                                controller.roleController),
                                        Container(
                                          width: double.infinity,
                                          height: 40,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: ElevatedButton(
                                            onPressed: controller.addUser,
                                            child: Text("Submit"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Text("Add User"),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<List<UserModel>>(
                stream: controller.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final users = snapshot.data!;
                    return ListView(
                      children: users.map(buildUser).toList(),
                    );
                  } else {
                    return Text("none");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  Widget buildUser(UserModel user) {
    return ListTile(
      title: Text(user.id ?? "NO ID"),
      subtitle: Text(user.name ?? ""),
    );
  }
}
