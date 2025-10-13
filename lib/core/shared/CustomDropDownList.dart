import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/controller/Ads/AddFullAdController.dart';
import 'package:syria_sell/core/constant/AppColor.dart';

class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({
    super.key,
    this.valid,
    required this.title,
    required this.listData,
    required this.dropName,
    required this.dropId,
  });

  final String? Function(String?)? valid;
  final String title;
  final List<SelectedListItem> listData;
  final TextEditingController dropName;
  final TextEditingController dropId;

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  showDropDown(context) {
    DropDownState(
      DropDown(
        dropDownBackgroundColor: Kcolor().kBackgroundDropDown,
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: Text(
          "163".tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listData,

        // إسناد القيمة المختارة
        selectedItems: (List<dynamic> selectedList) {
          if (selectedList.isNotEmpty) {
            SelectedListItem varSelectedListItem = selectedList[0];
            widget.dropName.text = varSelectedListItem.name;
            widget.dropId.text = varSelectedListItem.value ?? "";

            // ✅ استدعاء update لإعادة بناء الواجهة
            try {
              final controller = Get.find<AddAdFullControllerImp>();
              controller.update();
            } catch (e) {
              print("لم يتم العثور على الكونترولر: $e");
            }

            print("------------------");
            print(widget.dropName.text);
            print(widget.dropId.text);
            print("------------------");
          }
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.valid,
      controller: widget.dropName,
      readOnly: true, // منع الكتابة اليدوية
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDown(context);
      },
      decoration: InputDecoration(
        hintText: widget.title,
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
        suffixIcon: const Icon(Icons.arrow_drop_down), // ✅ بدون onTap فارغ
      ),
    );
  }
}
