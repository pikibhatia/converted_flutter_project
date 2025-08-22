
import 'package:flutter/material.dart';

class Responsive {
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1200;
  
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileMaxWidth;
  }
  
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileMaxWidth && width < tabletMaxWidth;
  }
  
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletMaxWidth;
  }
  
  static double getResponsiveValue(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }
  
  static int getResponsiveInt(
    BuildContext context, {
    required int mobile,
    int? tablet,
    int? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }
  
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 20);
    } else {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
    }
  }
  
  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return getResponsiveValue(
      context,
      mobile: mobile,
      tablet: tablet ?? mobile * 1.1,
      desktop: desktop ?? mobile * 1.2,
    );
  }
  
  static Widget responsiveWidget({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
    required BuildContext context,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Responsive.tabletMaxWidth && desktop != null) {
          return desktop!;
        } else if (constraints.maxWidth >= Responsive.mobileMaxWidth && tablet != null) {
          return tablet!;
        } else {
          return mobile;
        }
      },
    );
  }
}

// Animation utilities for smooth transitions
class ResponsiveAnimations {
  static Duration get shortDuration => const Duration(milliseconds: 200);
  static Duration get mediumDuration => const Duration(milliseconds: 300);
  static Duration get longDuration => const Duration(milliseconds: 500);
  
  static Curve get defaultCurve => Curves.easeInOut;
  static Curve get bounceCurve => Curves.elasticOut;
  static Curve get slideCurve => Curves.easeOutCubic;
}
