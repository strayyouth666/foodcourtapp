
// import 'package:foodcourtapp/pages/detail/ItemDetail.dart';
import 'package:foodcourtapp/pages/beranda/registerpage.dart';
// import 'package:foodcourtapp/pages/cart/cart_screen.dart';
// import 'package:foodcourtapp/pages/detail/ItemDetail.dart';
import 'package:foodcourtapp/pages/profile/profilepage.dart';
// import 'package:foodcourtapp/pages/scan/scanpage.dart';
import 'package:get/get.dart';
import '../pages/beranda/loginpage.dart';
import '../pages/home/HomePage.dart';

part 'app_route.dart';

class AppPage {
  AppPage._();
 // final ItemModel item;
  static const INITIAL = Route.HOMEPAGE;

  static final route = [
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterPageBinding(),
    ),
    // GetPage(
    //   name: _Paths.SCAN,
    //   page: () => ScanPage(),
    //   binding: ScanPageBinding(),
    // ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfilePage(),
      binding: ProfilePageBinding(),
    ),
    // GetPage(
    //   name: _Paths.CART,
    //   page: () => CartScreen(),
    //   binding: CartScreenBinding(),
    // ),
    // GetPage(
    //   name: _Paths.DETAIL,
    //   page: () => ItemDetail(),
    //   binding: ItemDetailBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SECURITYPIN,
    //   page: () => SecuritypinView(),
    //   binding: SecuritypinBinding(),
    // ),
  ];
}