import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_practice_web/model/form_list_model.dart';
import 'package:do_practice_web/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final String collectionName = 'forms';
  final db = FirebaseFirestore.instance;
  RxList<FormModel> formslist = <FormModel>[].obs;
  final formKey = GlobalKey<FormState>();
  final filenameController = TextEditingController();
  final statusController = TextEditingController();
  final String currentUserEmail = Get.find<AuthController>().userEmail;

  @override
  void onInit() {
    super.onInit();
    getForms();
  }

  void addForm() {
    buildForm(
        fileName: filenameController.text,
        status: statusController.text);
    getForms();
  }

  Future buildForm(
      {required String fileName,
      required String status,}) async {
    final docForm = db.collection(collectionName).doc();
    final newForm = FormModel(
      id: docForm.id,
      fileName: fileName,
      dateCreated: DateTime.now().toLocal().toString(),
      status: status,
      createdBy: currentUserEmail,
      dateEdited: DateTime.now().toLocal().toString(),
    );
    await docForm
        .set(newForm.toJson())
        .then(
          (value) => print('Success'),
        )
        .onError(
          (error, stackTrace) => print(error),
        );
  }

  Stream<List<FormModel>> getForms() => db.collection(collectionName).snapshots().map((event) => event.docs.map((e) => FormModel.fromJson(e.data())).toList());

}
