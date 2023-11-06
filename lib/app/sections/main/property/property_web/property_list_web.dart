import 'package:absolute_stay_site/app/sections/main/property/property_mobile/PropertyDetailPage.dart';
import 'package:absolute_stay_site/usable/core/animations/entrance_fader.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../propertydetail.dart';
import '../propertylist.dart';

class PropertyData {
  final String image;
  final String title;
  final String price;
  final String distance;
  final String description;

  PropertyData({
    required this.image,
    required this.title,
    required this.price,
    required this.distance,
    required this.description,
  });
}

class PropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String distance;
  final String description;

  const PropertyCard({super.key,
  required this.image,
  required this.title,
  required this.price,
  required this.distance,
  required this.description,
});

@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigate to the property detail page here
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PropertyDetail(),
        ),
      );
    },
    child: Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                Text(
                  distance,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}


class PropertyListingPageWeb extends StatefulWidget {
  const PropertyListingPageWeb({Key? key}) : super(key: key);

  @override
  State<PropertyListingPageWeb> createState() => _PropertyListingPageWebState();
}

class _PropertyListingPageWebState extends State<PropertyListingPageWeb> {
  List<PropertyData> properties = [
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 1',
      price: '\$100',
      distance: '5 miles',
      description: 'Description for Property 1',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 2',
      price: '\$150',
      distance: '3 miles',
      description: 'Description for Property 2',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 1',
      price: '\$100',
      distance: '5 miles',
      description: 'Description for Property 1',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 2',
      price: '\$150',
      distance: '3 miles',
      description: 'Description for Property 2',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 2',
      price: '\$150',
      distance: '3 miles',
      description: 'Description for Property 2',
    ),
    PropertyData(
      image: 'images/image1.png',
      title: 'Property 2',
      price: '\$150',
      distance: '3 miles',
      description: 'Description for Property 2',
    ),
    // Add more properties as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Pop the current route and go back to the previous page
              },
            ),
          ),
          const Center(
            child: Text(
              "300+ Places to Stay",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'josefinsans',
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
            ),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 20.w,
              child: DropdownButtonFormField<String>(
                value: null, // Set the initial value or use a state variable
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                },
                items: <String>['Relevance', 'Popularity']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.blue), // Initial border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: primaryColor), // Border color when focused
                  ),
                  labelText: 'Sort By',
                  labelStyle: const TextStyle(color: primaryColor),
                  hintText: 'Sort By',
                  hintStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: double.maxFinite,
            width: 100.w,
            child: EntranceFader(
              offset: const Offset(0, 0),
              delay: const Duration(seconds: 0),
              duration: const Duration(milliseconds: 800),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 40.h,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 60,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return PropertyCard(
                            image: properties[index].image,
                            title: properties[index].title,
                            price: properties[index].price,
                            distance: properties[index].distance,
                            description: properties[index].description,
                          );
                        },
                        childCount: properties.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

