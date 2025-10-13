import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class ViewFavoriteData {
  CRUD crud;
  ViewFavoriteData(this.crud);

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

  getViewFavorite(int userid) async {
    var response = await crud.postData(
      LinkApp.viewFavorite,
      {"userid": userid.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(int favoriteId) async {
    var response = await crud.postData(
      LinkApp.deleteFavorite,
      {"favoriteId": favoriteId.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }
}
