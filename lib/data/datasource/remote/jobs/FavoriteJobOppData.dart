import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/class/CRUD.dart';

class FavoriteJobOppData {
  CRUD crud;
  FavoriteJobOppData(this.crud);

  postAddFavorite(int userid, int oppid) async {
    var response = await crud.postData(
      LinkApp.addFavoriteJobOpp,
      {"usersid": userid.toString(), "oppid": oppid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  postRemoveFavorite(int userid, int oppid) async {
    var response = await crud.postData(
      LinkApp.removeFavoriteJobOpp,
      {"usersid": userid.toString(), "oppid": oppid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }
}
