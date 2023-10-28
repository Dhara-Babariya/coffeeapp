import 'package:coffeeapp/Activities/Home_Screen.dart';
import 'package:coffeeapp/Activities/botton_nav.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List coffee = ['assets/images/coffee_mug.png',
    'assets/images/starbuscks_mug.png',];
  List name = ['Creamy Latte','Capucino Latte'];
  List price = ['Rp.40.000','Rp.50.000'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        '2 items in cart',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Color(0xff583732),
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
                  shrinkWrap: true,
                  itemCount: coffee.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                height : 120,
                                width : 120,
                                decoration: BoxDecoration(
                                    color: Color(0xffd9d9d9),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    coffee[index],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height : 120,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,

                                   children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:10),
                                        child: Text(name[index],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: Color(0xff583732),
                                        ),),
                                      ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 10,top: 7),
                                                child: Text( price[index],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xffd9c61c)
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Material(
                                                type: MaterialType.transparency,
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Color(0xff583732), width: 2),
                                                      borderRadius: BorderRadius.circular(50)), //<-- SEE HERE
                                                  child: InkWell(
                                                    borderRadius: BorderRadius.circular(100.0),
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 17,
                                                      color: Color(0xff583732),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text('1',
                                              style: TextStyle(
                                                  color: Color(0xff583732),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins'
                                              ),),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Material(
                                                type: MaterialType.transparency,
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Color(0xff583732), width: 2),
                                                      borderRadius: BorderRadius.circular(50)), //<-- SEE HERE
                                                  child: InkWell(
                                                    borderRadius: BorderRadius.circular(100.0),
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 17,
                                                      color: Color(0xff583732),
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
                            right : 0,
                            top : 10,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Ink(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xffeb3223), width: 2),
                                    borderRadius: BorderRadius.circular(50)), //<-- SEE HERE
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100.0),
                                  onTap: () {},
                                  child: Icon(
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Order Instruction',
                    style: TextStyle(
                      color: Color(0xff583732)
                    ),),
                  ),

                  TextFormField(
                    cursorColor: Color(0xff583732),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff583732),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff583732),
                          width: 1.5,
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
              child: Row(
                children: [
                  Text('Total : ',
                  style: TextStyle(
                    color: Color(0xff583732),
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  Spacer(),
                  Text('Rp.90.000',
                      style: TextStyle(
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
              padding: const EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 20),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xff583732),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
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
                TextButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context)=> BottomNavPage(),
                  ), (route) => false);
                }, child: Text('Back to Menu',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff6d504c),
                  fontFamily: 'Poppins'
                ),),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
