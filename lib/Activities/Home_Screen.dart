import 'package:coffeeapp/Activities/item_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  List imageList = [
    'assets/images/coffee_mug.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/starbuscks_mug.png',
    'assets/images/coffee_mug.png',
    'assets/images/starbuscks_mug.png'
  ];

  List nameList = [
    'Creamy Latte','Capucino Latte',
    'Creamy Latte','Capucino Latte',
    'Creamy Latte','Capucino Latte',
    'Creamy Latte','Capucino Latte',
    'Creamy Latte','Capucino Latte',
    'Creamy Latte','Capucino Latte',
  ];

  List priceList = [
    'Rp.40.000','Rp.50.000',
    'Rp.40.000','Rp.50.000',
    'Rp.40.000','Rp.50.000',
    'Rp.40.000','Rp.50.000',
    'Rp.40.000','Rp.50.000',
    'Rp.40.000','Rp.50.000'
  ];

  List<Color> _alreadyUsedColors = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Menu',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xff583732),
            fontSize: 30,
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/profile.png',
            height: 100,
            width: 100,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: TextField(
                      cursorColor: Colors.brown,
                      style:
                          const TextStyle(fontSize: 25, color: Color(0xff583732)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffefeeee),
                        hintText: 'Search...',
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xffaca4a4),
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(
                              left: 12, bottom: 10, top: 12, right: 5),
                          child: Icon(Icons.search,
                              size: 40, color: Color(0xffaca4a4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                                  top: 20, left: 10, right: 10, bottom: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: index % 12 == 0 ? Color(0xff583732) : Color(0xffd9d9d9),
                                    borderRadius: BorderRadius.circular(20)),
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
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
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
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
                          padding:
                              const EdgeInsets.only(top: 30, left: 10, right: 10),
                          child: Container(
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
                                        text: '\n Free Bottle Of Coffee Latte',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            height: 2.3)),
                                    TextSpan(
                                        text:
                                            '\n On All Orders Above Rp.200.000 ',
                                        style:
                                            TextStyle(fontSize: 15, height: 1.5)),
                                  ],
                                ),
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
                              image:
                                  AssetImage('assets/images/starbuscks_mug.png'),
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
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: List.generate(12, (index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                  onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemPage(itemName: imageList[index]),
                                  ),
                              );
                            }, child: Container(
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xfff3f1f1),
                                            Color(0xffeeebea),
                                            Color(0xffeeebea),
                                            Color(0xffe3dddc),
                                            Color(0xffe3dddc),
                                            Color(0xffe3dddc),
                                          ],
                                          transform: GradientRotation(4),
                                          begin: Alignment.bottomRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 12,top: 15),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                imageList[index],
                                                height: 90,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    nameList[index],
                                                    style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xff583732),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 7 ,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 15,right: 15),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      priceList[index],
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.bold
                                                        ,
                                                        color: Color(0xffd9c61c),
                                                      ),),
                                                    const Spacer(),
                                                    Material(
                                                      type: MaterialType.transparency,
                                                      child: Ink(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 0),
                                                          color: Color(0xff531607),
                                                        ),
                                                        child: InkWell(
                                                          //borderRadius: BorderRadius.circular(100.0),
                                                          onTap: () {},
                                                          child: Icon(
                                                            Icons.add,
                                                            size: 18,
                                                            color: Color(0xffe0dad9),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
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
      ),
    );
  }
}
