import 'package:flutter/material.dart';

class TitleH2JobIcon extends StatelessWidget {
  const TitleH2JobIcon({
    super.key,
    required this.emoji,
    required this.textTitleH2,
    this.sizeFont,
  });
  final String emoji;
  final String textTitleH2;
  final double? sizeFont;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          emoji,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          textTitleH2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: sizeFont ?? 16,
          ),
        ),
      ],
    );
  }
}
