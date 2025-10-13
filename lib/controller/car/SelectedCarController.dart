import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/functions/translateDataBase.dart';
import 'package:syria_sell/data/model/Car/cylindersModel.dart';
import 'package:syria_sell/data/model/Car/engineCapacityModel.dart';
import 'package:syria_sell/data/model/Car/fuelModel.dart';
import 'package:syria_sell/data/model/Car/makersModel.dart';
import 'package:syria_sell/data/model/Car/transmissionModel.dart';
import 'package:syria_sell/data/model/Car/yearsModel.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/functions/hindlingData.dart';
import '../../data/datasource/remote/car/carCategories.dart';
import '../../data/model/Car/colorsModel.dart';

class SelectedCarController extends GetxController {
  TextEditingController? carCylinders;
  TextEditingController? carEngineCapacity;
  TextEditingController? carFuel;
  TextEditingController? carMakers;
  TextEditingController? carTransmission;
  TextEditingController? carColors;
  TextEditingController? carYears;
  TextEditingController? carCylindersId;
  TextEditingController? carEngineCapacityId;
  TextEditingController? carFuelId;
  TextEditingController? carMakersId;
  TextEditingController? carTransmissionId;
  TextEditingController? carColorsId;
  TextEditingController? carYearsId;
  TextEditingController? contKM;

  List<SelectedListItem> listCarCylinders = [];
  List<SelectedListItem> listCarEngineCapacity = [];
  List<SelectedListItem> listCarFuel = [];
  List<SelectedListItem> listCarMakers = [];
  List<SelectedListItem> listCarTransmission = [];
  List<SelectedListItem> listCarColors = [];
  List<SelectedListItem> listCarYears = [];
  StatusRequest statusRequest = StatusRequest.none;

  getCarCylinders() async {
    CarCategoriesData carCategoriesData = CarCategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await carCategoriesData.getCarCylinders();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<CylindersModel> listCarCateg = [];
        List listRespo = response["data"];
        listCarCateg.addAll(listRespo.map((e) => CylindersModel.fromJson(e)));

        for (int i = 0; i < listCarCateg.length; i++) {
          listCarCylinders.add(
            SelectedListItem(
              name: translateDataBase(
                  listCarCateg[i].nameEn!, listCarCateg[i].nameAr!),
              value: listCarCateg[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCarEngineCapacity() async {
    CarCategoriesData carCategoriesData = CarCategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await carCategoriesData.getCarEngineCapacity();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<EngineCapacityModel> listCarCateg = [];
        List listRespo = response["data"];
        listCarCateg
            .addAll(listRespo.map((e) => EngineCapacityModel.fromJson(e)));

        for (int i = 0; i < listCarCateg.length; i++) {
          listCarEngineCapacity.add(
            SelectedListItem(
              name: listCarCateg[i].capacity!,
              value: listCarCateg[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCarFuel() async {
    CarCategoriesData carCategoriesData = CarCategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await carCategoriesData.getCarFuel();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<FuelModel> listCarCateg = [];
        List listRespo = response["data"];
        listCarCateg.addAll(listRespo.map((e) => FuelModel.fromJson(e)));

        for (int i = 0; i < listCarCateg.length; i++) {
          listCarFuel.add(
            SelectedListItem(
              name: translateDataBase(
                  listCarCateg[i].nameEn!, listCarCateg[i].nameAr!),
              value: listCarCateg[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCarMakers() async {
    CarCategoriesData carCategoriesData = CarCategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await carCategoriesData.getCarMakers();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<MakersModel> listCarCateg = [];
        List listRespo = response["data"];
        listCarCateg.addAll(listRespo.map((e) => MakersModel.fromJson(e)));

        for (int i = 0; i < listCarCateg.length; i++) {
          listCarMakers.add(
            SelectedListItem(
              name: translateDataBase(
                  listCarCateg[i].nameEn!, listCarCateg[i].nameAr!),
              value: listCarCateg[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCarTransmission() async {
    CarCategoriesData carCategoriesData = CarCategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await carCategoriesData.getCarTransmission();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<TransmissionModel> listCarCateg = [];
        List listRespo = response["data"];
        listCarCateg
            .addAll(listRespo.map((e) => TransmissionModel.fromJson(e)));

        for (int i = 0; i < listCarCateg.length; i++) {
          listCarTransmission.add(
            SelectedListItem(
              name: translateDataBase(
                  listCarCateg[i].nameEn!, listCarCateg[i].nameAr!),
              value: listCarCateg[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCarColors() async {
    CarCategoriesData carCategoriesData = CarCategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await carCategoriesData.getCarColors();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<ColorsModel> listCarCateg = [];
        List listRespo = response["data"];
        listCarCateg.addAll(listRespo.map((e) => ColorsModel.fromJson(e)));

        for (int i = 0; i < listCarCateg.length; i++) {
          listCarColors.add(
            SelectedListItem(
              name: translateDataBase(
                  listCarCateg[i].nameEn!, listCarCateg[i].nameAr!),
              value: listCarCateg[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCarYears() async {
    CarCategoriesData carCategoriesData = CarCategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await carCategoriesData.getCarYears();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<YearsModel> listCarCateg = [];
        List listRespo = response["data"];
        listCarCateg.addAll(listRespo.map((e) => YearsModel.fromJson(e)));

        for (int i = 0; i < listCarCateg.length; i++) {
          listCarYears.add(
            SelectedListItem(
              name: listCarCateg[i].year!,
              value: listCarCateg[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCarCylinders();
    getCarEngineCapacity();
    getCarFuel();
    getCarMakers();
    getCarTransmission();
    getCarColors();
    getCarYears();

    carCylinders = TextEditingController();
    carEngineCapacity = TextEditingController();
    carFuel = TextEditingController();
    carMakers = TextEditingController();
    carTransmission = TextEditingController();
    carColors = TextEditingController();
    carYears = TextEditingController();
    carCylindersId = TextEditingController();
    carEngineCapacityId = TextEditingController();
    carFuelId = TextEditingController();
    carMakersId = TextEditingController();
    carTransmissionId = TextEditingController();
    carColorsId = TextEditingController();
    carYearsId = TextEditingController();
    contKM = TextEditingController();
  }

  @override
  void dispose() {
    /*
    carCylinders.dispose();
    carEngineCapacity.dispose();
    carFuel.dispose();
    carMakers.dispose();
    carTransmission.dispose();
    carColors.dispose();
    carYears.dispose();
    carCylindersId.dispose();
    carEngineCapacityId.dispose();
    carFuelId.dispose();
    carMakersId.dispose();
    carTransmissionId.dispose();
    carColorsId.dispose();
    carYearsId.dispose();
    */
    super.dispose();
  }
}
