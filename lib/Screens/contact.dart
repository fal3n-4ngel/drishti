import 'package:flutter/material.dart';
import 'package:drishti/Mongo/constats.dart';
import 'package:drishti/Mongo/mongodb.dart';
import 'package:drishti/Screens/repdet.dart';

class contactui extends StatefulWidget {
  contactui({Key? key}) : super(key: key);

  @override
  State<contactui> createState() => _contactui();
}

class _contactui extends State<contactui> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
        ),
        Container(
          padding: EdgeInsets.only(top: 60),
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img2.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
