import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';

class FullWidthButtonWidget extends StatelessWidget {
  String buttonName;
  FullWidthButtonWidget({
    super.key,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorConstants.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        buttonName,
        textAlign: TextAlign.center,
        style: FontConstants.authTexts.labelSmall,
      ),
    );
  }
}
