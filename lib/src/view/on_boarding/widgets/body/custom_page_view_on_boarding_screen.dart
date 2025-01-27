import 'package:drosak/src/core/resources/const_values.dart';
import 'package:drosak/src/view/on_boarding/widgets/body/custom_item_on_boarding_screen.dart';
import 'package:flutter/material.dart';

class CustomPageViewOnBoardingScreen extends StatelessWidget {
  const CustomPageViewOnBoardingScreen({
    super.key,
    required this.controller,
    required this.onPageChanged, // Add this line
  });

  final PageController controller;
  final Function(int) onPageChanged; // Add this line

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: onPageChanged, // Add this line
      itemCount: ConstListValues.listOnBoardingModel.length,
      itemBuilder: (context, index) {
        return CustomItemOnBoardingScreen(
          onBoardingModel: ConstListValues.listOnBoardingModel[index],
        );
      },
    );
  }
}