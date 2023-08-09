import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/constants/color_constants.dart';
import 'package:travel_app/home_page.dart';
import 'package:travel_app/widgets/custom_navigationbar.dart';

import 'widgets/place_features.dart';

class PlaceDetailsPage extends StatefulWidget {
  final String placeName;
  final String placeImage;
  const PlaceDetailsPage(
      {super.key, required this.placeName, required this.placeImage});

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  double rating = 3;
  final List<String> features = [
    '2 Bedrooms',
    'Tv Lounge',
    'Breakfast',
    'Wifi',
    'Shopping',
  ];
  //for desc lorem text
  final loremText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight / 3,
                child: Image.asset(
                  widget.placeImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    iconSize: 15,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: ColorConstants.secondaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RatingBar(
                              onRatingUpdate: (rating) => setState(() {
                                this.rating = rating;
                              }),
                              initialRating: 3,
                              minRating: 1,
                              maxRating: 5,
                              direction: Axis.horizontal,
                              glow: false,
                              itemCount: 5,
                              itemSize: 20,
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star_rate_rounded,
                                  color: ColorConstants.secondaryColor,
                                ),
                                half: const Icon(
                                  Icons.star_border_outlined,
                                  color: ColorConstants.secondaryColor,
                                ),
                                empty: const Icon(
                                  Icons.star_border_rounded,
                                  color: ColorConstants.secondaryColor,
                                ),
                              ),
                            ),
                            Text(
                              '$rating',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            widget.placeName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ColorConstants.mutedColor,
                              ),
                              //Random Location
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Jakarta,Indonesia',
                                  style: TextStyle(
                                    color: ColorConstants.mutedColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: features.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return PlaceFeatures(
                                features: features[index],
                              );
                            },
                          ),
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            loremText,
                            style: const TextStyle(
                              color: ColorConstants.mutedColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                right: 10,
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: ColorConstants.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '1200',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' / night'),
                      ],
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
