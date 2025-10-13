import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/class/CRUD.dart';

class FavoriteData {
  CRUD crud;
  FavoriteData(this.crud);

  postAddFavorite(int userid, int itemid) async {
    var response = await crud.postData(
      LinkApp.addFavorite,
      {"usersid": userid.toString(), "itemsid": itemid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  postRemoveFavorite(int userid, int itemid) async {
    var response = await crud.postData(
      LinkApp.removeFavorite,
      {"usersid": userid.toString(), "itemsid": itemid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }
}
