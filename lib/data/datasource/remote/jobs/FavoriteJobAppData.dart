import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/class/CRUD.dart';

class FavoriteJobApplicationData {
  CRUD crud;
  FavoriteJobApplicationData(this.crud);

  postAddFavorite(int userid, int oppid) async {
    var response = await crud.postData(
      LinkApp.addFavoriteJobApp,
      {"usersid": userid.toString(), "appid": oppid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  postRemoveFavorite(int userid, int oppid) async {
    var response = await crud.postData(
      LinkApp.removeFavoriteJobApp,
      {"usersid": userid.toString(), "appid": oppid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }
}
