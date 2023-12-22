import 'dart:math';

import 'package:coffeeapp/Activities/cart_screen.dart';
import 'package:coffeeapp/Activities/getStarted.dart';
import 'package:coffeeapp/Activities/item_screen.dart';
import 'package:coffeeapp/Model/item_model.dart';
import 'package:coffeeapp/Model/itemdetail_model.dart';
import 'package:flutter/material.dart';

import 'coffee_counter.dart';

List<ItemDetail> itemdetaillist = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final CoffeeCounter coffeeCounter = CoffeeCounter();

  List images = [
    'assets/images/coffee_mug.png',
    'assets/images/Capucino.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/Capucino.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/Capucino.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/Capucino.png',
    'assets/images/starbuscks_mug.png',
  ];

  List name = [
    "All",
    "Capucino",
    "Expresso",
    "Latte",
    "All",
    "Capucino",
    "Expresso",
    "Latte",
    "All",
    "Capucino",
    "Expresso",
    "Latte",
  ];

  List<ItemDetail> itemdetails = [
    ItemDetail(
        image: 'assets/images/coffee_mug.png',
        name: 'Creamy Latte',
        price: 'Rp.40.000',
        id: 1),
    ItemDetail(
        image: 'assets/images/starbuscks_mug.png',
        name: 'Capucino Latte',
        price: 'Rp.50.000',
        id: 2),
    // ItemDetail(
    //     image: 'assets/images/coffee_mug.png',
    //     name: 'Creamy Latte',
    //     price: 'Rp.40.000',
    //     id: 3),
    // ItemDetail(
    //     image: 'assets/images/starbuscks_mug.png',
    //     name: 'Capucino Latte',
    //     price: 'Rp.50.000',
    //     id: 4),
    // ItemDetail(
    //     image: 'assets/images/coffee_mug.png',
    //     name: 'Creamy Latte',
    //     price: 'Rp.40.000',
    //     id: 5),
    // ItemDetail(
    //     image: 'assets/images/starbuscks_mug.png',
    //     name: 'Capucino Latte',
    //     price: 'Rp.50.000',
    //     id: 6),
    // ItemDetail(
    //     image: 'assets/images/coffee_mug.png',
    //     name: 'Creamy Latte',
    //     price: 'Rp.40.000',
    //     id: 7),
    // ItemDetail(
    //     image: 'assets/images/starbuscks_mug.png',
    //     name: 'Capucino Latte',
    //     price: 'Rp.50.000',
    //     id: 8),
    // ItemDetail(
    //     image: 'assets/images/coffee_mug.png',
    //     name: 'Creamy Latte',
    //     price: 'Rp.40.000',
    //     id: 9),
    // ItemDetail(
    //     image: 'assets/images/starbuscks_mug.png',
    //     name: 'Capucino Latte',
    //     price: 'Rp.50.000',
    //     id: 10),
    // ItemDetail(
    //     image: 'assets/images/coffee_mug.png',
    //     name: 'Creamy Latte',
    //     price: 'Rp.40.000',
    //     id: 11),
    // ItemDetail(
    //     id: 12,
    //     image: 'assets/images/starbuscks_mug.png',
    //     name: 'Capucino Latte',
    //     price: 'Rp.50.000'),
  ];


  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  void addItems(int index) {
    setState(() {
      ItemDetail selectedProduct = itemdetails[index];

      itemdetaillist.add(selectedProduct);
      //
      print(
          '${itemdetaillist.length}********************************************************');
    });
  }

  Icon _searchIcon = const Icon(
    Icons.search,
  );
  bool isSearchClicked = false;
  final TextEditingController _filter = new TextEditingController();

  List<String> itemList = [];

  @override
  void initState() {
    for (int count = 0; count < 50; count++) {
      itemList.add("Item $count");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: WhatsappAppbar(MediaQuery.of(context).size.width),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 140,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 10,
                                            right: 10,
                                            bottom: 10),
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: index % 12 == 0
                                                  ? const Color(0xff583732)
                                                  : const Color(0xffd9d9d9),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Center(
                                              child: Image.asset(
                                                images[index],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          name[index],
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xff583732),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Text(
                                    'Promotion',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xff583732),
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: <Widget>[
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: const LinearGradient(
                                            begin: Alignment(0.0, -2),
                                            end: Alignment(-1, 7),
                                            colors: [
                                              Color(0xff8a7370),
                                              Color(0xffad9d9b),
                                              Color(0xffad9d9b),
                                              Color(0xffad9d9b),
                                              Color(0xffad9d9b),
                                              Color(0xffad9d9b),
                                            ],
                                            transform: GradientRotation(-1),
                                          ),
                                        ),
                                      ), //Container
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, left: 10, right: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: RichText(
                                            text: const TextSpan(
                                              text: " Today's Offer",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Color(0xffffffff),
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\n Free Bottle Of Coffee Latte',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        height: 2.3)),
                                                TextSpan(
                                                    text:
                                                        '\n On All Orders Above Rp.200.000 ',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        height: 1.5)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: -60,
                                        right: 5,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 160,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/starbuscks_mug.png'),
                                          )),
                                        ),
                                      ), //Container
                                    ], //<Widget>[]
                                  ),
                                ),
                              ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Popular',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff583732),
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10,),
                                child: GridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    shrinkWrap: true,
                                    children: List.generate(itemdetails.length,
                                        (index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                ItemPage(
                                                                  product:
                                                                      ItemDetail(
                                                                    image: itemdetails[
                                                                            index]
                                                                        .image,
                                                                    name: itemdetails[
                                                                            index]
                                                                        .name,
                                                                    price: itemdetails[
                                                                            index]
                                                                        .price,
                                                                    id: itemdetails[
                                                                            index]
                                                                        .id,
                                                                  ),
                                                                )));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Color(0xfff3f1f1),
                                                        Color(0xffeeebea),
                                                        Color(0xffeeebea),
                                                        Color(0xffe3dddc),
                                                        Color(0xffe3dddc),
                                                        Color(0xffe3dddc),
                                                      ],
                                                      transform:
                                                          GradientRotation(4),
                                                      begin:
                                                          Alignment.bottomRight,
                                                      end: Alignment.bottomLeft,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10,
                                                              top: 15),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                            itemdetails[index]
                                                                .image,
                                                            height: 90,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 12,
                                                                right: 5),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  itemdetails[
                                                                  index]
                                                                      .name,
                                                                  style:
                                                                  const TextStyle(
                                                                    fontFamily:
                                                                    'Poppins',
                                                                    color: Color(
                                                                        0xff583732),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  itemdetails[
                                                                          index]
                                                                      .price,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color(
                                                                        0xffd9c61c),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Padding(
                                                              padding: const EdgeInsets.all(10),
                                                              child: Material(
                                                                type: MaterialType
                                                                    .transparency,
                                                                child: Ink(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                    ),
                                                                    color: const Color(
                                                                        0xff531607),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    //borderRadius: BorderRadius.circular(100.0),
                                                                    onTap:
                                                                        () {
                                                                          addItems(index);
                                                                       },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .add,
                                                                      size:
                                                                          30,
                                                                      color: Color(
                                                                          0xffe0dad9),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    })),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhatsappAppbar extends SliverPersistentHeaderDelegate {
  double screenWidth;
  Tween<double>? profilePicTranslateTween;

  WhatsappAppbar(this.screenWidth) {
    profilePicTranslateTween =
        Tween<double>(begin: screenWidth / 2 - 100 - 100 + 25, end: 100.0);
  }

  static final appBarColorTween =
      ColorTween(begin: Colors.white, end: Colors.white);

  static final appbarIconColorTween =
      ColorTween(begin: Colors.grey[800], end: Colors.white);

  static final phoneNumberTranslateTween = Tween<double>(begin: 20.0, end: 0.0);

  static final phoneNumberFontSizeTween = Tween<double>(begin: 20.0, end: 16.0);

  static final profileImageRadiusTween = Tween<double>(begin: 2.5, end: 1.0);

  static final sizeTween = Tween<double>(begin: 350, end: 60);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final relativeScroll = min(shrinkOffset, 45) / 45;
    final relativeScroll70px = min(shrinkOffset, 70) / 70;

    print("shrinkOffset $shrinkOffset");

    return Container(
      color: appBarColorTween.transform(relativeScroll),
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff583732),
                    fontSize: 30,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 57,
                  width: 57,
                ),
              ),
              Positioned(
                  bottom: 2,
                  left: profilePicTranslateTween!.transform(relativeScroll70px),
                  child: displayProfilePicture(relativeScroll70px)),
            ],
          ),
        ],
      ),
    );
  }

  Widget displayProfilePicture(double relativeFullScrollOffset) {
    if (relativeFullScrollOffset == 1) {
      return Padding(
        padding: const EdgeInsets.only(left: 5, right: 7, top: 25),
        child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: Color(0xffaca4a4)
            ),
            child: IconButton(
              onPressed: () {},
              icon:
                  const Icon(Icons.search, size: 25, color: Color(0xff4b2826)),
            )),
      );
    }

    print(180 * (1 - relativeFullScrollOffset));

    return Padding(
      padding: EdgeInsets.only(top: 25 + ((1 - relativeFullScrollOffset) * 40)),
      child: Container(
        height: 50,
        width: sizeTween.transform(relativeFullScrollOffset),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xffefeeee)),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(Icons.search, size: 25, color: Color(0xffaca4a4)),
            ),
            if (relativeFullScrollOffset < 0.8)
              const Expanded(
                child: TextField(
                  cursorColor: Colors.brown,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Color(0xffaca4a4),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 125;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(WhatsappAppbar oldDelegate) {
    return true;
  }
}
