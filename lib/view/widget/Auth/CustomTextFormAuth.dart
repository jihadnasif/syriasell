import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.myController,
    this.texthint,
    this.keyboardtype,
    this.readOnlyBool,
    this.valid,
    this.obscureTextStat,
    this.textDirection,
    this.hinttextDirection,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.textlabel,
    this.onTap,
  });
  final TextEditingController? myController;
  final String? texthint;
  final TextInputType? keyboardtype;
  final bool? readOnlyBool;
  final String? Function(String?)? valid;
  final bool? obscureTextStat;
  final TextDirection? textDirection;
  final TextDirection? hinttextDirection;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final String? textlabel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.04,
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
      ),
      child: TextFormField(
        controller: myController,
        keyboardType: keyboardtype,
        readOnly: readOnlyBool == null ? false : true!,
        validator: valid,
        obscureText:
            obscureTextStat == null || obscureTextStat == false ? false : true,
        textDirection: textDirection,
        decoration: InputDecoration(
          /*prefixIcon: InkWell(
            onTap: ontapIcon,
            //child: prefixIcon,
          ),*/
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              "${textlabel}",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Kcolor().KlightGrey,
                  ),
            ),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          suffixIconColor: suffixIconColor,
          suffixIcon: suffixIcon,
          hintText: texthint,
          hintTextDirection: hinttextDirection,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Kcolor().kPrimaryColor,
              width: 3.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Kcolor().kPrimaryColor,
              width: 4.0,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
