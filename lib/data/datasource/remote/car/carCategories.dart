import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class CarCategoriesData {
  CRUD crud;
  CarCategoriesData(this.crud);
  getCarColors() async {
    var response = await crud.postData(LinkApp.viewCarColors, {});
    return response.fold((l) => l, (r) => r);
  }

  getCarCylinders() async {
    var response = await crud.postData(LinkApp.viewCarCylinders, {});
    return response.fold((l) => l, (r) => r);
  }

  getCarEngineCapacity() async {
    var response = await crud.postData(LinkApp.viewCarEngineCapacity, {});
    return response.fold((l) => l, (r) => r);
  }

  getCarFuel() async {
    var response = await crud.postData(LinkApp.viewCarFuel, {});
    return response.fold((l) => l, (r) => r);
  }

  getCarMakers() async {
    var response = await crud.postData(LinkApp.viewCarMakers, {});
    return response.fold((l) => l, (r) => r);
  }

  getCarTransmission() async {
    var response = await crud.postData(LinkApp.viewCarTransmission, {});
    return response.fold((l) => l, (r) => r);
  }

  getCarYears() async {
    var response = await crud.postData(LinkApp.viewCarYears, {});
    return response.fold((l) => l, (r) => r);
  }
}
