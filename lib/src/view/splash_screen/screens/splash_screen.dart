import 'package:drosak/src/controller/splash_screen/splash_screen_controller.dart';
import 'package:drosak/src/core/resources/assets_values_mananger.dart';
import 'package:drosak/src/core/resources/colors_manager.dart';
import 'package:drosak/src/core/resources/routes_mananger.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late SplashController _splashController;

  @override
  void initState() {
    super.initState();

    _splashController = SplashController();
    _splashController.initializeAnimation(this);
    _splashController.startNavigationTimer(context, RoutesName.kOnBoardingScreenRoute);
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBlackColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top-left border image with animation (comes down from above)
            SlideTransition(
              position: _splashController.topImageAnimation,
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  AssetsValuesManager.kSplashBorderImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Center logo (no animation)
            Center(
              child: Image.asset(
                AssetsValuesManager.kLogoImage,
                fit: BoxFit.contain,
              ),
            ),

            // Bottom-right border image with animation (comes up from below)
            SlideTransition(
              position: _splashController.bottomImageAnimation,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  AssetsValuesManager.kSplashBorderImageBottom,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}