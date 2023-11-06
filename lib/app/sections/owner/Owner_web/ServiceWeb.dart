import 'package:absolute_stay_site/app/sections/owner/Owner_web/form_web/ac_fitting_contact_form_web.dart';
import 'package:absolute_stay_site/app/sections/owner/Owner_web/form_web/electrical_works_contact_form_web.dart';
import 'package:absolute_stay_site/app/sections/owner/Owner_web/form_web/plumbing_contact_form_web.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class AdminServicesPageWeb extends StatefulWidget {
  const AdminServicesPageWeb({super.key});

  @override
  State<AdminServicesPageWeb> createState() => _AdminServicesPageWebState();
}

class _AdminServicesPageWebState extends State<AdminServicesPageWeb> {

  void _showAnimatedDialog(BuildContext context, var val) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: val,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text('Services Provided by Admin',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontFamily: 'josefinsans',
                    color: primaryColor,
                  ),
                ),
                Lottie.asset(
                  'images/service.json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.fill,
                ),
                Card(
                  margin: const EdgeInsets.all(16.0),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'List of Services:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextButton(
                          onPressed: () {
                            _showAnimatedDialog(context,  ACContactFormWeb());
                          },
                          child: Text(
                            'AC Fitting',
                            style: TextStyle(fontSize: 16.0, color: customColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _showAnimatedDialog(context, ElectricalContactFormWeb());
                          },
                          child: Text(
                            'Electrical Works',
                            style: TextStyle(fontSize: 16.0, color: customColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _showAnimatedDialog(context,  PlumbingContactFormWeb());
                          },
                          child: Text(
                            'Plumbing',
                            style: TextStyle(fontSize: 16.0, color: customColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
