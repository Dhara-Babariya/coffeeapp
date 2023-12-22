import 'package:coffeeapp/Activities/botton_nav.dart';
import 'package:flutter/material.dart';

class PositionedTransitionExample extends StatefulWidget {
  const PositionedTransitionExample({super.key});

  @override
  State<PositionedTransitionExample> createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: false);
  late final AnimationController _name = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: false);


  @override
  void initState() {
    super.initState();
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.dispose();
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
  void dispose() {
    _controller.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const double bigLogo = 100;
    
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size biggest = constraints.biggest;
          return  Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                        height: 60,
                        width: 230,
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
                        Rect.fromLTWH(30,400 , biggest.height - 300, 490,),
                        biggest,
                      ),
                      end: RelativeRect.fromSize(
                        Rect.fromLTWH(-20, biggest.height - 400, biggest.width, 490),
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
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                          Rect.fromLTWH(20, biggest.height - 205, bigLogo, bigLogo),
                          biggest,
                        ),
                        end: RelativeRect.fromSize(
                          Rect.fromLTWH(biggest.width - 125, biggest.height - 205, bigLogo, bigLogo),
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
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                  )
                  // PositionedTransition(
                  //   rect: RelativeRectTween(
                  //     begin: RelativeRect.fromSize(
                  //       Rect.fromLTWH(20, biggest.height - bigLogo, bigLogo, bigLogo),
                  //       biggest,
                  //     ),
                  //     end: RelativeRect.fromSize(
                  //       Rect.fromLTWH(biggest.width - 125, biggest.height - bigLogo, bigLogo, bigLogo),
                  //       biggest,
                  //     ),
                  //   ).animate(CurvedAnimation(
                  //     parent: _controller,
                  //     curve: Curves.linear,
                  //     reverseCurve: Curves.linear,
                  //   )),
                  //
                  //   child: Material(
                  //     type: MaterialType.transparency,
                  //     child: Ink(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(50),
                  //         color: Color(0xffa97c37),
                  //       ),
                  //       child: InkWell(
                  //         //borderRadius: BorderRadius.circular(100.0),
                  //         onTap: () {},
                  //         child: Icon(
                  //           Icons.arrow_forward,
                  //           size: 20.0,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   )
                  // ),


                ],
              ),
            ),
          );

        },
      ),
    );
  }
}
