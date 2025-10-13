import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class CurrencyData {
  CRUD crud;
  CurrencyData(this.crud);
  getDataCurrency() async {
    var response = await crud.postData(LinkApp.viewCurrency, {});
    return response.fold((l) => l, (r) => r);
  }
}
