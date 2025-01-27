import 'package:drosak/src/core/resources/const_values.dart';
import 'package:drosak/src/core/resources/routes_mananger.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart'; // Ensure you have rxdart in your pubspec.yaml

class OnBoardingController {
  final PageController pageControllerOnBoardingScreen = PageController();
  final BehaviorSubject<int> _currentPage = BehaviorSubject<int>.seeded(0);

  Stream<int> get outPutDotIndicator => _currentPage.stream;

  OnBoardingController() {
    // Listen to page changes
    pageControllerOnBoardingScreen.addListener(() {
      final page = pageControllerOnBoardingScreen.page?.round() ?? 0;
      _currentPage.add(page);
    });
  }

  void updatePageIndex(int index) {
    _currentPage.add(index); // Update the page index
  }

  void goNext(BuildContext context) {
    if (_currentPage.value < ConstListValues.listOnBoardingModel.length - 1) {
      // Go to the next page
      pageControllerOnBoardingScreen.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // If on the last page, navigate to Home
      Navigator.pushReplacementNamed(context, RoutesName.kRegisterScreenRoute);
    }
  }

  void skip(BuildContext context) {
    // Navigate to the next screen (e.g., HomeScreen)
    Navigator.pushReplacementNamed(context, RoutesName.kRegisterScreenRoute);
  }

  void dispose() {
    pageControllerOnBoardingScreen.dispose();
    _currentPage.close();
  }
}
