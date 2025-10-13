import 'package:get/get.dart';

validInput(String valu, int min, int max, String type) {
  valu = valu.trim();

  // تحقق إذا الحقل فارغ
  if (valu.isEmpty) {
    return "213".tr;
  }

  // تحقق الطول
  if (valu.length < min) {
    return "can't be less than $min";
  }
  if (valu.length > max) {
    return "can't be larger than $max";
  }

  // تحقق حسب النوع
  if (type == "username") {
    if (!GetUtils.isUsername(valu)) {
      return "not valid username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(valu)) {
      return "not valid Email";
    }
  }

  if (type == "phonenumber") {
    // رقم هاتف دولي بدون +
    final phoneRegExp = RegExp(r'^\d{9,15}$'); // من 9 إلى 15 رقم
    if (!phoneRegExp.hasMatch(valu)) {
      return "not valid PhoneNumber";
    }
  }

  // إذا type emailorphone، جرب الإيميل أو رقم الهاتف
  // تحويل الأرقام الهندية إلى لاتينية
  String convertArabicToEnglishDigits(String input) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    for (int i = 0; i < arabicDigits.length; i++) {
      input = input.replaceAll(arabicDigits[i], englishDigits[i]);
    }
    return input;
  }

  if (type == "emailorphone") {
    final normalizedValue = convertArabicToEnglishDigits(valu);
    final isEmail = GetUtils.isEmail(normalizedValue);
    final isPhone = RegExp(r'^\d{9,15}$').hasMatch(normalizedValue);

    if (!isEmail && !isPhone) {
      return "Enter a valid Email or Phone Number";
    }
  }

  return null; // صحيح
}
