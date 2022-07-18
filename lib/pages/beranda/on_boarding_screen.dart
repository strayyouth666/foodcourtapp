import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodcourtapp/pages/beranda/loginpage.dart';
// import 'package:foodcourtapp/routes/app_page.dart';
// import 'package:foodcourtapp/welcome_screen.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String id ='onBoarding-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  double scrollerPosition = 0;
  final store = GetStorage();

  onButtonPressed(context){
    // store.write('onBoarding',true);
    // return
      // Navigator.pushReplacementNamed(context, MainScreen.id);
    // Get.to(MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (val){
              setState(() {
                scrollerPosition = val.toDouble();
              });

            },
            children: [
              OnBoardPage(
                  boardColumn: Column(
                    mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Welcome to \nFoodCourtKu!',
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.blueGrey,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(height: 10,),
                        const Text(''
                            '+100 Products\n+10 Categories\n+20 Brands',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.cyan,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38,0,0,0),
                          child: SizedBox(
                            height: 350,
                            width: 350,
                            child: Image.asset('lib/pict/ob1.png'),
                          ),
                        )
                      ],
                  ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Explore Every Food \nFrom All Over the World!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 27,
                      ),
                    ),
                    SizedBox(height: 10,),
                    const Text(''
                        '*p.s all foodies loves this',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.pinkAccent,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(38,0,0,0),
                      child: SizedBox(
                        height: 350,
                        width: 350,
                        child: Image.asset('lib/pict/ob2.png'),
                      ),
                    )
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('More Fun with Friends',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.pinkAccent,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 10,),
                    const Text(''
                        '*also family and partner too ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80,0,0,0),
                      child: SizedBox(
                        height: 350,
                        width: 350,
                        child: Image.asset('lib/pict/ob4.png'),
                      ),
                    )
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Makes Your Day!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.pink,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 10,),
                    const Text(''
                        'make sure your energy \nwill be fully charged.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.greenAccent,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50,0,0,0),
                      child: SizedBox(
                        height: 350,
                        width: 350,
                        child: Image.asset('lib/pict/ob3.png'),
                      ),
                    )
                  ],
                ),
              ),




            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DotsIndicator(
                    dotsCount: 4,
                    position: scrollerPosition,
                    decorator: const DotsDecorator(
                      activeColor: Colors.black,
                  ),),
                  scrollerPosition == 3 ? Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                      ),
                        child: const Text("Lets' Order!"),
                        onPressed: (){
                        Get.offAll(LoginPage());
                        },),) :
                          TextButton(
                            child: const Text('SKIP>>',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                          ),),
                          onPressed: (){},
                          ),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 80,
          //     decoration: BoxDecoration(
          //       color: Colors.transparent
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? boardColumn;
  const OnBoardPage({Key? key,this.boardColumn}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Center(child: boardColumn,),
        ),
      ],
    );
  }
}

