import 'package:flutter/material.dart';
import 'package:drishti/Mongo/constats.dart';
import 'package:drishti/Mongo/mongodb.dart';
import 'package:drishti/Screens/repdet.dart';

class homeui extends StatefulWidget {
  homeui({Key? key}) : super(key: key);

  @override
  State<homeui> createState() => _homeui();
}

class _homeui extends State<homeui> {
  List<int> idd1 = [0, 1];
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 60.0, left: 20),
                  child: const Text(
                    "Hello there",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Comfortaa',
                        fontSize: 36,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Card(
              color: Color.fromARGB(211, 242, 242, 242),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              elevation: 10,
              child: Container(
                  height: height / 4, width: width - 30, child: Text(""))),
          AnimatedContainer(
              padding: EdgeInsets.only(left: 20, right: 10),
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Latest Alert",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 36,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )
                    ],
                  ),

                  SizedBox(
                    //   %%%% The List View
                    height: 280,
                    child: ListView(
                      children: idd1.map((strone) {
                        return card1(strone);
                      }).toList(),
                    ),
                  ),

                  // calling of the card
                ],
              )),
          SizedBox(
            height: 0,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => repdataui()));
              },
              child: Text(
                "Load More",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
        ],
      ),
    );
  }

  Widget det() {
    // Data for expand.
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
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
            padding: EdgeInsets.only(left: 20, right: 10),
            child: Text(
              "Details: $detail",
              textAlign: TextAlign.justify,
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
    );
  }

  Widget card1(var i) {
    late var data1 = data[i];
    late var loc = data[i]["location"];
    late var fac = data[i]["faculty"];
    late var grad = data[i]["grade"];
    late var aler = data[i]["alert"];
    late var detail = data[i]["details"];
    var exp = expanded;

    // main reports card
    return Card(
      color: Color.fromARGB(171, 255, 255, 255),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 10,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.linear,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          height: exp ? 180 : 80,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 13),
                  child: const Icon(
                    Icons.report,
                    color: Color.fromARGB(255, 240, 7, 7),
                    size: 50,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25),
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
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          exp = !exp;
                          expanded = !expanded;
                          alert = 'hello';
                        });
                      },
                      child: Icon(
                        !exp ? Icons.arrow_downward : Icons.arrow_upward,
                        size: 35,
                      )),
                )
              ],
            ),
            expanded ? det() : none()
          ])),
    );
  }

  Widget none() {
    // Blank area in case of no widget..
    return Container();
  }
}
