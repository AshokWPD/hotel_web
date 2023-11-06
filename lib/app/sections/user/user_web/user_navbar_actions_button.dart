import 'package:absolute_stay_site/app/sections/about/about.dart';
import 'package:absolute_stay_site/app/sections/main/property/property_mobile/PropertyListingPage.dart';
import 'package:absolute_stay_site/app/sections/main/property/propertylist.dart';
import 'package:absolute_stay_site/usable/core/animations/entrance_fader.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';


class UserNavBarActionButton extends StatefulWidget {
  final String label;
  final int index;
  const UserNavBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  State<UserNavBarActionButton> createState() => _UserNavBarActionButtonState();
}

class _UserNavBarActionButtonState extends State<UserNavBarActionButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // theme
    // var theme = Theme.of(context);
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: InkWell(
        onHover: (value) {
          setState(() => isHover = value);
        },
        onTap: () {
          switch (widget.index+1) {
            case 1:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PropertyList()));
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            widget.label,
            style: TextStyle(
                color: isHover ? secondaryColor : primaryColor,
                fontFamily: 'josefinsans',
                fontWeight: FontWeight.w300,
                fontSize: screenWidth < 1200 ? 20 : 25),
          ),
        ),
      ),
    );
  }
}
