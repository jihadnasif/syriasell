import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/LinkApp.dart';

import '../../../controller/Home/ControllerHomeUser.dart';
import '../../../core/functions/imageNetwork.dart';
import '../../../data/model/allViewItemsModel.dart';
import 'HeaderHome.dart';

class ListDataModelSearch extends GetView<ControllerHomeUserImp> {
  final List<ViewItemsAllModel> listDataModelsearch;
  const ListDataModelSearch({
    super.key,
    required this.listDataModelsearch,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        HeaderHome(
          iconTrailing: Icon(Icons.arrow_forward),
          functionTrailing: () {
            controller.isSearch = false;
            controller.update();
          },
        ),
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          itemCount: listDataModelsearch.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.goToItemDetails(
                    listDataModelsearch[index].itemId.toString());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: Get.height * 0.15,
                    child: Row(
                      children: [
                        Expanded(
                          child: cachedNetworkImage(
                            imageUrl:
                                "${LinkApp.uploadItems}/${listDataModelsearch[index].imageOne}",
                            errorWidget: Icon(Icons.broken_image, size: 40),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                                "${listDataModelsearch[index].itemNameAr}"),
                            subtitle: Text(
                                "${listDataModelsearch[index].itemCategName}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
