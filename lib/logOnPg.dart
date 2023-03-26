import 'package:flutter/material.dart';
import 'package:food_system/searchingScreens/mainSearchPg.dart';

class LogOnPage extends StatefulWidget {
  const LogOnPage({Key? key}) : super(key: key);

  @override
  _LogOnPage createState() => _LogOnPage();
}

class _LogOnPage extends State<LogOnPage> {
//class LogOnPage extends StatelessWidget {
  //const MyApp({super.key});
  final myController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Center(
            child: Container(
              padding: EdgeInsets.all(0.0),
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                //shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(600),

                image: DecorationImage(
                    image: AssetImage('assets/images/foodSystemLogo.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 0, left: 40),
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 400,
              height: 100,
              child: TextField(
                  controller: myController,
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
          ),
          Container(
            padding: EdgeInsets.only(top: 0, left: 40),
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Center(
            child: Container(
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
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 400,
              height: 100,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mainSearchPage(myController.text),
                      ));
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
