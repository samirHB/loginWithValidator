import 'package:flutter/material.dart';

Widget defaultTextField({
  required String label,
  required IconData prefix,
  required TextInputType type,
  bool isPassword = false,
  required TextEditingController controller,
  required validate,
  IconData? suffix,
  Function()? suffixPressed,
}) =>
    TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
      ),
    );

Widget defaultButton({
  required String text,
  required Function()? function,
}) =>
    Container(
      child: MaterialButton(
        onPressed: function,
        child: Text(text),
      ),
    );
