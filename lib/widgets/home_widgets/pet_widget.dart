import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';

class PetWidget extends StatelessWidget {
  String petName, petImage, petDistance;
  PetWidget({
    super.key,
    required this.petName,
    required this.petImage,
    required this.petDistance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFFF9E3DE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                petImage,
                fit: BoxFit.fitHeight,
              ),
            ),
            ListTile(
              title: Text(
                petName,
                style: const TextStyle(
                  fontFamily: 'poppins_semi_bold',
                ),
              ),
              subtitle: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: ColorConstants.red,
                  ),
                  Expanded(
                    child: Text(
                      "Distance ($petDistance)",
                      style: const TextStyle(
                        fontFamily: 'poppins_regular',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: const Icon(
                EvaIcons.heart,
                color: ColorConstants.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
