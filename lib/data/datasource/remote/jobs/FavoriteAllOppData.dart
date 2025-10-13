import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class ViewFavoriteJobOppData {
  CRUD crud;
  ViewFavoriteJobOppData(this.crud);

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

  getViewFavorite(int userid) async {
    var response = await crud.postData(
      LinkApp.viewFavoriteJobOpp,
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
