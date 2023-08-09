import 'package:flutter/material.dart';
import 'package:travel_app/constants/color_constants.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: ColorConstants.mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: screenHeight / 10,
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.home,
            color: Colors.white,
          ),
          const Icon(
            Icons.calendar_month,
            color: ColorConstants.mutedColor,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(
                Icons.search_rounded,
                color: ColorConstants.mainColor,
              ),
            ),
          ),
          const Icon(
            Icons.favorite,
            color: ColorConstants.mutedColor,
          ),
          const Icon(
            Icons.settings,
            color: ColorConstants.mutedColor,
          ),
        ],
      ),
    );
  }
}
