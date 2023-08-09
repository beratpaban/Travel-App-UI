import 'package:flutter/material.dart';
import 'package:travel_app/constants/color_constants.dart';

class Categories extends StatelessWidget {
  final IconData icons;
  final String names;
  const Categories({super.key, required this.icons, required this.names});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.secondaryColor,
              boxShadow: [
                BoxShadow(color: ColorConstants.mutedColor, spreadRadius: 1),
              ],
            ),
            child: Icon(
              icons,
              color: Colors.white,
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              names,
              style: const TextStyle(
                color: ColorConstants.mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
