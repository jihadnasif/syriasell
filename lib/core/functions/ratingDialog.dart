/*
import 'package:debtbook/core/constant/AppColor.dart';
import 'package:debtbook/core/constant/AppimageAsset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../../controller/Orders/ControllerArchive.dart';

// show the dialog
showRatingDialog(BuildContext context, orderid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Order',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Kcolor().KlightBlueAccent,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image.dart: Image.asset(
        ImageAsset.KlogoImage,
        width: 100,
        height: 150,
      ),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(
        color: Kcolor().KlightBlueAccent,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ControllerArchiveOrders controllerArOrd = Get.find();
        //print('rating: ${response.rating}, comment: ${response.comment}');
        controllerArOrd.submitRatingOrders(orderid, response.rating.toInt(), response.comment);
      },
    ),
  );
}
*/
