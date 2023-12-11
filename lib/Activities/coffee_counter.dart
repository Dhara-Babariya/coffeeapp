import '../Model/item_model.dart';
import 'Home_Screen.dart';

class CoffeeCounter {
  static final CoffeeCounter _singleton = CoffeeCounter._internal();
  factory CoffeeCounter() {
    return _singleton;
  }

  late Map<ItemDetail, int> itemCountMap = countItems(itemdetaillist);
  double total = 0.000;

  CoffeeCounter._internal();

  int _coffeeCount = 1;

  int get coffeeCount => _coffeeCount;

  void incrementCoffee() {
    _coffeeCount++;

  }

  void decrementCoffee() {
    if (_coffeeCount > 1) {
      _coffeeCount--;
    }
  }


  Map<ItemDetail, int> countItems(List<ItemDetail> list) {
      Map<ItemDetail, int> itemCountMap = {};

      for (var item in list) {
        if (itemCountMap.containsKey(item)) {
          print(item);
          itemCountMap[item] = itemCountMap[item]! + 1;
        } else {
          itemCountMap[item] = 1;
        }
      }

      return itemCountMap;
    }

    countitem() {
      itemCountMap.forEach((item, count) {
        // itemdetaillist.add(item);
        print('$item - Count: $count');
        // print(' $count+++++++++++++++++++++++++++++++++++++++++++++++++++');
      });
    }
  void updateTotalPrice() {
    double newTotal = 0.0;
    for (var item in itemCountMap.keys) {
      double itemPrice = double.parse(item.price.replaceAll('Rp.', '').trim());
      int count = itemCountMap[item] ?? -1;
      newTotal += itemPrice * count;
    }
      total = newTotal;
  }

}

