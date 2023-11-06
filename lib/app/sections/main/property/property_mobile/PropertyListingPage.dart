
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../propertydetail.dart';
import 'PropertyDetailPage.dart';


class PropertyListingPageMobile extends StatefulWidget {


  const PropertyListingPageMobile({super.key});

  @override
  State<PropertyListingPageMobile> createState() => _PropertyListingPageMobileState();
}

class _PropertyListingPageMobileState extends State<PropertyListingPageMobile> {
  String? selectedValue1;
  String? selectedValue2;

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                fontSize: 24,
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
              width: 32.w,
              child: DropdownButtonFormField<String>(
                value: selectedValue1,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue1 = newValue;
                  });
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
                    borderSide: BorderSide(color: customColor), // Initial border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: customColor), // Border color when focused
                  ),
                  labelText: 'Sort By',
                  labelStyle: TextStyle(color: customColor),
                  hintText: 'Sort By',
                  hintStyle: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          const PropertyCard(
            image: 'images/image1.png',
            title: 'Hilton Vienna Park',
            price: '₹2,800 / Day',
            distance: '2.5km from central',
            description:
            'You can easily book your according to your budget hotel by our website.',
          ),
          const SizedBox(height: 25,),
          const PropertyCard(
            image: 'images/image1.png',
            title: 'Hotel XYZ',
            price: '₹2,500 / Day',
            distance: '3.0km from central',
            description:
            'Enjoy your stay at Hotel XYZ with affordable prices and great amenities.',
          ),
          const SizedBox(height: 25,),
          const PropertyCard(
            image: 'images/image1.png',
            title: 'Sunset Resorts',
            price: '₹3,500 / Day',
            distance: '1.0km from central',
            description:
            'Experience a luxurious stay at Sunset Resorts with stunning views.',
          ),
          const SizedBox(height: 25,),
          const PropertyCard(
            image: 'images/image1.png',
            title: 'City Suites',
            price: '₹2,200 / Day',
            distance: '2.2km from central',
            description:
            'City Suites offers comfortable accommodation for your trip.',
          ),
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String distance;
  final String description;

  const PropertyCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.distance,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the property detail page here
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PropertyDetail(
            ),
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
              height: 200,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    distance,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

