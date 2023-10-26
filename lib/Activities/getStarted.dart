import 'package:coffeeapp/Activities/botton_nav.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
        Container(
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
            padding: const EdgeInsets.only(bottom: 250),
            child: Center(
              child: ClipOval(
                child: Container(
                  height: 300,
                  width: 300,
                  color: Color(0xffffffff),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(
                                'assets/images/coffee_bean.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 250),
          child: Center(
            child: Text(
              'Enjoy  \n Your Coffee',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                  fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 130),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:  (context) => BottomNavPage()),
                        (route) => false
                    );},

                  child: Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),

                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xff583732),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
