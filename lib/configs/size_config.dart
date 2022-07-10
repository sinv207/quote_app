import 'package:flutter/material.dart';

///
/// SizeConfig: help scale widget size base on screen size
///
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

/// Get the proportionate height as per screen size
double scaleHeight(double inputHeight, {double factor = 1.0}) {
  try {
    // 896 is the layout height that designer use
    // or you can say iPhone 11
    double scaledHeight =
        (inputHeight / BaseScreenSize.height) * SizeConfig.screenHeight;
    return inputHeight + (scaledHeight - inputHeight) * factor;
  } catch (_) {
    return inputHeight;
  }
}

/// Get the proportionate width as per screen size
double scaleWidth(double inputWidth, {double factor = 1.0}) {
  try {
    // 414 is the layout width that designer use
    double scaledWidth =
        (inputWidth / BaseScreenSize.width) * SizeConfig.screenWidth;
    return inputWidth + (scaledWidth - inputWidth) * factor;
  } catch (_) {
    return inputWidth;
  }
}

///
/// Screen base design
///
class BaseScreenSize {
  BaseScreenSize._();
  static const double height = 896.0;
  static const double width = 414.0;
}
