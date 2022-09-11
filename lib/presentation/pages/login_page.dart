import 'package:do_practice_web/presentation/common/form_field.dart';
import 'package:do_practice_web/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 450,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("App",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 40,
                ),
                formField(
                    labelText: "Your Email",
                    hintTexthandler: "Email Address",
                    inputController: controller.emailController),
                formField(
                  labelText: "Your Password",
                  hintTexthandler: "Password",
                  inputController: controller.passwordController,
                ),
                Container(
                    width: double.infinity,
                    height: 40,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: controller.login,
                      child: Text("Login"),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget LoginForm(
    {required TextEditingController emailController,
    required TextEditingController passwordController,
    required VoidCallback login}) {
  return Center(
    child: Container(
      width: 450,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Form Builder App",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 40,
            ),
            formField(
                labelText: "Your Email",
                hintTexthandler: "Email Address",
                inputController: emailController),
            formField(
              labelText: "Your Password",
              hintTexthandler: "Password",
              inputController: passwordController,
            ),
            Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: login,
                  child: Text("Login"),
                )),
          ],
        ),
      ),
    ),
  );
}
