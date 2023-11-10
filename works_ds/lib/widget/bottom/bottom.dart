import 'package:flutter/material.dart';
import 'package:works_ds/constants/constants.dart';

class ECBottom extends StatelessWidget {
  final String? text;
  final Color? color;
  final VoidCallback? onTap;
  final double? width;
  final double? textSize;

  const ECBottom({super.key, this.text, this.color, this.onTap, this.width, this.textSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width ?? MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          color: colorBottom(),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            text ?? '',
            style: TextStyle(
              color: CustomColor.colorNeutralLightBase,
              fontSize: textSize ?? 16,
            ),
          ),
        ),
      ),
    );
  }

  Color colorBottom() {
    if (color != null && onTap != null) {
      return color!;
    }
    if (onTap != null && color == null) {
      return CustomColor.colorFeedbackInformationDark;
    }
    return CustomColor.colorNeutralDark04;
  }
}
