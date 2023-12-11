import 'package:coffeeapp/Activities/Home_Screen.dart';
import 'package:coffeeapp/Activities/botton_nav.dart';
import 'package:flutter/material.dart';

import '../Model/item_model.dart';
import 'coffee_counter.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key, });


  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<ItemDetail> cartitem = getUniqueItems(itemdetaillist);
  late Map<ItemDetail, int> itemCountMap = coffeeCounter.countItems(itemdetaillist);

  double total = 0.000;

  final CoffeeCounter coffeeCounter = CoffeeCounter();

  List<ItemDetail> getUniqueItems(List<ItemDetail> list) {
    Set<int> uniqueIds = <int>{};
    List<ItemDetail> uniqueList = [];

    for (var item in list) {
      if (!uniqueIds.contains(item.id)) {
        uniqueIds.add(item.id);
        uniqueList.add(item);
      }
      print('$uniqueList-----------------------------------------------');
    }
    return uniqueList;
  }

  @override
  void initState() {
    super.initState();
    print('cart screen open');
    getUniqueItems(itemdetaillist);
    updateTotalPrice();
  }

  dialog(int index) {
    setState(() {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Are You Sure !!"),
          content: const Text("You have delete this item in cart ?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("NO"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // itemdetaillist.remove();
                  updateTotalPrice();
                });
                Navigator.of(ctx).pop();
              },
              child: const Text("YES"),
            ),
          ],
        ),
      );
    });
  }

  void updateTotalPrice() {
    double newTotal = 0.0;
    for (var item in coffeeCounter.itemCountMap.keys) {
      double itemPrice = double.parse(item.price.replaceAll('Rp.', '').trim());
      int count = coffeeCounter.itemCountMap[item] ?? -1;
      newTotal += itemPrice * count;
    }
    setState(() {
      total = newTotal;
    });
  }

  void delete(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 15,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: cartitem.length.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xff583732),
            ),
            children: const <TextSpan>[
              TextSpan(
                text: ' items in cart',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff583732),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: cartitem.length,
                    itemBuilder: (context, index) {
                      final currentItem = cartitem[index];
                      final itemCount = coffeeCounter.itemCountMap[currentItem];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffd9d9d9),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.asset(
                                      cartitem[index].image,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            cartitem[index].name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: Color(0xff583732),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10, top: 7),
                                              child: Text(
                                                cartitem[index].price,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xffd9c61c)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xff583732),
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      onTap: () {
                                                        setState(() {
                                                          if (coffeeCounter
                                                              .itemCountMap
                                                              .containsKey(
                                                                  currentItem)) {
                                                            if (coffeeCounter
                                                                        .itemCountMap[
                                                                    currentItem]! >
                                                                1) {
                                                              coffeeCounter
                                                                      .itemCountMap[
                                                                  currentItem] = coffeeCounter
                                                                          .itemCountMap[
                                                                      currentItem]! -
                                                                  1;
                                                              updateTotalPrice();
                                                            } else {
                                                              dialog(index);
                                                            }
                                                          }
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        size: 17,
                                                        color:
                                                            Color(0xff583732),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                itemCount.toString(),
                                                style: const TextStyle(
                                                    color: Color(0xff583732),
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xff583732),
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      onTap: () {
                                                        setState(() {
                                                          if (coffeeCounter
                                                              .itemCountMap
                                                              .containsKey(
                                                                  currentItem)) {
                                                            itemdetaillist.add(
                                                                currentItem);
                                                            coffeeCounter
                                                                    .itemCountMap[
                                                                currentItem] = coffeeCounter
                                                                        .itemCountMap[
                                                                    currentItem]! +
                                                                1;
                                                          } else {
                                                            coffeeCounter
                                                                    .itemCountMap[
                                                                currentItem] = 1;
                                                            itemdetaillist.add(
                                                                currentItem);
                                                          }
                                                          coffeeCounter
                                                              .incrementCoffee();
                                                          updateTotalPrice();
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 17,
                                                        color:
                                                            Color(0xff583732),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 0,
                              top: 10,
                              child: Material(
                                type: MaterialType.transparency,
                                child: Ink(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffeb3223),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100.0),
                                    onTap: () {
                                      delete(index);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      size: 17,
                                      color: Color(0xffeb3223),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Order Instruction',
                      style: TextStyle(color: Color(0xff583732)),
                    ),
                  ),
                  TextFormField(
                      cursorColor: const Color(0xff583732),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xff583732),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xff583732),
                            width: 1.5,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Row(
                children: [
                  const Text(
                    'Total : ',
                    style: TextStyle(
                      color: Color(0xff583732),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Rp.$total',
                    style: const TextStyle(
                      color: Color(0xffd9c61c),
                      fontFamily: 'Poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 30, bottom: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      print(itemdetaillist.toString());
                      // print('${cartitem.length}==========================================');
                      },
                    child: Container(
                      width: 400,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xff583732),
                      ),
                      child: const Center(
                        child: Text(
                          'CheckOut',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavPage(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    'Back to Menu',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff6d504c),
                        fontFamily: 'Poppins'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
