import 'package:flutter/cupertino.dart';

final ScrollController scrollController = ScrollController();
void scrollToStart() {
  scrollController.animateTo(
    0,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

void scrollToEnd() {
  scrollController.animateTo(
    scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}
