import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth({
    Key? key,
    this.texthint,
    this.textlabel,
    this.iconData,
    this.myController,
    this.valid,
    this.keyboardtype = TextInputType.text,
    this.obscureTextStat,
    this.ontapIcon,
    this.isbottom = true,
  }) : super(key: key);
  final String? texthint;
  final String? textlabel;
  final IconData? iconData;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final TextInputType keyboardtype;
  final bool? obscureTextStat;
  final void Function()? ontapIcon;
  final bool? isbottom;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isbottom == true
          ? EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.04,
            )
          : EdgeInsets.only(bottom: 0),
      child: TextFormField(
        controller: myController,
        validator: valid,
        keyboardType: keyboardtype,
        obscureText:
            obscureTextStat == null || obscureTextStat == false ? false : true,
        decoration: InputDecoration(
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              "${textlabel}",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Kcolor().KlightGrey,
                  ),
            ),
          ),
          prefixIcon: InkWell(
            onTap: ontapIcon,
            child: Icon(
              iconData,
              size: 30,
              color: Kcolor().kblack,
            ),
          ),
          hintText: texthint,
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
          disabledBorder: OutlineInputBorder(
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
