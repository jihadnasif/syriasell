/*
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  static Future<Uri> createAdLink(String adId) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://syriasell.page.link', // من Firebase Console
      link: Uri.parse('https://syriasell.page.link/ad?adId=$adId'),
      androidParameters: const AndroidParameters(
        packageName:
            'com.example.syria_sell', // استبدل بالـ packageName تبع تطبيقك
        minimumVersion: 23,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.example.syria_sell', // استبدل بالـ iOS bundle ID
        minimumVersion: '1.0.0',
      ),
      socialMetaTagParameters: const SocialMetaTagParameters(
        title: 'إعلان جديد على SyriaSell',
        description: 'اضغط لمشاهدة تفاصيل الإعلان 👇',
      ),
    );

    final shortLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    return shortLink.shortUrl;
  }
}
*/
