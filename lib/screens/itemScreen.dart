import 'package:flutter/scheduler.dart';
import 'package:urban_outfits/dummy_data/dummy_data.dart';
import 'package:urban_outfits/models/item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urban_outfits/utilities/utilities.dart';

class ItemScreen extends StatelessWidget {
  final Item item;

  ItemScreen({this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  String selectedSize;
  String numberQty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentItem = widget.item ?? null;
  }

  List<DropdownMenuItem> getDropDownItem(List listItems) {
    List<DropdownMenuItem> dropdownItems = [];

    for (var _item in listItems) {
      var newDropDownItem = DropdownMenuItem(
        child: Text('$_item'),
        value: '$_item',
      );

      dropdownItems.add(newDropDownItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;
    double showcaseImageSize = MediaQuery.of(context).size.height * 0.65;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          pinned: false,
          expandedHeight: showcaseImageSize,
          iconTheme: IconThemeData(
            color: primaryTextColor,
          ),
          leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: primaryTextColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.shoppingCart,
                  color: primaryTextColor,
                ),
                onPressed: () {}),
          ],
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Hero(
                tag: currentItem.getImagePath(),
                child: Image.asset(
                  currentItem.getImagePath(),
                  fit: BoxFit.cover,
                ),
              ) //Images.network
              ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext content, int index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 2.5),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 0.5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  elevation: 8,
                                  dropdownColor: Color(0xFFF8F8F8),
                                  hint: Text('Select your size'),
                                  isExpanded: true,
                                  iconSize: 30,
                                  icon: Icon(Icons.arrow_drop_down),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                  value: selectedSize,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSize = value;
                                    });
                                  },
                                  items: getDropDownItem(
                                      currentItem.getItemSizes()),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 0.5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  elevation: 8,
                                  dropdownColor: Color(0xFFF8F8F8),
                                  hint: Text('Qty'),
                                  isExpanded: true,
                                  iconSize: 30,
                                  icon: Icon(Icons.arrow_drop_down),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  value: numberQty,
                                  onChanged: (value) {
                                    setState(() {
                                      numberQty = value;
                                    });
                                  },
                                  items: getDropDownItem(qty),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 16)),
                              backgroundColor:
                                  MaterialStateProperty.all(primaryTextColor),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              textStyle:
                                  MaterialStateProperty.all(itemTextStyle),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            child: Text('ADD TO CART'),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
