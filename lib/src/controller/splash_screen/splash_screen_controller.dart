// splash_screen_controller.dart
import 'dart:async';
import 'package:flutter/material.dart';

class SplashController {
  late AnimationController animationController;
  late Animation<Offset> topImageAnimation;
  late Animation<Offset> bottomImageAnimation; 
  late Timer timer;

  void initializeAnimation(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    topImageAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));

    bottomImageAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));

    animationController.forward();
  }

  void startNavigationTimer(BuildContext context, String routeName) {
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, routeName);
    });
  }

  void dispose() {
    timer.cancel();
    animationController.dispose();
  }
}
