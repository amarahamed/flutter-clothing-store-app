import 'package:urban_outfits/models/item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urban_outfits/utilities/utilities.dart';

class ItemScreen extends StatelessWidget {
  final Item item;

  ItemScreen({this.item});

  @override
  Widget build(BuildContext context) {
    double showcaseImageSize = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(showcaseImageSize),
      //   child: AppBar(
      //     flexibleSpace: Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage(item.getImagePath()), fit: BoxFit.fitWidth),
      //       ),
      //     ),
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     actions: [
      //       IconButton(
      //           icon: Icon(
      //             FontAwesomeIcons.userAlt,
      //             color: Colors.black,
      //           ),
      //           onPressed: () {}),
      //     ],
      //     leading: IconButton(
      //         icon: Icon(
      //           FontAwesomeIcons.arrowLeft,
      //           color: Colors.black,
      //         ),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         }),
      //   ),
      // ),
      body: ItemDetails(
        item: item,
      ),
    );
  }
}

class ItemDetails extends StatefulWidget {
  final Item item;
  ItemDetails({this.item});
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  Item currentItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentItem = widget.item ?? null;
  }

  @override
  Widget build(BuildContext context) {
    double showcaseImageSize = MediaQuery.of(context).size.height * 0.65;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: showcaseImageSize,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(currentItem.getImagePath()),
                fit: BoxFit.fitWidth),
          ),
        ),
        SingleChildScrollView(
          child: Transform.translate(
            offset: Offset(0, -30),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '\$${currentItem.getItemPrice()}',
                    style: itemPriceTextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    currentItem.getItemName(),
                    style: itemNameTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    currentItem.getItemDescription(),
                    style: itemDecsriptionTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
