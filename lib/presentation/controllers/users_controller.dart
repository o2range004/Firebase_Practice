import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_practice_web/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class UsersController extends GetxController {
  final String collectionName = 'users';
  final db = FirebaseFirestore.instance;
  RxList<UserModel> userslist = <UserModel>[].obs;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final roleController = TextEditingController();

  @override
  void onInit() { 
    super.onInit();
    getUsers();
  }

  void addUser() {
    createUser(name: nameController.text, email: emailController.text, company: companyController.text, role: roleController.text);
    getUsers(); 
  }

  Future createUser({required String name, required String email, required String company, required String role}) async {
    final docUser = db.collection(collectionName).doc();
    final newUser = UserModel(
      id: docUser.id,
      name: name,
      email: email,
      company: company,
      role: role,
    );
    await docUser
        .set(newUser.toJson())
        .then(
          (value) => print('Success'),
        )
        .onError(
          (error, stackTrace) => print(error),
        );
  }


Stream<List<UserModel>> getUsers() => db.collection(collectionName).snapshots().map((event) => event.docs.map((e) => UserModel.fromJson(e.data())).toList());
  /*
  Future getUsers() async {
    db.collection(collectionName).get()
    .then((snapshot) {
      final listx = snapshot.docs
          .map(
            (doc) => User.fromJson(
              doc.data(),
            ),
          )
          .toList();
      userslist.assignAll(listx);
      print(userslist);
    })
    .onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }*/
}
