import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';

class CustomFormMore extends StatelessWidget {
  const CustomFormMore({
    Key? key,
    this.isBeforLast = false,
    this.titleForm,
    this.texthint,
    this.iconData,
    this.myController,
    this.valid,
    this.keyboardtype = TextInputType.text,
    this.obscureTextStat,
    this.ontapIcon,
  }) : super(key: key);
  final bool isBeforLast;
  final String? titleForm;
  final String? texthint;
  final IconData? iconData;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final TextInputType keyboardtype;
  final bool? obscureTextStat;
  final void Function()? ontapIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: isBeforLast
            ? 5 // 👈 مسافة صغيرة لو آخر حقل
            : MediaQuery.of(context).size.height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${titleForm}:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: myController,
            validator: valid,
            keyboardType: keyboardtype,
            obscureText: obscureTextStat == null || obscureTextStat == false
                ? false
                : true,
            decoration: InputDecoration(
              filled: true, // لازم تكون true
              fillColor: Kcolor().filledForm,
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
                  color: Kcolor().filledForm,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Kcolor().filledForm,
                  width: 1.0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Kcolor().filledForm,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
