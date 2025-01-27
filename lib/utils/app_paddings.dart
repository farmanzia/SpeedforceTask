import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppSizes {
  static double get small => _getResponsiveSize(8.0);
  static double get medium => _getResponsiveSize(16.0);

  static double get large => _getResponsiveSize(24.0);
  static double get extraLarge => _getResponsiveSize(32.0);
  static double get eELarge => _getResponsiveSize(32.0);


  // Helper method to calculate responsive size
  static double _getResponsiveSize(double baseSize) {
    double screenWidth = Get.mediaQuery.size.width;
    return baseSize * (screenWidth / 428.0); // Assuming 375 is the base width
  }


  double responsiveFontSize(BuildContext context, double figmaFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 428.0; // Reference width from Figma (iPhone 12/13)
    return figmaFontSize * (screenWidth / baseWidth);
  }
  double boxSize(BuildContext context, double figmaSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 428.0; // Reference width from Figma
    return figmaSize * (screenWidth / baseWidth);
  }
}

