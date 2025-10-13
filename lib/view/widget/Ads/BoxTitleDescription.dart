import 'package:flutter/material.dart';

class BoxTitleDescription extends StatelessWidget {
  const BoxTitleDescription({
    super.key,
    this.valid,
    this.texthint,
    this.myController,
    this.keyboardtype,
  });
  final String? texthint;
  final String? Function(String?)? valid;
  final TextEditingController? myController;
  final TextInputType? keyboardtype;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      validator: valid,
      maxLines: 10, // عدد الأسطر الظاهرة
      minLines: 5,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintText: texthint,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        border: OutlineInputBorder(
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
      ),
    );
  }
}
