import 'package:coffeeapp/Activities/cart_screen.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  final String itemName;

  const ItemPage({super.key, required this.itemName});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Expanded(
          child: Positioned(
            bottom: 300,
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
                padding:
                    const EdgeInsets.only(bottom: 180, right: 25, left: 25),
                child: Container(
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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(
                              'assets/images/starbuscks_mug.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 350,
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
              color: Color(0xffffffff),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 10,bottom: 20),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xff583732),
                              ),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 15,right:7),
                                      child: Icon(Icons.star,
                                      color: Color(0xffd9c61c),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 17,top: 5,bottom: 5),
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
                              child: Text('Rp.50.000',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Color(0xffd9c61c)
                              ),),
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
                              padding: const EdgeInsets.only(left: 10,top: 5),
                              child: Text('Creamy Latte',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: Color(0xff583732)
                                ),),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child:  Column(
                          children: [
                           Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                             children: [

                               Padding(
                                 padding: const EdgeInsets.only(right: 10),
                                 child: Material(
                                   type: MaterialType.transparency,
                                   child: Ink(
                                     decoration: BoxDecoration(
                                         border: Border.all(color: Color(0xff583732), width: 2.5),
                                         borderRadius: BorderRadius.circular(50)), //<-- SEE HERE
                                     child: InkWell(
                                       borderRadius: BorderRadius.circular(100.0),
                                       onTap: () {},
                                       child: Icon(
                                         Icons.remove,
                                         size: 22,
                                         color: Color(0xff583732),
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               Text('1',
                               style: TextStyle(
                                 color: Color(0xff583732),
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 fontFamily: 'Poppins'
                               ),),
                               Padding(
                                 padding: const EdgeInsets.only(left: 10),
                                 child: Material(
                                   type: MaterialType.transparency,
                                   child: Ink(
                                     decoration: BoxDecoration(
                                         border: Border.all(color: Color(0xff583732), width: 2.5),
                                         borderRadius: BorderRadius.circular(50)), //<-- SEE HERE
                                     child: InkWell(
                                       borderRadius: BorderRadius.circular(100.0),
                                       onTap: () {},
                                       child: Icon(
                                         Icons.add,
                                         size: 22,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Creamy Latte dapat mengatur  tingkat kemanisan kopi sesuai selera',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Color(0xff583732)
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// InkWell(
// onTap: () {
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (context) => const CartPage()),
// (route) => false);
// },
// child: Container(
// height: 60,
// width: 230,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// color: Colors.white,
// ),
// child: const Align(
// alignment: Alignment.center,
// child: Text(
// 'Add To Cart',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontFamily: 'Poppins',
// color: Color(0xff583732),
// fontWeight: FontWeight.bold,
// fontSize: 20,
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ),