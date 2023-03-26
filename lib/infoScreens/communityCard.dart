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
class communityCard extends StatefulWidget {
  communityCard(this.typedLocation, this.PersonUserName);
  String typedLocation;
  String PersonUserName;

  @override
  _communityCard createState() => _communityCard();
}

class _communityCard extends State<communityCard> {
//class LogOnPage extends StatelessWidget {
  //const MyApp({super.key});
  double Lati = 0;
  double Lani = 0;
  List placeData= [];
  final myController = TextEditingController();
  void getLocation(String theGivenLocation) async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Lati = position.latitude;
    Lani = position.longitude;
    //print((Lati).toString(),"ummmm",(Lani).toString());
    print(position);
    print(Lati);
    print(Lani);
    List<Placemark> placemarks = await placemarkFromCoordinates(Lati,Lani);
    print(placemarks);
    //print((position).toString());

    List<Location> locations = await locationFromAddress(theGivenLocation);
    print("Address to Lat long ${locations.first.latitude} : ${locations.first.longitude}");

    setState(() {
      Lati = locations.first.latitude;
      Lani = locations.first.longitude;

    });
  }

  void initState() {
    setState(() {});
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
          ),

          Container(
            padding: EdgeInsets.all(20.0),
            width: 400,
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                print("pushed");
                //getLocation(typedLocation.text);

                List newReturnList =[];



                //typedLocation
                setState(() {});
              },
              child: Text(
                'Find my communty',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Center(
          //   child: Container(
          //     padding: EdgeInsets.all(30.0),
          //     child: Text(
          //       "${Lati}, ${Lani}",
          //       textScaleFactor: 3,
          //     ),
          //   ),
          // ),
          Container(
            // here
            height: 500,
            alignment: Alignment.centerLeft,
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(37.785834,-122.406417),//(Lati,Lani),//
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
            )
            ,
          ),

        ],
      ),
    );
  }
}