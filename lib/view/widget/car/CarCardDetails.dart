// ودجت خارج GridView لتجميع CardDetails
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ItemsDetails/CardDetails.dart';

List<Widget> carDetailsCards(viewItemsAllModel) {
  return [
    CardDetails(title: "139".tr, text: viewItemsAllModel.carMakerAr),
    CardDetails(title: "140".tr, text: viewItemsAllModel.transmissionAr),
    CardDetails(title: "141".tr, text: viewItemsAllModel.carColorAr),
    CardDetails(title: "142".tr, text: viewItemsAllModel.carCylinderAr),
    CardDetails(title: "143".tr, text: viewItemsAllModel.fuelTypeAr),
    CardDetails(title: "144".tr, text: viewItemsAllModel.engineCapacity),
    CardDetails(title: "145".tr, text: viewItemsAllModel.carYear),
    CardDetails(title: "146".tr, text: viewItemsAllModel.carKM),
  ];
}
