import 'package:flutter/widgets.dart';

///
/// Extensions for [BuildContext] class
///
extension BuildContextExtension on BuildContext {
  ///
  /// Get [MediaQueryData] from current context
  ///
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ///
  /// Get [Size] from current context
  ///
  Size get kSize => MediaQuery.of(this).size;

  ///
  /// Get current screen width, based on current context
  ///
  double get screenWidth => mediaQuery.size.width;

  ///
  /// Get current screen height, based on current context
  ///
  double get screenHeight => mediaQuery.size.height;

  ///
  /// Get a fraction of the total available width.
  /// [widthFactor] must be greater than 0.0.
  ///
  double fractionallyScreenWidth(double widthFactor) {
    assert(widthFactor > 0.0);
    return screenWidth * widthFactor;
  }

  ///
  /// Get a fraction of the total available height.
  /// [heightFactor] must be greater than 0.0.
  ///
  double fractionallyScreenHeight(double heightFactor) {
    assert(heightFactor > 0.0);
    return screenHeight * heightFactor;
  }
}
