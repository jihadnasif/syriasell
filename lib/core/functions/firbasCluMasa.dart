/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debtbookdebtbook/controller/Orders/ControllerPending.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
*/
/*firbasCluMass() {
  FirebaseMessaging.onMessage.listen((message) {
    String titleMas = message.notification!.title!;
    String bodyMas = message.notification!.body!;
    print("------------------");
    print(titleMas);
    print(bodyMas);
    //FlutterRingtonePlayer.playNotification();
    Get.snackbar(titleMas, bodyMas);
    refreshOrderNoti(message.data);
  });
}*/

/*refreshOrderNoti(data) {
  print("-//////////////////---");
  print(data["pageid"]);
  print(data["pagename"]);
  if (Get.currentRoute == "/pendingOrders" &&
      data["pagename"] == "refreshorder") {
    ControllerPendingOrders controller = Get.find();
    controller.refreshOrder();
  }
}*/
