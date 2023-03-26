import 'package:flutter/material.dart';
import 'package:food_system/logOnPg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlng/latlng.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:food_system/infoScreens/communityCard.dart';
import 'package:food_system/searchingScreens/mainSearchPg.dart';
import 'package:flutter/scheduler.dart';

bool methodRan = false;

class communityCard extends StatefulWidget {
  List typedLocationList;
  String PersonUserName;

  communityCard(
      {required this.typedLocationList, required this.PersonUserName});

  @override
  _communityCard createState() => _communityCard();
}

class _communityCard extends State<communityCard> {
//class LogOnPage extends StatelessWidget {
  //const MyApp({super.key});
  // double Lati = 30;
  // double Lani = 30;
  List placeData = [];

  Future getLocation(String theGivenLocation) async {
    // LocationPermission permission = await Geolocator.requestPermission();
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // Lati = position.latitude;
    // Lani = position.longitude;
    // print(position);
    // print(Lati);
    // print(Lani);
    // List<Placemark> placemarks = await placemarkFromCoordinates(Lati, Lani);
    // print(placemarks);
    //
    // List<Location> locations = await locationFromAddress(theGivenLocation);
    // print(
    //     "Address to Lat long ${locations.first.latitude} : ${locations.first.longitude}");
    //
    // setState(() {
    //   Lati = locations.first.latitude;
    //   Lani = locations.first.longitude;
    // });
    // await Future.delayed((Duration(seconds: 3)));
  }

  void initState() {
    super.initState();
  }

  @override
  void dipose() {
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   type: BottomNavigationBarType.fixed,
      //   //even spaced out
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.grey,
      //   selectedFontSize: 20,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.feed),
      //       label: 'main ',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.feed),
      //       label: 'main ',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.feed),
      //       label: 'main ',
      //     ),
      //   ],
      // ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.close,
                  size: 40,
                ),
              ),
              onTapDown: (details) {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "${widget.typedLocationList[0].first.locality}, ${widget
                      .typedLocationList[0].first.administrativeArea} ${widget
                      .PersonUserName}",
                  textScaleFactor: 3,
                ),),
          ),
          Container(
            // here
            height: 500,
            alignment: Alignment.centerLeft,
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(
                    widget.typedLocationList[1].first.latitude,
                    widget.typedLocationList[1].first.longitude), //
                zoom: 15,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget checkInfo() {
    String theText = "Try Again Please";
    try {
      print(widget.typedLocationList);
      if ((widget.typedLocationList[1]).length == 0) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Try Again Please",
            textScaleFactor: 3,
          ),);
      }

      theText = "${widget.typedLocationList[0].first.locality}, ${widget
          .typedLocationList[0].first.administrativeArea} ${widget
          .PersonUserName}";
      if (widget.typedLocationList[0].first.locality == "90 State Cir") {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Try Again Please",
            textScaleFactor: 3,
          ),);
      }
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          theText,
          textScaleFactor: 3,
        ),);
    }
    on Exception catch (_) {
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Try Again Please",
          textScaleFactor: 3,
        ),);
    }
  }
}
