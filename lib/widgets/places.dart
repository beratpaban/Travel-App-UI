import 'package:flutter/material.dart';
import 'package:travel_app/constants/color_constants.dart';
import 'package:travel_app/widgets/people.dart';

class Places extends StatefulWidget {
  final String placeName;
  final String placeImages;
  const Places({super.key, required this.placeName, required this.placeImages});

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  bool isFav = false;
  void toggleFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 150,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 75.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(widget.placeImages),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 15,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          isFav ? Colors.white : Colors.white.withOpacity(0.5),
                    ),
                    child: GestureDetector(
                      onTap: toggleFav,
                      child: Icon(
                        Icons.favorite,
                        size: 20,
                        color: isFav
                            ? ColorConstants.secondaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 145,
                  left: 10,
                  child: Container(
                    height: 20,
                    width: 30,
                    decoration: BoxDecoration(
                      color: ColorConstants.secondaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'HOT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 170,
                  child: Text(
                    widget.placeName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  left: 15,
                  top: 200,
                  child: People(),
                ),
                const Positioned(
                  left: 95,
                  top: 205,
                  child: Text(
                    '2.5km',
                    style: TextStyle(
                        color: ColorConstants.mutedColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
