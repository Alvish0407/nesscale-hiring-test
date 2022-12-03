// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const UNKNOW_404 = _Paths.UNKNOWN_404;

  static const SPLASH = _Paths.SPLASH;
  static const SIGNIN = _Paths.SIGNIN;
  static const HOME = _Paths.HOME;

  static const ADD_CUSTOMER = HOME + _Paths.ADD_CUSTOMER;
  static const ADD_ITEM = HOME + _Paths.ADD_ITEM;
  static const ADD_INVOICE = HOME + _Paths.ADD_INVOICE;
}

// !co == clerk-officer
// !c == citizen

abstract class _Paths {
  static const UNKNOWN_404 = '/404';
  static const SPLASH = '/splash';
  static const SIGNIN = '/sign-in';

  static const HOME = '/home';
  static const ADD_CUSTOMER = '/add-customer';
  static const ADD_ITEM = '/add-item';
  static const ADD_INVOICE = '/add-invoice';
}
