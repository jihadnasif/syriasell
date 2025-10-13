import 'dart:io';

checkInternet() async {
  try {
    List<InternetAddress> varNet = await InternetAddress.lookup("google.com");
    //varNet.isNotEmpty تكفي
    //varNet[0].rawAddress.isNotEmpty زيادة تأكيد
    if (varNet.isNotEmpty || varNet[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
