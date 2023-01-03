import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';

class PetDescriptionWidget extends StatefulWidget {
  String petDescription;
  PetDescriptionWidget({
    super.key,
    required this.petDescription,
  });

  @override
  State<PetDescriptionWidget> createState() => _PetDescriptionWidgetState();
}

class _PetDescriptionWidgetState extends State<PetDescriptionWidget> {
  String firstHalf = "";
  String secondHalf = "";
  bool seeMore = false;

  @override
  void initState() {
    super.initState();
    if (widget.petDescription.length > 100) {
      firstHalf = widget.petDescription.substring(0, 100);
      secondHalf =
          widget.petDescription.substring(100, widget.petDescription.length);
    } else {
      firstHalf = widget.petDescription;
    }
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf != ""
        ? GestureDetector(
            onTap: () {
              setState(() {
                seeMore = !seeMore;
              });
            },
            child: seeMore == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.petDescription,
                        style: FontConstants.commonText.titleSmall,
                      ),
                      const Text(
                        "See Less..",
                        style: TextStyle(
                          color: ColorConstants.red,
                        ),
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstHalf,
                        style: FontConstants.commonText.titleSmall,
                      ),
                      const Text(
                        "See More..",
                        style: TextStyle(
                          color: ColorConstants.red,
                        ),
                      )
                    ],
                  ),
          )
        : Text(
            widget.petDescription,
            style: FontConstants.commonText.titleSmall,
          );
  }
}
