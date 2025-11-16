import 'package:flutter/material.dart';
import 'package:testcase/presentation/add_pages/view/add_pages.dart';
import 'package:testcase/presentation/detail_pages/argument/detail_pages_argument.dart';
import 'package:testcase/presentation/detail_pages/view/detail_pages.dart';
import 'package:testcase/presentation/list_pages/view/list_pages.dart';
import 'package:testcase/presentation/splash_page/view/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    final dynamic argument = settings?.arguments;

    switch (settings?.name ?? '') {
      case SplashPage.page:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case ListPages.page:
        return MaterialPageRoute(
          builder: (_) => const ListPages(),
        );

      case AddPages.page:
        return MaterialPageRoute(
          builder: (_) => const AddPages(),
        );

      case DetailPages.page:
        return MaterialPageRoute(
          builder: (_) => DetailPages(
            argument: argument ?? DetailPagesArgument(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
