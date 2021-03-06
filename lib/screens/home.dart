import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:urban_outfits/dummy_data/dummy_data.dart' as dummy;
import 'package:urban_outfits/utilities/utilities.dart';
import 'package:urban_outfits/screens/itemScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double mainAxis = MediaQuery.of(context).size.width;
    double crossAxis = MediaQuery.of(context).size.height;
    timeDilation = 1.5;
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext content, int index) {
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
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverGrid.count(
            // childAspectRatio: (120 / 280),
            childAspectRatio: (crossAxis * 0.5 / mainAxis * 0.6),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 24,
            children: dummy.items
                .map((item) => GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ItemScreen(
                            item: item,
                          );
                        }));

                        // print('Item ${item.getItemName()} pressed');
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Hero(
                                tag: item.getImagePath(),
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: AssetImage(item.getImagePath()),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item.getItemName()}',
                                    style: itemTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '\$${item.getItemPrice().toStringAsFixed(2)}',
                                    style: itemTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
