import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';

class AuthShowPasswordWidget extends StatefulWidget {
  Function(dynamic) showpassword;
  AuthShowPasswordWidget({
    super.key,
    required this.showpassword,
  });

  @override
  State<AuthShowPasswordWidget> createState() => _AuthShowPasswordWidgetState();
}

class _AuthShowPasswordWidgetState extends State<AuthShowPasswordWidget> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isShowPassword == true
          ? IconConstants.viewPassIcon
          : IconConstants.unViewPasswordIcon,
      onPressed: () => setState(() {
        isShowPassword = !isShowPassword;
        widget.showpassword(isShowPassword);
      }),
    );
  }
}
