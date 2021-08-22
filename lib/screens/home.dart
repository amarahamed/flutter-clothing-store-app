import 'package:flutter/material.dart';
import 'package:urban_outfits/dummy_data/dummy_data.dart' as dummy;
import 'package:urban_outfits/utilities/utilities.dart';
import 'package:urban_outfits/models/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> allItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(dummy.items[1].getImagePath());
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext content, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                child: Center(
                  child: Text(
                    'EXCLUSIVE SALE ONLY AT UO',
                    style: showcaseTitle,
                  ),
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          children: dummy.items
              .map((item) => Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item.getImagePath()),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
