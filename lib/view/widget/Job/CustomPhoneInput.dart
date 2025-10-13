import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../core/constant/AppColor.dart';

class PhoneInputWidget extends StatelessWidget {
  final Function(String fullNumber) onChanged;
  final String initialCountry;

  const PhoneInputWidget({
    super.key,
    required this.onChanged,
    this.initialCountry = 'SY', // افتراضي سوريا
  });

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      key: const Key('phone-field'),
      initialValue: PhoneNumber.parse('+963'), // +963 = سوريا
      countrySelectorNavigator: const CountrySelectorNavigator.bottomSheet(),
      decoration: InputDecoration(
        labelText: '📞 رقم الهاتف',
        hintText: '912345678',
        prefixIcon: const Icon(Icons.phone, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Kcolor().kPrimaryColor,
            width: 3.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Kcolor().kPrimaryColor,
            width: 4.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Kcolor().kPrimaryColor,
            width: 3.0,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
      style: const TextStyle(fontSize: 16),
      enabled: true,
      isCountrySelectionEnabled: true,
      countryButtonStyle: const CountryButtonStyle(
        showFlag: false,
        showDialCode: true,
        showIsoCode: false,
        textStyle: TextStyle(fontSize: 15),
      ),
      //validator: PhoneValidator.validMobile(context),
      validator: (phone) {
        final nationalNumber = phone?.nsn ?? '';
        if (nationalNumber.isEmpty) {
          return '213'.tr;
        }
        return PhoneValidator.validMobile(context)(phone);
      },
      onChanged: (phoneNumber) {
        onChanged(phoneNumber.international ?? '');
      },
    );
  }
}
