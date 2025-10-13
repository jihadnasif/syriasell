import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// فانكشن لإرجاع Widget لصورة من الإنترنت مع التخزين المؤقت (Cache)
Widget cachedNetworkImage({
  required String imageUrl,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  Widget? placeholder,
  Widget? errorWidget,
}) {
  // ✅ تحقق من الرابط
  if (imageUrl.isEmpty ||
      imageUrl.toLowerCase() == "null" ||
      imageUrl.toLowerCase() == "empty") {
    // صورة افتراضية (من الأصول أو من السيرفر)
    return Image.asset(
      "assets/images/mistake.png", // ضع مسار صورة افتراضية عندك
      width: width,
      height: height,
      fit: fit,
    );
  }
  // تحويل الرابط لتجنب المشاكل مع المسافات أو الأحرف الخاصة
  final safeUrl = Uri.encodeFull(imageUrl);

  return CachedNetworkImage(
    imageUrl: safeUrl,
    width: width,
    height: height,
    fit: fit,
    placeholder: (context, url) =>
        placeholder ??
        Container(
          color: Colors.grey[300],
          child: Center(child: CircularProgressIndicator()),
        ),
    errorWidget: (context, url, error) =>
        errorWidget ??
        Container(
          color: Colors.grey[300],
          child: Center(child: Icon(Icons.error, color: Colors.red)),
        ),
  );
}
