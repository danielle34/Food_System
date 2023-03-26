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

  communityCard({required this.typedLocationList, required this.PersonUserName});

  @override
  _communityCard createState() => _communityCard();
}

class _communityCard extends State<communityCard> {
//class LogOnPage extends StatelessWidget {
  //const MyApp({super.key});
  double Lati = 0;
  double Lani = 0;
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
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              child: const Icon(
                Icons.close,
                size: 50,
              ),
              onTapDown: (details) {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            height: 100,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "${widget.typedLocationList[1].first.longitude}, ${widget.PersonUserName}",
                textScaleFactor: 3,
              ),
            ),
          ),
          Container(
            // here
            height: 500,
            alignment: Alignment.centerLeft,
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(widget.typedLocationList[1].first.latitude, widget.typedLocationList[1].first.longitude), //
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
