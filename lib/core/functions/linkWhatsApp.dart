import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/functions/Dialog.dart';
import 'package:url_launcher/url_launcher.dart';

void openWhatsApp(String phoneNumber) async {
  final whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    print("لا يمكن فتح واتساب");
    showInfoDialog("32".tr, "172".tr, dialogType: DialogType.error);
  }
}
