import 'package:flutter/material.dart';
import 'package:urban_outfits/utilities/utilities.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: Center(
              child: Text(
                'EXCLUSIVE SALE ONLY AT UO',
                style: showcaseTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
