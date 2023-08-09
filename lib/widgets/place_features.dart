import 'package:flutter/material.dart';
import 'package:travel_app/constants/color_constants.dart';

class PlaceFeatures extends StatelessWidget {
  final String features;
  const PlaceFeatures({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(244, 245, 250, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                features,
                style: const TextStyle(
                  color: ColorConstants.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
