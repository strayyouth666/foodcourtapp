part of 'app_page.dart';


abstract class Route {
  Route._();

  static const HOMEPAGE = _Paths.HOMEPAGE;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const PROFILE = _Paths.PROFILE;
  static const SCAN = _Paths.SCAN;
  static const CART = _Paths.CART;
  static const DETAIL = _Paths.DETAIL;
  // static const SECURITYPIN = _Paths.SECURITYPIN;
}

abstract class _Paths {
  static const HOMEPAGE = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const SCAN = '/scan';
  static const PROFILE = '/profile';
  static const CART = '/cart';
  static const DETAIL = '/detail';
  // static const SECURITYPIN = '/securitypin';
}
