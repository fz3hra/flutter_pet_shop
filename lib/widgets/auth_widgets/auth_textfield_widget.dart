import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:gap/gap.dart';

class AuthTextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String labelText, hintText;
  bool obscureText;
  Icon icon;
  Widget? suffixIcon;
  AuthTextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorConstants.mediumGrey),
      ),
      child: Row(
        children: [
          icon,
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    suffixIcon: suffixIcon,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: labelText,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontFamily: 'poppins_bold',
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    labelStyle: const TextStyle(
                      fontFamily: 'poppins_regular',
                      color: ColorConstants.darkGrey,
                      fontSize: 14,
                    ),
                  ),
                  style: TextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
