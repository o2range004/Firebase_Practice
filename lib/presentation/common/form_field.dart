import 'package:flutter/material.dart';

Widget formField({
  required String labelText,
  required String hintTexthandler,
  required TextEditingController inputController,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: inputController,
      decoration: InputDecoration(
        hintText: hintTexthandler,
      ),
    ),
  );
}
