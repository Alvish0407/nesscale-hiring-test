// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const UNKNOW_404 = _Paths.UNKNOWN_404;

  static const SPLASH = _Paths.SPLASH;
  static const SIGNIN = _Paths.SIGNIN;
  static const HOME = _Paths.HOME;
}

// !co == clerk-officer
// !c == citizen

abstract class _Paths {
  static const UNKNOWN_404 = '/404';
  static const SPLASH = '/splash';
  static const SIGNIN = '/sign-in';

  static const HOME = '/home';
}
