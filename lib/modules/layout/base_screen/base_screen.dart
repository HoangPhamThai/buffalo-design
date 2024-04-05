import 'package:flutter/material.dart';

import '../mixin/responsive_layout_builder.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState createState() {
    return BaseScreenState();
  }
}

class BaseScreenState<T extends BaseScreen> extends State<BaseScreen> with ResponsiveLayoutBuilder {
  @override
  Widget build(BuildContext context) {
    return buildLayout(context);
  }

  @override
  Widget buildFullScreen() {
    // TODO: implement buildFullScreen
    throw UnimplementedError();
  }
}
