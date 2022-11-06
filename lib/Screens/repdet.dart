import 'package:flutter/material.dart';
import 'package:drishti/Mongo/constats.dart';
import 'package:drishti/Mongo/mongodb.dart';

class repdataui extends StatefulWidget {
  repdataui({Key? key}) : super(key: key);

  @override
  State<repdataui> createState() => _repdataui();
}

class _repdataui extends State<repdataui> {
  Widget det() {
    return SingleChildScrollView(
        child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              "Location: $loc",
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Comfortaa',
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Grade: $grad",
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Comfortaa',
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          )
        ]),
        SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Details: $detail",
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Comfortaa',
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ])
      ],
    ));
  }

  Widget none() {
    return Container();
  }

  late ScrollController controller;

  List<int> idd = [0, 1, 2];

  Widget Listnotif(var i) {
    late var data1 = data[i];
    late var loc = data[i]["location"];
    late var fac = data[i]["faculty"];
    late var grad = data[i]["grade"];
    late var aler = data[i]["alert"];
    late var detail = data[i]["details"];
    late var expanded = false;
    return Card(
      color: Color.fromARGB(128, 243, 243, 243),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.linear,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          height: 150,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Icon(
                    Icons.report,
                    color: Color.fromARGB(255, 240, 7, 7),
                    size: 50,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "$aler",
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Comfortaa',
                        fontSize: 28,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            !expanded ? det() : none()
          ])),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Scrollbar(
          child: ListView(
            children: idd.map((strone) {
              return Listnotif(strone);
            }).toList(),
          ),
        ));
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {});
    }
  }
}
