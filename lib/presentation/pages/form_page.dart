import 'package:do_practice_web/model/form_list_model.dart';
import 'package:do_practice_web/presentation/common/form_field.dart';
import 'package:do_practice_web/presentation/common/side_menu.dart';
import 'package:do_practice_web/presentation/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FormPage extends GetView<FormController> {
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
      ),
    );
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
                  "Forms",
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
                                  height: 300,
                                  child: Form(
                                    key: controller.formKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Build Form",
                                            style: TextStyle(fontSize: 24)),
                                        formField(
                                            labelText: 'File Name',
                                            hintTexthandler: 'File Name',
                                            inputController:
                                                controller.filenameController),
                                        formField(
                                            labelText: 'Status',
                                            hintTexthandler: 'Status',
                                            inputController:
                                                controller.statusController),
                                        Container(
                                          width: double.infinity,
                                          height: 40,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: ElevatedButton(
                                            onPressed: controller.addForm,
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
                  child: Text("Build Form"),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<List<FormModel>>(
                stream: controller.getForms(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final forms = snapshot.data!;
                    return ListView(
                      children: forms.map(formTile).toList(),
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

  Widget formTile(FormModel form) {
    /*return ListTile(
      title: Text(form.id ?? "NO ID"),
      subtitle: Text(form.fileName ?? ""),
    );*/
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.folder),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(form.id ?? "NO ID"),
              Text(form.fileName ?? ""),
            ],
          ),
          SizedBox(
            width: 70,
            child: Text(form.status ?? ""),
          ),
          SizedBox(width: 150, child:Text(form.createdBy ?? "") ,),
          
          Text(form.dateCreated ?? ""),
   
          Container(
            width: 80,
            child: ElevatedButton(
              onPressed: () => print("Edit"),
              child: Text("Edit"),
            ),
          ),
          Container(
            width: 80,
            child: ElevatedButton(
              onPressed: () => print("Delete"),
              child: Text("Delete"),
            ),
          ),
        ],
      ),
    );
  }
}
