import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

// funcation for upload image.dart from camera

// التقاط صورة بالكاميرا
Future<File?> imageUploadCamera() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );
  if (file != null) {
    return File(file.path);
  }
  return null;
}

// اختيار صورة من الجاليري
Future<File?> fileUploadGallery() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    imageQuality: 90,
  );
  if (file != null) {
    return File(file.path);
  }
  return null;
}

// عرض قائمة اختيار المصدر مع تمرير index
void showBottomMenu(
    Function(int) cameraFunc, Function(int) galleryFunc, int index) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("134".tr),
            ListTile(
              onTap: () async {
                await cameraFunc(index);
                Get.back();
              },
              title: Text("135".tr),
              leading: Icon(Icons.camera),
            ),
            ListTile(
              onTap: () async {
                await galleryFunc(index);
                Get.back();
              },
              title: Text("136".tr),
              leading: Icon(Icons.browse_gallery_sharp),
            ),
          ],
        ),
      ),
    ),
  );
}

getimageFromGalary() async {
  XFile? ImgGallayPick =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (ImgGallayPick != null) {
    File fileimg = File(ImgGallayPick.path);
    int rand = Random().nextInt(100000);
    String imgname = basename(ImgGallayPick.path);

    String imgnameRan = "$rand" + basename(ImgGallayPick.path);

    /*  ImgRef = FirebaseStorage.instance
                                      .ref("images")
                                      .child("$imgname");*/

    //await ref.putFile(fileimg);
    //pathImg = await ref.getDownloadURL();
    return imgname;
  }
}
