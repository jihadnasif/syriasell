import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    /*await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );*/

    sharedPreferences = await SharedPreferences.getInstance();
    //sharedPreferences.clear();
    // نفحص حالة التطبيق بعد بناء الـ widget tree
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkAppStatus();
    });

    return this;
  }

  Future<void> checkAppStatus() async {
    try {
      final response = await http.post(
        Uri.parse("https://syriasell.app/syriasell/users/checkAppConfig.php"),
      );

      if (response.statusCode != 200) {
        debugPrint("Error: HTTP ${response.statusCode}");
        return;
      }

      final data = json.decode(response.body);
      if (data == null || !data.containsKey('status')) return;

      String status = data['status'];
      Locale locale = Get.locale ?? const Locale("ar");

      if (status == "force_update") {
        String message = locale.languageCode == "en"
            ? "Please update the app to continue"
            : "يرجى تحديث التطبيق للمتابعة";

        String updateUrl = data['update_url'] ?? '';

        // عرض دايلوغ التحديث الإجباري
        Get.dialog(
          WillPopScope(
            onWillPop: () async => false, // يمنع إغلاق الدايلوغ
            child: AlertDialog(
              title: Text(locale.languageCode == "en"
                  ? "Update Required"
                  : "تحديث التطبيق"),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () async {
                    if (updateUrl.isNotEmpty &&
                        await canLaunchUrl(Uri.parse(updateUrl))) {
                      await launchUrl(Uri.parse(updateUrl),
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Text(locale.languageCode == "en"
                      ? "Update Now"
                      : "تحديث الآن"),
                ),
              ],
            ),
          ),
          barrierDismissible: false,
        );
      } else if (status == "maintenance") {
        String message = locale.languageCode == "en"
            ? (data['maintenance_message_en'] ??
                "Please wait, the application is under maintenance")
            : (data['maintenance_message_ar'] ??
                "يرجى الإنتظار من فضلك، التطبيق تحت الصيانة");

        // عرض دايلوغ الصيانة
        Get.dialog(
          WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title:
                  Text(locale.languageCode == "en" ? "Maintenance" : "الصيانة"),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop(); // إغلاق التطبيق
                  },
                  child: Text(locale.languageCode == "en" ? "OK" : "حسناً"),
                ),
              ],
            ),
          ),
          barrierDismissible: false,
        );
      }
    } catch (e) {
      debugPrint("Error checking app status: $e");
    }
  }
}

// استدعاء الخدمة قبل runApp
Future<void> initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
