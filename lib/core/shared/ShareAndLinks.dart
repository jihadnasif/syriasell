// lib/core/shared/ShareAndLinks.dart  (أو المسار الحقيقي عندك)
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

class ShareAndLinks {
  /// مشاركة (يمكن تحديد routePath مثل "ad" أو "jobApp")
  static Future<bool> shareAd({
    required String adId,
    required String adTitle,
    String routePath =
        "ad", // <-- افتراضي "ad". استخدم "jobApp" عند مشاركة وظائف
    VoidCallback? onShared,
  }) async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String packageName = packageInfo.packageName;

      // رابط التطبيق (custom scheme) مبني على routePath
      String deepLink = "syriasell://$routePath/$adId";

      // رابط ويب احتياطي (صفحة PHP أو صفحة ويب)
      String webLink = "https://syriasell.app/$routePath/$adId";

      // روابط المتجر
      String playStoreLink =
          "https://play.google.com/store/apps/details?id=$packageName";
      String appStoreLink = "https://apps.apple.com/app/idYOUR_APP_ID_HERE";

      // نص المشاركة
      String shareText = """
$adTitle

📱 افتح العنصر في التطبيق (إن كان مثبتًا):
$webLink

(جرب فتحه — النظام سيحاول فتح التطبيق أو فتح الصفحة للfallback)

📥 إذا لم يكن التطبيق مثبتًا:
Android: $playStoreLink
iOS: $appStoreLink
""";

      // مشاركة النص
      await Share.share(shareText, subject: adTitle);

      if (onShared != null) onShared();

      return true;
    } catch (e) {
      print("Error sharing ad: $e");
      return false;
    }
  }
}
