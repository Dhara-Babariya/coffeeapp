  import 'package:flutter/cupertino.dart';
  import 'package:flutter/foundation.dart';
  import 'package:provider/provider.dart';
  import '../Activities/Home_Screen.dart';
  import '../Activities/proHomePage.dart';
  import '../Model/item_model.dart';

  class FavouriteItem with ChangeNotifier {
    Map<ItemDetail, int> _itemCountMap = {};

    Map<ItemDetail, int> get itemCountMap => _itemCountMap;

    List<ItemDetail> itemdetail = [
      ItemDetail(
          image: 'assets/images/coffee_mug.png',
          name: 'Creamy Latte',
          price: 'Rp.40.0',
          id: 1),
      ItemDetail(
          image: 'assets/images/starbuscks_mug.png',
          name: 'Espresso',
          price: 'Rp.50.0',
          id: 2),
      ItemDetail(
          image: 'assets/images/coffee3.png',
          name: ' Black Coffee',
          price: 'Rp.100.0',
          id: 3),
      ItemDetail(
          image: 'assets/images/coffee1.png',
          name: 'Iced Latte',
          price: 'Rp.50.0',
          id: 4),
      ItemDetail(
          image: 'assets/images/coffee11.png',
          name: 'Irish coffee',
          price: 'Rp.40.0',
          id: 5),
      ItemDetail(
          image: 'assets/images/coffee4.png',
          name: 'Cafe au Lait',
          price: 'Rp.50.0',
          id: 6),
      ItemDetail(
          image: 'assets/images/coffee5.png',
          name: 'Macchiato',
          price: 'Rp.40.0',
          id: 7),
      ItemDetail(
          image: 'assets/images/coffee6.png',
          name: 'Americano',
          price: 'Rp.50.0',
          id: 8),
      ItemDetail(
          image: 'assets/images/coffee7.png',
          name: 'Cold Brew',
          price: 'Rp.40.0',
          id: 9),
      ItemDetail(
          image: 'assets/images/coffee8.png',
          name: 'Capucino',
          price: 'Rp.50.0',
          id: 10),
      ItemDetail(
          image: 'assets/images/coffee9.png',
          name: 'Affogato',
          price: 'Rp.40.0',
          id: 11),
      ItemDetail(
          id: 12,
          image: 'assets/images/coffee10.png',
          name: 'Red Eye ',
          price: 'Rp.50.0'),
    ];

    double total = 0.000;


     addItems(ItemDetail item) {
      itemdetaillists.add(item);
      print('${itemdetaillists.length}========================================');

      if (_itemCountMap.containsKey(item)) {
        _itemCountMap[item] = _itemCountMap[item]! + 1;
      } else {
        _itemCountMap[item] = 1;
      }
      notifyListeners();
      return getItemCount(item);
    }

    void decrementItem(ItemDetail item) {
      if (_itemCountMap.containsKey(item)) {
        _itemCountMap[item] = _itemCountMap[item]! - 1;
        // _itemCountMap.remove(item);
        itemdetaillists.remove(item);
      // } else {
      //   _itemCountMap[item] = 1;
      }
      print('${_itemCountMap.length}&&&&&&&&&&&&&&&&&&&&&&&&&&&');
      print('${itemdetaillists.length}&&&&&&&&&&&&&&&&&&&&&&&&&&&');

      notifyListeners();
    }

    void removeItemFromCart(ItemDetail item) {

      _itemCountMap.remove(item);
      itemdetaillists.removeWhere((cartItem) => cartItem.id == item.id);

      // itemdetaillists.remove(item);
      print('${itemdetaillists.length}===================---------------=====================');

      notifyListeners();
    }

    List<ItemDetail> getUniqueItems(List<ItemDetail> list) {
      Set<int> uniqueIds = <int>{};
      List<ItemDetail> uniqueList = [];

      for (var item in list) {
        if (!uniqueIds.contains(item.id)) {
          uniqueIds.add(item.id);
          uniqueList.add(item);
        }
      }
      return uniqueList;
    }

    Map<ItemDetail, int> countItems(List<ItemDetail> list) {
      Map<ItemDetail, int> itemCountMap = {};

      for (var item in list) {
        if (itemCountMap.containsKey(item)) {
          itemCountMap[item] = itemCountMap[item]! + 1;
        } else {
          itemCountMap[item] = 1;
        }
      }
      return itemCountMap;
    }

    int getItemCount(ItemDetail item) {
      int count = _itemCountMap[item] ?? 0;
      return count;
    }

    void updateTotalPrice() {
      double newTotal = 0.0;
      for (var item in itemCountMap.keys) {
        double totalItemPrice =
            double.parse(item.price.replaceAll('Rp.', '').trim());
        int count = itemCountMap[item] ?? -1;
        newTotal += totalItemPrice * count;
      }

      total = newTotal;
    }

    double getTotalItemPrice(ItemDetail item) {
      double totalPrice = 0.0;
      if (item != null ) {
        double price = double.parse(item.price.replaceAll('Rp.', '').trim());
        int totalcount = itemCountMap[item] ?? 1;
        totalPrice = price * totalcount;


      }
      return totalPrice;
    }


  }
