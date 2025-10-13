import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class DropDownSelectedMap extends StatelessWidget {
  const DropDownSelectedMap({
    super.key,
    this.val,
    this.onChange,
    this.texthint,
    this.valid,
    this.listDropDown,
  });

  final Map<String, dynamic>? val;
  final String? texthint;
  final String? Function(Map<String, dynamic>?)? valid;
  final void Function(Map<String, dynamic>?)? onChange;
  final List<Map<String, dynamic>>? listDropDown;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<Map<String, dynamic>>(
      value: val,
      onChanged: onChange,
      items: listDropDown?.map((item) {
        return DropdownMenuItem<Map<String, dynamic>>(
          value: item,
          child: Text(item["name"] ?? ""),
        );
      }).toList(),
      validator: (value) {
        if (valid != null) return valid!(value);
        return null;
      },
      decoration: InputDecoration(
        hintText: texthint,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        filled: true,
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
      dropdownStyleData: DropdownStyleData(
        maxHeight: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          color: Kcolor().kBackgroundDropDown,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
