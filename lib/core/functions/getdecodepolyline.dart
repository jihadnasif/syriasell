/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

// نقاط الانطلاق والوصول
Future getPolyLine(lat, long, destlat, destlong) async {
  //polylineco: It is an List that contains a set of Lat and Long group
  //    between the customer and the delivery agent
  Set<Polyline> polylineSet = {};
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  // note: key i get from google map platform
  // i put key in key=aa in url
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyDs1pDEhDNf5MjdfWwzH5pcYxTIbppHE-M";
  var response = await http.post(Uri.parse(url));
  var responsebody = jsonDecode(response.body);
  //أسماء المفاتيح مثل الروت والأ,فيرفيو.. من الموقع
  var point = responsebody['routes'][0]['overview_polyline']['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }
  Polyline polyline = Polyline(
    polylineId: PolylineId("idjihad"),
    color: Colors.red,
    width: 7,
    points: polylineco,
  );
  polylineSet.add(polyline);
  return polylineSet;
}
*/