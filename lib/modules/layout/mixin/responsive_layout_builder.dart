import 'package:buffalo_design/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';

mixin ResponsiveLayoutBuilder {
  Widget buildFullScreen();

  Widget buildSmallScreen() {
    return buildFullScreen();
  }

  Widget buildMobile() {
    return buildFullScreen();
  }

  Widget buildLayout(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > fullscreenWidth) {
        return buildFullScreen();
      }
      if (constraint.maxWidth > smallScreenWidth) {
        return buildSmallScreen();
      }
      return buildMobile();
    });
  }
}
