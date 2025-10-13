import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.myController,
    this.texthint,
    this.keyboardtype,
    this.valid,
    this.onTap,
  });
  final TextEditingController? myController;
  final String? texthint;
  final TextInputType? keyboardtype;
  final String? Function(String?)? valid;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboardtype,
      validator: valid,
      decoration: InputDecoration(
        hintText: texthint,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
