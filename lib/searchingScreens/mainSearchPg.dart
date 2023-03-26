import 'package:flutter/material.dart';
import 'package:food_system/logOnPg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlng/latlng.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mainSearchPage extends StatefulWidget {
  mainSearchPage(this.PersonUserName);

  String PersonUserName;

  @override
  _mainSearchPage createState() => _mainSearchPage();
}

class _mainSearchPage extends State<mainSearchPage> {
  double Lati = 0;
  double Lani = 0;

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Lati = position.latitude;
    Lani = position.longitude;
    print((Lati).toString(),"ummmm",(Lani).toString());
    //print((position).toString());
    setState(() {});

  }

  void initState() {
    setState(() {});
  }

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
                onSubmitted: (value) {
                  //do not do nothing
                  //https://stackoverflow.com/questions/54860198/detect-enter-key-press-in-flutter
                },
                onChanged: (value) {}),
          ),
          Container(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            width: 400,
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                print("pushed");
                getLocation();
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

      Container(
        // here
        height: 300,
        alignment: Alignment.centerLeft,
        child:           FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(Lati,Lani),
            zoom: 9.2,
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
          // FlutterMap(
          //   options: MapOptions(
          //     center: latLng.LatLng(51.5, -0.09),
          //     zoom: 13.0,
          //   ),
          //   layers: [
          //     TileLayerOptions(
          //         urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          //         subdomains: ['a', 'b', 'c']
          //     ),
          //     MarkerLayerOptions(
          //       markers: [
          //         Marker(
          //           width: 80.0,
          //           height: 80.0,
          //           point: latLng.LatLng(51.5, -0.09),
          //           builder: (ctx) =>
          //               Container(
          //                 child: FlutterLogo(),
          //               ),
          //         ),
          //       ],
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
