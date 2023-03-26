import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_system/logOnPg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlng/latlng.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:food_system/infoScreens/communityCard.dart';
import 'package:food_system/bottomNavPg.dart';

class mainSearchPage extends StatefulWidget {
  mainSearchPage(this.PersonUserName);

  String PersonUserName;

  @override
  _mainSearchPage createState() => _mainSearchPage();
}

class _mainSearchPage extends State<mainSearchPage> {
  // double Lati = 0;
  // double Lani = 0;
  List placeData = [];
  final typedLocation = TextEditingController();

  Future<List> getLocation(String theGivenLocation) async {
    // List<Location> locations = await locationFromAddress(theGivenLocation);
    // double Lati = 38.8951;
    // double Lani = -77.0364;
    // Lati = locations.first.latitude;
    // Lani = locations.first.longitude;
    // List<Placemark> placemarks = await placemarkFromCoordinates(Lati,Lani);

    List<Location> locations;
    double Lati = 38.8951;
    double Lani = -77.0364;

    List<Placemark> placemarks;
    try {
      locations = await locationFromAddress(theGivenLocation);
      Lati = locations.first.latitude;
      Lani = locations.first.longitude;
      placemarks = await placemarkFromCoordinates(Lati, Lani);
    } on Exception catch (_) {
      print("ummmmm");
      LocationPermission permission = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      locations = await locationFromAddress(
          "1827 University Ave Charlottesville, VA 22903 United States");
      Lati = locations.first.latitude;
      Lani = locations.first.longitude;

      Lati = position.latitude;
    }
    placemarks = await placemarkFromCoordinates(Lati, Lani);

    setState(() {});

    print(placemarks.first);
    print(locations.first.latitude);

    return [placemarks, locations];
  }

  Future transferData(theGivenLocation) async {
    placeData =
        await getLocation(typedLocation.text); //getLocation(theGivenLocation);
  }

  void initState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigateBar(),
      body: ListView(
        children: [
          Container(
            height: 100,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Hi ${widget.PersonUserName},\nwhere are you located? ",
                textScaleFactor: 3,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            width: 400,
            height: 100,
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              //https://www.tutorialkart.com/flutter/flutter-textfield/
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              controller: typedLocation,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            width: 400,
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () async {
                //getLocation(typedLocation.text);

                List newReturnList = [];

                await transferData(typedLocation.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => communityCard(
                            typedLocationList: placeData,
                            PersonUserName: widget.PersonUserName),
                        fullscreenDialog: true));
                //typedLocation
                setState(() {});
              },
              child: Text(
                'Find my community',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            // here
            height: 500,
            alignment: Alignment.centerLeft,
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(37.785834, -122.406417), //(Lati,Lani),//
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
}
