import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'StatusRequest.dart';

String _basicAuth =
    "Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}";

Map<String, String> _myheaders = {
  'Authorization': _basicAuth,
};

class CRUD {
  // إرسال بيانات بدون صور
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print("Raw response body: ${response.body}");
      print("Raw response status: ${response.statusCode}");
      if (response.statusCode == 200) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfException);
    }
  }

  // رفع صورة واحدة إلزامية
  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      String url, Map data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) namerequest = "files";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

  // رفع صورة إلزامية + 3 صور اختيارية

  Future<Either<StatusRequest, Map>> addRequestWithImages(
    String url,
    Map data,
    File imageOne, {
    File? imageTwo,
    File? imageThree,
    File? imageFour,
  }) async {
    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);

      // إضافة رؤوس الطلب إن وُجدت
      request.headers.addAll(_myheaders);

      // --- الصورة الأساسية (file1) ---
      var stream1 = http.ByteStream(imageOne.openRead().cast());
      var length1 = await imageOne.length();
      request.files.add(
        http.MultipartFile("file1", stream1, length1,
            filename: basename(imageOne.path)),
      );

      // --- الصور الاختيارية ---
      if (imageTwo != null) {
        var stream2 = http.ByteStream(imageTwo.openRead().cast());
        var length2 = await imageTwo.length();
        request.files.add(
          http.MultipartFile("file2", stream2, length2,
              filename: basename(imageTwo.path)),
        );
      }

      if (imageThree != null) {
        var stream3 = http.ByteStream(imageThree.openRead().cast());
        var length3 = await imageThree.length();
        request.files.add(
          http.MultipartFile("file3", stream3, length3,
              filename: basename(imageThree.path)),
        );
      }

      if (imageFour != null) {
        var stream4 = http.ByteStream(imageFour.openRead().cast());
        var length4 = await imageFour.length();
        request.files.add(
          http.MultipartFile("file4", stream4, length4,
              filename: basename(imageFour.path)),
        );
      }

      // --- إضافة باقي البيانات النصية ---
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // --- إرسال الطلب ---
      var responseStream = await request.send();
      var response = await http.Response.fromStream(responseStream);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("Error in addRequestWithImages: $e");
      return const Left(StatusRequest.serverfException);
    }
  }

  // النسخة الخاصة بالويب
  Future<Either<StatusRequest, Map>> addRequestWithImageOneWeb(
      String url, Map data, Uint8List? fileBytes, String? fileName,
      [String? namerequest]) async {
    if (namerequest == null) namerequest = "files";

    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(_myheaders);

      // إضافة الملف إذا موجود
      if (fileBytes != null && fileName != null) {
        var multipartFile = http.MultipartFile.fromBytes(
          namerequest,
          fileBytes,
          filename: fileName,
        );
        request.files.add(multipartFile);
      }

      // إضافة الحقول النصية
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // إرسال الطلب
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithWebImages(
    String url,
    Map data,
    Uint8List imageOne, {
    Uint8List? imageTwo,
    Uint8List? imageThree,
    Uint8List? imageFour,
  }) async {
    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);

      // إضافة الرؤوس
      request.headers.addAll(_myheaders);

      // --- الصورة الأساسية (file1) ---
      request.files.add(
        http.MultipartFile.fromBytes("file1", imageOne, filename: "file1.png"),
      );

      // --- الصور الاختيارية ---
      if (imageTwo != null) {
        request.files.add(
          http.MultipartFile.fromBytes("file2", imageTwo,
              filename: "file2.png"),
        );
      }

      if (imageThree != null) {
        request.files.add(
          http.MultipartFile.fromBytes("file3", imageThree,
              filename: "file3.png"),
        );
      }

      if (imageFour != null) {
        request.files.add(
          http.MultipartFile.fromBytes("file4", imageFour,
              filename: "file4.png"),
        );
      }

      // --- إضافة باقي البيانات النصية ---
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // --- إرسال الطلب ---
      var responseStream = await request.send();
      var response = await http.Response.fromStream(responseStream);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("Error in addRequestWithWebImages: $e");
      return const Left(StatusRequest.serverfException);
    }
  }
}
