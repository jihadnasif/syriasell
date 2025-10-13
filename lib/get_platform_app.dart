import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

class GetPlatformApp extends StatelessWidget {
  final String title;
  final Widget? home; // ✅ أصبحت اختيارية
  final ThemeData? materialTheme;
  final CupertinoThemeData? cupertinoTheme;

  final Translations? translations;
  final Locale? locale;
  final Bindings? initialBinding;
  final List<GetPage<dynamic>>? getPages;

  const GetPlatformApp({
    super.key,
    required this.title,
    this.home, // ✅ لم تعد مطلوبة
    this.materialTheme,
    this.cupertinoTheme,
    this.translations,
    this.locale,
    this.initialBinding,
    this.getPages,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: title,
      material: (_, __) => MaterialAppData(
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          translations: translations,
          locale: locale,
          theme: materialTheme,
          initialBinding: initialBinding,
          getPages: getPages,
          home: home, // ✅ يمكن أن تكون null
        ),
      ),
      cupertino: (_, __) => CupertinoAppData(
        builder: (context, child) => GetCupertinoApp(
          title: title,
          translations: translations,
          locale: locale,
          theme: cupertinoTheme,
          initialBinding: initialBinding,
          getPages: getPages,
          home: home, // ✅ يمكن أن تكون null
        ),
      ),
    );
  }
}
