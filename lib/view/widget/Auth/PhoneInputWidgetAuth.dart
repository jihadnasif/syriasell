import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../core/constant/AppColor.dart';

class PhoneInputWidgetAuth extends StatelessWidget {
  final Function(String fullNumber) onChanged;
  final String initialIsoCode;

  const PhoneInputWidgetAuth({
    super.key,
    required this.onChanged,
    this.initialIsoCode = 'SY', // افتراضي سوريا
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Kcolor().kPrimaryColor,
          width: 3.0,
        ),
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          onChanged(number.phoneNumber ?? '');
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
          showFlags: false,
        ),
        initialValue: PhoneNumber(isoCode: initialIsoCode),
        textFieldController: controller,
        inputDecoration: InputDecoration(
          labelText: "8".tr,
          hintText: "912345678",
          prefixIcon: const Icon(Icons.phone, color: Colors.blue),
        ),
        keyboardType: TextInputType.phone,
        formatInput: true,
        autoValidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
