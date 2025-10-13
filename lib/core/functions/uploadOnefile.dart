import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../constant/AppColor.dart';

// funcation for upload image from camera

imageOneUploadCamera() async {
  final XFile? file = await ImagePicker()
      . /*getImage*/ pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

// funation for upload file : image,pdf...
fileOneUploadGallary([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    // type file is i want upload
    //FileType.audio...
    // custom  اختياري مخصص
    type: FileType.custom,
    allowedExtensions:
        isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "JPG", "jpeg"],
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showOnebottommenu(imageOneUploadCamera(), fileOneUploadGallary()) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Kcolor().KGold,
        padding: EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("where would you from image"),
            ),
            ListTile(
              onTap: () {
                imageOneUploadCamera();
                Get.back();
              },
              title: Text("from Camera"),
              leading: Icon(Icons.camera),
            ),
            ListTile(
              onTap: () {
                fileOneUploadGallary();
                Get.back();
              },
              title: Text("from gallary"),
              leading: Icon(Icons.browse_gallery_sharp),
            ),
          ],
        ),
      ),
    ),
  );
}

getOneimageFromGalary() async {
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
