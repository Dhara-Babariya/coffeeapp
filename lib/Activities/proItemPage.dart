import 'package:coffeeapp/Activities/proHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/item_model.dart';
import '../Provider/favourite_provider.dart';
import 'Home_Screen.dart';

class ProviderItem extends StatefulWidget {
  final ItemDetail product;

  ProviderItem({required this.product});
  @override
  State<ProviderItem> createState() => _ProviderItemState();
}

class _ProviderItemState extends State<ProviderItem> {
  late List<ItemDetail> cartitem =
      context.read<FavouriteItem>().getUniqueItems(itemdetaillists);
  late Map<ItemDetail, int> itemCountMap =
      context.read<FavouriteItem>().countItems(itemdetaillists);
  late Map<ItemDetail, int> incrementItem =
      context.read<FavouriteItem>().countItems(itemdetaillists);

  List addOns = [
    'assets/images/sugar.png',
    'assets/images/keju.png',
    'assets/images/boba.png',
    'assets/images/sugar.png',
    'assets/images/keju.png',
    'assets/images/boba.png',
    'assets/images/sugar.png',
    'assets/images/keju.png',
    'assets/images/boba.png',
    'assets/images/sugar.png',
    'assets/images/keju.png',
    'assets/images/boba.png'
  ];

  // void dialog(int index) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: const Text("Are You Sure !!"),
  //       content: const Text("You want to delete this item from cart?"),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(ctx).pop();
  //           },
  //           child: const Text("NO"),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             // cartitem.remove(index);
  //             Navigator.of(ctx).pop();
  //             context.read<FavouriteItem>().removeItemFromCart(cartitem[index]);
  //             context.read<FavouriteItem>().updateTotalPrice();
  //
  //           },
  //           child: const Text("YES"),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    // var favouriteItem = Provider.of<FavouriteItem>(context);

    itemCountMap.forEach((item, count) {
      print('$item - Count: $count');
    });

    final currentItem = widget.product;
    final itemCount = itemCountMap[currentItem];
    // final totalitemprice = context.watch<FavouriteItem>().getTotalItemPrice( itemCount!);

    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff421e1e),
                  Color(0xff421e1e),
                  Color(0xff421e1e),
                  Color(0xff694a42),
                  Color(0xff775b4f),
                  Color(0xff8a7062),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          'assets/images/shadow.png',
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: 230,
                        width: 190,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(widget.product.image),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xffffffff),
              size: 20,
            ),
          ),
        ),
        Positioned(
          top: 350,
          bottom: 0,
          right: 0,
          left: 0,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
                color: Color(0xffffffff),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff583732),
                                ),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 7),
                                      child: Icon(
                                        Icons.star,
                                        color: Color(0xffd9c61c),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 17, top: 5, bottom: 5),
                                      child: Text(
                                        '4 . 5',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: context
                                            .read<FavouriteItem>()
                                            .getItemCount(currentItem) ==
                                        0

                                    // context.read<FavouriteItem>().getTotalItemPrice(currentItem) != null

                                    ? Visibility(
                                        visible: true,
                                        child: Text(
                                          '${widget.product.price}',
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffd9c61c),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        'Rp.${context.read<FavouriteItem>().getTotalItemPrice(currentItem)}',
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffd9c61c),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  '${widget.product.name}',
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xff583732)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: context
                                                  .read<FavouriteItem>()
                                                  .getItemCount(currentItem) ==
                                              0
                                          ? Visibility(
                                              visible: false,
                                              child: Icon(Icons.add))
                                          : Material(
                                              type: MaterialType.transparency,
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff583732),
                                                        width: 2.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                  onTap: () {
                                                      int currentCount = context
                                                          .read<FavouriteItem>()
                                                          .getItemCount(
                                                              currentItem);

                                                      if (currentCount == 1) {
                                                        showDialog(
                                                          context: context,
                                                          builder: (ctx) =>
                                                              AlertDialog(
                                                            title: const Text(
                                                                "Are You Sure !!"),
                                                            content: const Text(
                                                                "You want to delete this item from cart?"),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          ctx)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Text(
                                                                        "NO"),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          ctx)
                                                                      .pop();
                                                                  context
                                                                      .read<
                                                                          FavouriteItem>()
                                                                      .removeItemFromCart(
                                                                          currentItem);
                                                                  context
                                                                      .read<
                                                                          FavouriteItem>()
                                                                      .updateTotalPrice();
                                                                },
                                                                child:
                                                                    const Text(
                                                                        "YES"),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else {
                                                        context
                                                            .read<
                                                                FavouriteItem>()
                                                            .decrementItem(
                                                                currentItem);
                                                        context
                                                            .read<
                                                                FavouriteItem>()
                                                            .updateTotalPrice();
                                                      }

                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 25,
                                                    color: Color(0xff583732),
                                                  ),
                                                ),
                                              ),
                                            )),
                                  Text(
                                    '${context.watch<FavouriteItem>().getItemCount(currentItem)}',
                                    style: const TextStyle(
                                        color: Color(0xff583732),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xff583732),
                                                width: 2.5),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          onTap: () {
                                            if (context
                                                    .read<FavouriteItem>()
                                                    .getItemCount(
                                                        currentItem) ==
                                                0) {
                                              ItemDetail selectedProduct =
                                                  widget.product;
                                              context
                                                  .read<FavouriteItem>()
                                                  .addItems(selectedProduct);
                                            } else {
                                              context
                                                  .read<FavouriteItem>()
                                                  .addItems(currentItem);
                                            }
                                            context
                                                .read<FavouriteItem>()
                                                .updateTotalPrice();
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Color(0xff583732),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            'Creamy Latte dapat mengatur  tingkat kemanisan kopi sesuai selera',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: Color(0xffa89795)),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            'Add Ons',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff583732),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 140,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: addOns.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, right: 35),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffd9d9d9),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Image.asset(
                                                addOns[index],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -6,
                                            right: -3,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                color: Colors.brown,
                                              ),
                                              child: const Center(
                                                  child: Icon(
                                                Icons.add,
                                                color: Color(0xffffffff),
                                                size: 20,
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            ItemDetail selectedProduct = widget.product;
                            context
                                .read<FavouriteItem>()
                                .addItems(selectedProduct);
                            context.read<FavouriteItem>().updateTotalPrice();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color(0xff583732),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 15),
                                  child: Text(
                                    'Add To Cart',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
