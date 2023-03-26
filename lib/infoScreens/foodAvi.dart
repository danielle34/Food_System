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
import 'package:network_image_search/network_image_search.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

List<Widget> makeListOptions(listsOfStuff) {
  List listOptions = listsOfStuff;
  List<Widget> listStuff = [];
  for (var i = 0; i < listOptions.length; i++) {
    listStuff.add(
      TextButton(
        onPressed: () {
          print(listOptions[i]);
        },
        style: TextButton.styleFrom(
          primary: Colors.black,
        ),
        child: Container(
          height: 100,
          child: FittedBox(
            //fit: BoxFit.fitWidth,
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                listOptions[i],
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  return listStuff;
}

class foodLists extends StatefulWidget {
  foodLists(this.listFoods);
  List listFoods;
  @override
  _foodLists createState() => _foodLists();
}

class _foodLists extends State<foodLists> {

  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    setState(() {
      makeListOptions(widget.listFoods);
    });
    setState(() {});

    setState(() {});
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: makeListOptions(widget.listFoods),
      ),
    );
  }
}
