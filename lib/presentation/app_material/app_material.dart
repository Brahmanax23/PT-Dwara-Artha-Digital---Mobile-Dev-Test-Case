import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:testcase/core/navigator/navigator_service.dart';
import 'package:testcase/core/route/route_generator.dart';
import 'package:testcase/presentation/splash_page/view/splash_page.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return MaterialApp(
            onGenerateRoute: (route) => RouteGenerator.generateRoute(route),
            debugShowCheckedModeBanner: false,
            navigatorKey: Navigate.getInstance<NavigatorService>().navigatorKey,
            initialRoute: SplashPage.page,
            theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                },
              ),
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.amber,
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                elevation: 0.0,
                centerTitle: true,
              ),
            ),
          );
        },
      );
    });
  }
}
