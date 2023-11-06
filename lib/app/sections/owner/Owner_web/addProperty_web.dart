import 'dart:io';
import 'package:absolute_stay_site/usable/PropertySelection.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'SuccessScreenWeb.dart';



class AddPropertyWeb extends StatefulWidget {
  const AddPropertyWeb({Key? key}) : super(key: key);

  @override
  _AddPropertyWebState createState() => _AddPropertyWebState();
}

class _AddPropertyWebState extends State<AddPropertyWeb> {

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);



  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }



  List<File> imageFiles = [];
  List<File> roomImageFiles = [];

  int _currentImageIndex = 0;

  List<String> imagePaths = [
    'images/image1.png',
    'images/image2.png',
    'images/image3.png',
    // Add more image paths here
  ];

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roomPriceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              width: 35.w,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const Text('Add Your Property',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        fontFamily: 'josefinsans',
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildInputField(
                      title: 'Property Name',
                      controller: propertyNameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const PropertySelection(),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildInputField(
                      title: 'Address',
                      controller: addressController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildInputField(
                      title: 'Landmark',
                      controller: landmarkController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildInputField(
                      title: 'Pincode',
                      controller: pincodeController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Which Features Does Your Property Have?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Checkbox options for property features
                        for (int i = 0; i < checkboxNames.length; i++)
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(checkboxNames[i],style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),),
                            value: checkboxValues[i],
                            onChanged: (value) => _onCheckboxChanged(i, value!),
                            activeColor: customColor,
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildInputField(
                      title: 'Enter Description',
                      controller: descriptionController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Property Images? Max 5 image',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (imageFiles.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int index = 0;
                                index < imageFiles.length;
                                index++)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                          ),
                                          child: Image.file(imageFiles[index]),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                imageFiles.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                shape: BoxShape.circle,
                                              ),
                                              padding: const EdgeInsets.all(4),
                                              child: const Icon(
                                                Icons.close,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedImage = await picker.pickImage(
                                source: ImageSource.gallery,
                              );

                              if (pickedImage != null) {
                                setState(() {
                                  imageFiles.add(File(pickedImage.path));
                                });
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color.fromRGBO(33, 37, 41, 1.0);
                                  }
                                  return const Color.fromRGBO(33, 84, 115, 1.0);
                                },
                              ),
                            ),
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text(
                              "Add More",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final pickedImage = await picker.pickImage(
                          source: ImageSource.gallery,
                        );

                        if (pickedImage != null) {
                          setState(() {
                            imageFiles.add(File(pickedImage.path));
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color.fromRGBO(33, 37, 41, 1.0);
                            }
                            return const Color.fromRGBO(33, 84, 115, 1.0);
                          },
                        ),
                      ),
                      icon: const Icon(Icons.image, color: Colors.white),
                      label: const Text(
                        "Upload Images",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildInputField(
                      title: 'Room estimated Price',
                      controller: roomPriceController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Room Images
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Room Images: Max 5 images',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (roomImageFiles.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int index = 0;
                                index < roomImageFiles.length;
                                index++)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                          ),
                                          child: Image.file(roomImageFiles[index]),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                roomImageFiles.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                shape: BoxShape.circle,
                                              ),
                                              padding: const EdgeInsets.all(4),
                                              child: const Icon(
                                                Icons.close,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedImage = await picker.pickImage(
                                source: ImageSource.gallery,
                              );

                              if (pickedImage != null) {
                                setState(() {
                                  roomImageFiles.add(File(pickedImage.path));
                                });
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color.fromRGBO(33, 37, 41, 1.0);
                                  }
                                  return const Color.fromRGBO(33, 84, 115, 1.0);
                                },
                              ),
                            ),
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text(
                              "Add More",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final pickedImage = await picker.pickImage(
                          source: ImageSource.gallery,
                        );

                        if (pickedImage != null) {
                          setState(() {
                            roomImageFiles.add(File(pickedImage.path));
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color.fromRGBO(33, 37, 41, 1.0);
                            }
                            return const Color.fromRGBO(33, 84, 115, 1.0);
                          },
                        ),
                      ),
                      icon: const Icon(Icons.image, color: Colors.white),
                      label: const Text(
                        "Upload Room Images",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(height: 5,),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Preview",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CarouselSlider(
                              items: imagePaths.map((imagePath) {
                                return Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 200,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                autoPlay: true, // Enable automatic sliding
                                autoPlayInterval: const Duration(seconds: 2), // Set the interval (2 seconds in this example)
                                autoPlayAnimationDuration: const Duration(milliseconds: 800), // Animation duration
                                viewportFraction: 1.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentImageIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imagePaths.map((imagePath) {
                              int index = imagePaths.indexOf(imagePath);
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentImageIndex == index
                                      ? customColor
                                      : Colors.grey,
                                ),
                              );
                            }).toList(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹2,800 / Day",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "3 Bedroom Apartment in Salwa",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "You can easily book your according to your budget hotel by our website.",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showToast('Saved Successfully');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromRGBO(33, 84, 115, 1.0);
                                }
                                return const Color.fromRGBO(33, 37, 41, 1.0);
                              },
                            ),
                          ),
                          child: const Text(
                            'Save for later',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SuccessScreenMobile()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromRGBO(33, 37, 41, 1.0);
                                }
                                return const Color.fromRGBO(33, 84, 115, 1.0);
                              },
                            ),
                          ),
                          child: const Text(
                            'Add Property',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Divider(height: 5,)

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCheckboxChanged(int index, bool value) {
    setState(() {
      checkboxValues[index] = value;
    });
  }

  Widget _buildInputField({
    required String title,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.transparent, width: 0),
            color: const Color.fromARGB(255, 241, 241, 241),
          ),
          child: TextFormField(
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  List<bool> checkboxValues = List.generate(6, (_) => false);
  List<String> checkboxNames = [
    'Swimming pool',
    'Furnished',
    'Heater',
    'Parking',
    'Heater',
    'Kitchen',
  ];
}


