import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';

class TextFormHome extends StatelessWidget {
  const TextFormHome({
    super.key,
    this.texthint,
    this.iconData,
    this.myController,
    this.onChanged,
    this.valid,
    this.keyboardtype = TextInputType.text,
    this.obscureTextStat,
    this.ontapIcon,
  });
  final String? texthint;
  final IconData? iconData;
  final TextEditingController? myController;
  final void Function(String)? onChanged;
  final String? Function(String?)? valid;
  final TextInputType keyboardtype;
  final bool? obscureTextStat;
  final void Function()? ontapIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.04,
      ),
      child: TextFormField(
        controller: myController,
        onChanged: onChanged,
        validator: valid,
        keyboardType: keyboardtype,
        obscureText:
            obscureTextStat == null || obscureTextStat == false ? false : true,
        decoration: InputDecoration(
          filled: true, // 👈 ضروري لتفعيل اللون
          fillColor: Colors.grey[200],

          prefixIcon: InkWell(
            onTap: ontapIcon,
            child: Icon(
              iconData,
              size: 30,
              color: Kcolor().kblack,
            ),
          ),
          hintText: texthint,
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
      ),
    );
  }
}
