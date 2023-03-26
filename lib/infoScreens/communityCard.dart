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
import 'package:food_system/infoScreens/foodAvi.dart';
class communityCard extends StatefulWidget {
  final List<dynamic> typedLocationList;
  String PersonUserName;

  communityCard(
      {required this.typedLocationList, required this.PersonUserName});

  @override
  _communityCard createState() => _communityCard();
}

class _communityCard extends State<communityCard> {
  Future getLocation() async {
    await widget.typedLocationList;
  }

  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    setState(() {
      getLocation();
      transferData();
    });
    setState(() {});

    setState(() {});
  }

  List heartColor = [Colors.black, Colors.pink];
  int heartColorIndi = 0;
  List listOfFoods = [];
  List topTen = [];


  String commadedWords = "";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: checkInfo(),
          ),
          Center(
            child: Unsplash(
              width: '720',
              height: '360',
              category: '${widget.typedLocationList[0].first.locality} town',
              subcategory:
                  '${widget.typedLocationList[0].first.administrativeArea} city ',
            ),
          ),
          Row(
            children:  <Widget>[

              Container(
                padding: EdgeInsets.all(20),
                child: GestureDetector(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.favorite,
                      color: heartColor[heartColorIndi % 2],
                      size: 40,
                    ),
                  ),
                  onTapDown: (details) {
                    setState(() {
                      heartColorIndi++;
                      getListIngredienets();
                    });
                  },
                ),
              ),
              SizedBox(width: 150), // give it width

              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => foodLists(topTen),
                      ));
                },
                child: Text(
                  'Food Options',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),




          Container(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Food items such as " + commadedWords,
              textScaleFactor: 3,
              style: TextStyle(fontSize: 7),
            ),
          ),
          //makeListOptions(),
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
    if (widget.typedLocationList[0].first.name == "24590") {
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Try Again Please",
          textScaleFactor: 3,
        ),
      );
    }
    try {
      setState(() {});

      return Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "${widget.typedLocationList[0].first.locality}, ${widget.typedLocationList[0].first.administrativeArea} ",
            textScaleFactor: 3,
          ));
    } on Exception catch (_) {
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Try Again Please",
          textScaleFactor: 3,
        ),
      );
    }
  }

  List<Widget> makeListOptions() {
    List<Widget> listStuff = [];
    for (var i = 0; i < topTen.length; i++) {
      listStuff.add(
        TextButton(
          onPressed: () {
            print(topTen[i]);
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
                  topTen[i],
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

  static Future<List> getListIngredienets() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "100", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "8ebd38dd1bmshc7b804ef8d01b64p1d9ecfjsn8d03d2a40171",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> _temp = [];
    for (var i in data['feed']) {
      for (var j in i['content']['ingredientLines']) {
        _temp.add(j['ingredient']);
      }
    }

    return _temp;
  }

  Future transferData() async {
    listOfFoods = await getListIngredienets(); //getLocation(theGivenLocation);
    int doubleRando = Random().nextInt(listOfFoods.length - 11);
     topTen = listOfFoods.sublist(doubleRando, doubleRando + 10);
    commadedWords = "";
    for (var i in topTen) {
      commadedWords += i + ", ";
    }
    setState(() {});
  }
}
