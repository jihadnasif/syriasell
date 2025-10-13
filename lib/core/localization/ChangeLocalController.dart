/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class LocalController extends GetxController {
  MyServices myServices = Get.find();
  Locale? language;
  @override
  void onInit() {
    language = const Locale('ar');
    super.onInit();
  }
}
*/
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/AppTheme.dart';
import '../services/services.dart';

class LocalController extends GetxController {
  Locale? language;
  ThemeData themeData = themeEnglish; // default value
  MyServices myServices = Get.put(MyServices());
  ChangedLanguage(String LangCode) {
    Locale local = Locale(LangCode);
    themeData = LangCode == "ar" ? themeArabic : themeEnglish;
    myServices.sharedPreferences.setString("lan", LangCode);
    Get.updateLocale(local);
    Get.changeTheme(themeData);
  }

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    /*if (!serviceEnabled) {
      return Get.snackbar("alert", "Please enable location permission");
    }*/
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      /*if (permission == LocationPermission.denied) {
        return Get.snackbar(
            "alert", "Please give location permission for the application");
      }

       */
    }
    /*if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("alert",
          "The application cannot be used without activation location permission");
    }

     */
  }

  @override
  void onInit() {
    //requestPermissionNotification();
    // firbasCluMass();
    requestPermissionLocation();
    String? shardPrefLang = myServices.sharedPreferences.getString("lan");
    if (shardPrefLang == "ar") {
      language = Locale("ar");
      themeData = themeArabic;
    } else {
      if (shardPrefLang == "en") {
        language = Locale("en");
        themeData = themeEnglish;
      } else {
        language = Locale(Get.deviceLocale!.languageCode);
        shardPrefLang = language.toString();
        shardPrefLang == "en"
            ? themeData = themeEnglish
            : themeData = themeArabic;
        myServices.sharedPreferences.setString("lan", shardPrefLang);
        Get.changeTheme(themeData);
        //themeData = themeEnglish; //زيادة تأكيد
      }
    }
    print("----------------");
    print(language);
    print(shardPrefLang);
    print(myServices.sharedPreferences.getString("lan"));
    print("----------------");
    super.onInit();
  }
/*
  void onInit() {
    super.onInit();
    language = const Locale("ar");
    themeData = themeArabic;
  }
*/
}
