import 'package:coffeeapp/Activities/Home_Screen.dart';
import 'package:coffeeapp/Activities/botton_nav.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );
  late final AnimationController _name = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
              }
    });

    _name.forward();
    _name.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _name.dispose();
      }
    });
  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const double bigLogo = 100;

    return Scaffold(
      body: Container(
        color: const Color(0xffffffff),
        child: Column(
          children: [
            Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset('assets/images/mug.png',
                    height: 120,
                    width: 170,),
                  ),
                  Center(
                    child: Image.asset('assets/images/coffee_img.png',
                    ),
                  ),

               Center(
                 child: RichText(
                   text:
                   const TextSpan(
                     text: ' Find your favorite ',
                     style: TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 25,
                       color: Color(0xff131a2e),
                     ),
                     children: <TextSpan>[
                       TextSpan(text: '\n Coffee Taste!', style: TextStyle(
                         height: 1.5,
                         fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                       fontFamily: 'Poppins',
                       fontSize: 30,
                           color: Color(0xff131a2e),),
                       ),
                       TextSpan(text: ' \n We’re coffee shop, beer and wine bar, '
                           '\n & event space for performing arts',
                       style: TextStyle(
                         height: 1.5,
                         fontSize: 12
                       )),

                     ],
                   ),
                   textAlign: TextAlign.center,
                 ),
               ),
            ]),

            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size biggest = constraints.biggest;
                  return  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 50,
                            left: 0,
                            right: 0,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 60,right: 60),
                              child: Container(
                                height: 60,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff55433c),
                                ),

                              ),
                            ),
                          ),
                          PositionedTransition(
                            rect: RelativeRectTween(
                              begin: RelativeRect.fromSize(
                                Rect.fromLTWH(10, biggest.height - 155, biggest.width , 100),
                                biggest,
                              ),
                              end: RelativeRect.fromSize(
                                Rect.fromLTWH(-10, biggest.height - 155, biggest.width-20, 100),
                                biggest,
                              ),
                            ).animate(CurvedAnimation(
                              parent: _name,
                              curve: Curves.linear,
                              reverseCurve: Curves.linear,
                            )),
                            child: const Center(
                              child: Text(
                                'Get Started',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),

                          PositionedTransition(
                              rect: RelativeRectTween(
                                begin: RelativeRect.fromSize(
                                  Rect.fromLTWH(70, biggest.height - 155, bigLogo, bigLogo),
                                  biggest,
                                ),
                                end: RelativeRect.fromSize(
                                  Rect.fromLTWH(biggest.width - 165, biggest.height - 155, bigLogo, bigLogo),
                                  biggest,
                                ),
                              ).animate(CurvedAnimation(
                                parent: _controller,
                                curve: Curves.linear,
                                reverseCurve: Curves.linear,
                              )),

                              child: Material(
                                type: MaterialType.transparency,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: const Color(0xffa97c37),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100.0),
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute
                                        (builder: (context)=> const BottomNavPage()),
                                              (route) => false);
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      size: 25.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
