import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/Home/ControllerHomeUser.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/variable.dart';
import '../../../data/model/allViewItemsModel.dart';

class SearchAutocompleteWidget extends StatelessWidget {
  final ControllerHomeUserImp controller;

  const SearchAutocompleteWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHomeUserImp>(
      builder: (_) {
        return RawAutocomplete<ViewItemsAllModel>(
          textEditingController: controller.searchController,
          focusNode: controller.searchFocus,
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              controller.suggestions.clear();
              return const Iterable<ViewItemsAllModel>.empty();
            }
            print(
                "✅ optionsBuilder called, suggestions count: ${controller.suggestions.length}");
            return controller.suggestions;
          },
          onSelected: (ViewItemsAllModel selection) {
            controller.searchController!.text = selection.itemNameAr ?? "";
            controller.onSearchItems();
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return Container(
              width: getValueForScreenType<double>(
                context: context,
                mobile: sizedWidth(context) * 1,
                tablet: sizedWidth(context) * 0.4,
                desktop: sizedWidth(context) * 0.3,
              ),
              child: TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                decoration: InputDecoration(
                  filled: true, // 👈 ضروري لتفعيل اللون
                  fillColor: Colors.grey[200],
                  hintText: "42".tr,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Kcolor().kblack,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Kcolor().kPrimaryColor,
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Kcolor().kPrimaryColor,
                      width: 4.0,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Kcolor().kPrimaryColor,
                      width: 3.0,
                    ),
                  ),
                ),
                onChanged: (val) {
                  print("⌨️ user typing: $val");
                  controller.getSuggestions(val);
                },
                onFieldSubmitted: (val) => controller.onSearchItems(),
              ),
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4,
                child: SizedBox(
                  height: 200,
                  child: options.isEmpty
                      ? Center(child: Text("No suggestions"))
                      : ListView.builder(
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return ListTile(
                              title: Text(option.itemNameAr ?? ""),
                              onTap: () => onSelected(option),
                            );
                          },
                        ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
