import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final String? title;
  final String? text;
  final void Function()? onclice;
  const CardDetails({
    super.key,
    this.title,
    this.text,
    this.onclice,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclice,
      child: Card(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "$text",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
