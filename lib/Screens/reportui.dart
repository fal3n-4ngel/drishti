import 'package:flutter/material.dart';
import 'package:drishti/Mongo/constats.dart';
import 'package:drishti/Mongo/mongodb.dart';

class reportui extends StatefulWidget {
  reportui({Key? key}) : super(key: key);

  @override
  State<reportui> createState() => _reportui();
}

class _reportui extends State<reportui> {
  @override
  String user = 'user';
  int _index = 0;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final myloc = TextEditingController();
  final myint = TextEditingController();
  final mytyp = TextEditingController();
  final mydet = TextEditingController();
  final myrem = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myloc.dispose();
    myint.dispose();
    mytyp.dispose();
    mydet.dispose();
    myrem.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    TextEditingController gradeController = TextEditingController();
    TextEditingController facultyController = TextEditingController();
    TextEditingController alertController = TextEditingController();
    TextEditingController detailsController = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Card(
                color: Color.fromARGB(223, 222, 222, 222),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                elevation: 10,
                child: Column(children: [
                  Container(
                      width: 148,
                      height: 70,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 20,
                            left: 0,
                            child: Text(
                              'Report \n',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Comfortaa',
                                  fontSize: 36,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                      ])),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    width: 750.0,
                    child: TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: 750.0,
                    child: TextField(
                      controller: gradeController,
                      decoration: const InputDecoration(
                        labelText: 'Grade',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: 750.0,
                    child: TextField(
                      controller: alertController,
                      decoration: const InputDecoration(
                        labelText: 'Subject',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: 750.0,
                    child: TextField(
                      controller: detailsController,
                      decoration: const InputDecoration(
                        labelText: 'Details',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: 750.0,
                    child: TextField(
                      controller: facultyController,
                      decoration: const InputDecoration(
                        labelText: 'Faculty',
                      ),
                    ),
                  ),
                  Container(
                      height: 50,
                      margin: EdgeInsets.all(15),
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: ElevatedButton(
                        child: const Text(
                          ' Report ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Comfortaa',
                              fontSize: 25,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        onPressed: () {
                          setState(() {
                            location = locationController.text;
                            grade = gradeController.text;
                            alert = alertController.text;
                            details = detailsController.text;
                            faculty = facultyController.text;
                            MongoDatabase.push(
                                location, faculty, grade, alert, details);
                          });
                        },
                      )),
                ])),
          ],
        ),
      ),
    );
  }
}
