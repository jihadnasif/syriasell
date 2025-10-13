import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class FavoriteAllJobAppData {
  CRUD crud;
  FavoriteAllJobAppData(this.crud);

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

  getViewFavorite(int userid) async {
    var response = await crud.postData(
      LinkApp.viewFavoriteJobApp,
      {"userid": userid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(int favoriteId) async {
    var response = await crud.postData(
      LinkApp.deleteFavoriteJobOpp,
      {"favoriteId": favoriteId.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }
}
