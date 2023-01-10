import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';

class CommonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar;
  final String appbarName;

  const CommonAppBarWidget({
    super.key,
    required this.appBar,
    required this.appbarName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: ColorConstants.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        appbarName,
        style: const TextStyle(
          color: ColorConstants.black,
          fontFamily: 'poppins_bold',
          fontSize: 14,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
