import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/routes.dart';

class BottomTap extends StatelessWidget {
  const BottomTap({
    super.key,
    this.coloIcone1,
    this.coloIcone2,
    this.coloIcone3,
    this.coloIcone4,
  });

  final Color? coloIcone1;
  final Color? coloIcone2;
  final Color? coloIcone3;
  final Color? coloIcone4;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Kcolor().kHeader,
              Kcolor().kPrimaryColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.center,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                color: coloIcone1 ?? Kcolor().kwhite,
                onTap: () => Get.offAllNamed(AppRoute.rHomeUser),
                label: "41".tr,
              ),
              _buildNavItem(
                icon: Icons.gavel,
                color: coloIcone2 ?? Kcolor().kwhite,
                onTap: () => Get.offAllNamed(AppRoute.rBidding),
                label: "50".tr,
              ),

              // مكان النص تحت زر الإضافة
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30), // يترك مساحة للأيقونة العائمة
                    Text(
                      "54".tr,
                      style: TextStyle(
                        color: Kcolor().kwhite,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              _buildNavItem(
                icon: Icons.campaign,
                color: coloIcone3 ?? Kcolor().kwhite,
                onTap: () => Get.offAllNamed(AppRoute.rReviewAds),
                label: "55".tr,
              ),
              _buildNavItem(
                icon: Icons.more_horiz,
                color: coloIcone4 ?? Kcolor().kwhite,
                onTap: () => Get.offAllNamed(AppRoute.rMore),
                label: "52".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required String label,
  }) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
