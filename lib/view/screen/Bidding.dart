import 'package:flutter/material.dart';

import '../../core/constant/AppColor.dart';
import '../../core/functions/goNewAds.dart';
import '../widget/Home/BottomTap.dart';

class Bidding extends StatelessWidget {
  const Bidding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToNewAds();
        },
        shape: CircleBorder(),
        backgroundColor: Kcolor().kwhite,
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomTap(
        coloIcone2: Kcolor().KlightBlueAccent,
      ),
      body: Center(
        child: Text("bidding"),
      ),
    );
  }
}
