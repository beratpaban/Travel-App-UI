import 'package:flutter/material.dart';
import 'package:travel_app/constants/color_constants.dart';
import 'package:travel_app/place_details_page.dart';
import 'package:travel_app/widgets/categories.dart';
import 'package:travel_app/widgets/custom_navigationbar.dart';
import 'package:travel_app/widgets/places.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<IconData> categoriesIcons = [
    Icons.restaurant,
    Icons.hotel,
    Icons.local_gas_station_rounded,
    Icons.coffee_rounded,
    Icons.shopping_cart_rounded,
  ];

  final List<String> categoriesName = [
    'Restaurants',
    'Hotels',
    'Gas',
    'Coffee',
    'Shopping',
  ];

  final List<String> placeName = [
    'Zhangjiajie Park',
    'Nafplio',
    'Santorini',
    'Mount Fuji',
    'Menorca',
    'Butterfly Valley',
  ];
  final List<String> placeImages = [
    'assets/images/china/zhangjiajie_national_forest_park_1.jpg',
    'assets/images/greece/nafplio_1.jpg',
    'assets/images/greece/santorini_1.jpg',
    'assets/images/japan/mount _fuji_1.jpg',
    'assets/images/spain/menorca_2.jpg',
    'assets/images/turkey/butterfly_valley_2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.bgColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 20,
                        ),
                        child: Text(
                          'Hi, Paban',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 45.0,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: ColorConstants.mutedColor,
                            ),
                            Text(
                              'Istanbul, Turkey',
                              style: TextStyle(
                                color: ColorConstants.mutedColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Icon(
                      Icons.notifications_active_rounded,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.secondaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/profile.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: ColorConstants.mutedColor,
                    ),
                    hintText: 'Search for places...',
                    hintStyle: const TextStyle(
                      color: ColorConstants.mutedColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        color: ColorConstants.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorConstants.secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: categoriesIcons.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Categories(
                      icons: categoriesIcons[index],
                      names: categoriesName[index],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Places',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.mainColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: placeName.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PlaceDetailsPage(
                              placeImage: placeImages[index],
                              placeName: placeName[index],
                            ),
                          ),
                        );
                      },
                      child: Places(
                        placeImages: placeImages[index],
                        placeName: placeName[index],
                      ),
                    );
                  },
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
