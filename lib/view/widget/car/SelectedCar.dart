import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/shared/CustomDropDownList.dart';

import '../../../controller/car/SelectedCarController.dart';
import '../../../core/functions/validInput.dart';
import '../Ads/Formfilde.dart';

class SelectedCar extends GetView<SelectedCarController> {
  const SelectedCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        CustomDropDownList(
          title: "139".tr,
          listData: controller.listCarMakers,
          dropName: controller.carMakers!,
          dropId: controller.carMakersId!,
        ),
        SizedBox(height: 20),
        CustomDropDownList(
          title: "140".tr,
          listData: controller.listCarTransmission,
          dropName: controller.carTransmission!,
          dropId: controller.carTransmissionId!,
        ),
        SizedBox(height: 20),
        CustomDropDownList(
          title: "141".tr,
          listData: controller.listCarColors,
          dropName: controller.carColors!,
          dropId: controller.carColorsId!,
        ),
        SizedBox(height: 20),
        CustomDropDownList(
          title: "142".tr,
          listData: controller.listCarCylinders,
          dropName: controller.carCylinders!,
          dropId: controller.carCylindersId!,
        ),
        SizedBox(height: 20),
        CustomDropDownList(
          title: "143".tr,
          listData: controller.listCarFuel,
          dropName: controller.carFuel!,
          dropId: controller.carFuelId!,
        ),
        SizedBox(height: 20),
        CustomDropDownList(
          title: "144".tr,
          listData: controller.listCarEngineCapacity,
          dropName: controller.carEngineCapacity!,
          dropId: controller.carEngineCapacityId!,
        ),
        SizedBox(height: 20),
        CustomDropDownList(
          title: "145".tr,
          listData: controller.listCarYears,
          dropName: controller.carYears!,
          dropId: controller.carYearsId!,
        ),
        SizedBox(height: 20),
        CustomFormField(
          myController: controller.contKM,
          texthint: "146".tr,
          valid: (val) => validInput(val!, 0, 30, ""),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
