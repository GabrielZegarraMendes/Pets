import 'package:flutter/material.dart';
import 'package:works_ds/constants/custom_color_const.dart';

class ECTextFormField extends StatelessWidget {
  final Widget? icon;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController controller;
  final Function(String)? onChanged;

  const ECTextFormField(
      {super.key, this.icon, this.hintText, this.obscureText, this.onChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: CustomColor.colorFeedbackInformationDark,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          autofocus: false,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: icon,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
