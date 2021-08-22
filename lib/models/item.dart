class Item {
  String _itemName;
  String _itemImagePath;
  String _itemDescription;
  double _itemPrice;
  List<String> _itemSizes;

  Item(String _itemName, String _itemImagePath, String _itemDescription,
      double _itemPrice, List<String> _itemSizes) {
    setItemName(_itemName);
    setItemImagePath(_itemImagePath);
    setItemDescription(_itemDescription);
    setItemPrice(_itemPrice);
    setItemSizes(_itemSizes);
  }

  void setItemName(String itemName) {
    if (itemName.length <= 2) {
      throw new ArgumentError('Item name should contain at least 2 letters');
    } else {
      this._itemName = itemName;
    }
  }

  void setItemImagePath(String imagePath) {
    if (imagePath.length <= 5) {
      throw new ArgumentError(
          'Item image path should contain at least 5 letters');
    } else {
      this._itemImagePath = imagePath;
    }
  }

  void setItemDescription(String itemDescription) {
    if (itemDescription.length <= 10) {
      throw new ArgumentError(
          'Item description should contain at least 10 letters');
    } else {
      this._itemDescription = itemDescription;
    }
  }

  void setItemPrice(double itemPrice) {
    if (itemPrice < 0) {
      throw new ArgumentError('Item price should at least be 0 or more');
    } else {
      this._itemPrice = itemPrice;
    }
  }

  List<String> itemSizes = ['S', 'M', 'L', 'Xl', 'XXL', 'XXXL'];

  void setItemSizes(List<String> sizes) {
    bool sizeAccepted = false;
    for (String size in sizes) {
      if (itemSizes.contains(size)) {
        sizeAccepted = true;
      } else {
        sizeAccepted = false;
      }
    }

    if (!sizeAccepted) {
      throw new ArgumentError(
          'Item size should be selected from the list of options ${itemSizes}');
    } else {
      this._itemSizes = sizes;
    }
  }
}
