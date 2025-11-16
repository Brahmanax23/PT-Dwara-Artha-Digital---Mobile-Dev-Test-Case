import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NavigatorService {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateToWithArgmnt(String routeName, dynamic obj) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: obj);
  }

  Future<dynamic> navigateReplaceTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  BuildContext? getCurrentContext() {
    return navigatorKey.currentContext;
  }

  void goBack({value}) {
    return navigatorKey.currentState!.pop(value);
  }

  Future<dynamic> offAllNamed(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic> offAllNamedWithArgs(String routeName, dynamic arguments) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> goBackWithAwait<T>({value}) async {
    Completer<dynamic> completer = Completer<dynamic>();

    navigatorKey.currentState!.pop(value);

    Future.delayed(const Duration(milliseconds: 100), () {
      completer.complete(value);
    });

    return completer.future;
  }
}

class Navigate {
  static Future<dynamic> navigateTo(String routeName) {
    return GetIt.instance.get<NavigatorService>().navigateTo(routeName);
  }

  static BuildContext? getCurrentContext() {
    return GetIt.instance.get<NavigatorService>().getCurrentContext();
  }

  static T getInstance<T extends Object>() {
    return GetIt.instance.get<T>();
  }

  static Future<dynamic> navigateToWithArgmnt(String routeName, dynamic obj) {
    return GetIt.instance
        .get<NavigatorService>()
        .navigateToWithArgmnt(routeName, obj);
  }

  static Future<dynamic> navigateReplaceTo(String routeName) {
    return GetIt.instance.get<NavigatorService>().navigateReplaceTo(routeName);
  }

  static void goBack({value}) {
    return GetIt.instance.get<NavigatorService>().goBack(value: value);
  }

  static Future<dynamic> offAllNamed(String routeName) {
    return GetIt.instance.get<NavigatorService>().offAllNamed(routeName);
  }

  static Future<dynamic> offAllNamedWithArgs(
      String routeName, dynamic arguments) {
    return GetIt.instance
        .get<NavigatorService>()
        .offAllNamedWithArgs(routeName, arguments);
  }

  static Future<void> goBackWithAwait({value}) {
    return GetIt.instance.get<NavigatorService>().goBackWithAwait(value: value);
  }
}
