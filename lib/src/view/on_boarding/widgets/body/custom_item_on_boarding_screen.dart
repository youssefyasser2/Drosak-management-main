import 'package:drosak/src/core/resources/colors_manager.dart';
import 'package:drosak/src/model/on_boarding/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomItemOnBoardingScreen extends StatelessWidget {
  const CustomItemOnBoardingScreen({
    super.key,
    required this.onBoardingModel,
  });

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, 
          children: [
            // SVG Image
            SvgPicture.asset(
              onBoardingModel.image, 
              height: 200, 
            ),

            // Add some space between the image and the text
            const SizedBox(height: 50), 

            // Text
            Text(
              onBoardingModel.text, 
              textAlign: TextAlign.center, 
              style: const TextStyle(
                fontFamily: 'AA-GALAXY',
                fontSize: 20,
                letterSpacing: -0.2,
                color: ColorManager.kBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
