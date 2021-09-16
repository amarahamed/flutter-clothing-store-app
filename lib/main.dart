import 'package:flutter/material.dart';
import 'package:urban_outfits/screens/home.dart';
import 'package:urban_outfits/utilities/utilities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'URBAN OUTFITS',
              style: appBarTitle,
              textAlign: TextAlign.center,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.userAlt,
                  color: primaryTextColor,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.search,
                  color: primaryTextColor,
                ),
                onPressed: () {}),
          ],
          leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: primaryTextColor,
              ),
              onPressed: () {}),
        ),
        body: HomePage(),
      ),
    );
  }
}
