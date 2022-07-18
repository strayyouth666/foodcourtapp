import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodcourtapp/controller/authBinding.dart';
// import 'package:foodcourtapp/controller/authController.dart';
import 'package:foodcourtapp/pages/beranda/on_boarding_screen.dart';
import 'package:foodcourtapp/pages/beranda/loginpage.dart';
// import 'package:foodcourtapp/pages/beranda/loginpage.dart';
// import 'package:foodcourtapp/pages/home/HomePage.dart';
import 'package:foodcourtapp/routes/app_page.dart';
import 'package:foodcourtapp/services/AuthProvider.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'pages/beranda/main_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await firebaseInitialization.then((value) {
    // Get.put(AuthController()
    // );
  }

    //AuthController controller = Get.find<AuthController>();
  );
  
  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: AppPage.INITIAL,
    getPages: AppPage.route,
    initialBinding: AuthBinding(),
    // home: Root(),
    home : MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        ),
      ],
      child: MyApp(),)
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey
      ),
       initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id:(context)=>const SplashScreen(),
        MainScreen.id:(context)=> MainScreen(),
        OnBoardingScreen.id:(context)=> const OnBoardingScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id ='splash-screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final store = GetStorage();
  @override
  void initState(){
    Timer(
      const Duration(
        seconds: 2,
      ),
            ()
            // () => Get.to(SplashScreen())
      {
      FirebaseAuth.instance.authStateChanges().listen((User? user)
      {
        if (user == null) {
          Get.to(LoginPage());
        } else {
          Get.to(OnBoardingScreen());
          // or MainScreen;
        }
      }

      );
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset('name'),
            Text('Food Court App', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),),
          ],
        ),
      ),
    );
  }
}
