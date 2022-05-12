import 'package:flutter/material.dart';
import 'package:foodcourtapp/pages/home/HomePage.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:foodcourtapp/widgets/routes.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(home: HomePage(),));
}

class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: HomePage(),
      // initialRoute: SplashScreen.routeName,
      //routes: routes,
    );
  }
}