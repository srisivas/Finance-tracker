import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
