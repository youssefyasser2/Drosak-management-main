import 'package:drosak/src/core/resources/routes_mananger.dart';
import 'package:drosak/src/view/main_screen/screen/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routesName});
  final String routesName;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        routes: RoutesManager.routes,
        initialRoute: routesName,
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
            fontFamily: 'AA-GALAXY'),
      ),
    );
  }
}
