import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:buffalo_design_example/pages/animation.dart';
import 'package:buffalo_design_example/pages/avatar.dart';
import 'package:buffalo_design_example/pages/button.dart';
import 'package:buffalo_design_example/pages/chip.dart';
import 'package:buffalo_design_example/pages/divider.dart';
import 'package:buffalo_design_example/pages/expansion.dart';
import 'package:buffalo_design_example/pages/form_fields.dart';
import 'package:buffalo_design_example/pages/responsive.dart';
import 'package:buffalo_design_example/pages/row_col.dart';
import 'package:buffalo_design_example/pages/see_more_less.dart';
import 'package:buffalo_design_example/pages/see_more_less_view.dart';
import 'package:buffalo_design_example/pages/timeline.dart';
import 'package:flutter/material.dart';

import 'package:buffalo_design/buffalo_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(useMaterial3: true), home: MyHomeApp());
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: BFColumn(
            spacing: 20,
            children: [
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AvatarScreen()));
                },
                child: Text("Avatars"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResponsiveScreen()));
                },
                child: Text("Rresponsive layout"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ButtonPage()));
                },
                child: Text("Buttons"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DividerPage()));
                },
                child: Text("Divider"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChipPage()));
                },
                child: Text("Chip"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SeeMoreLessPage()));
                },
                child: Text("See more/less text"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SeeMoreLessViewPage()));
                },
                child: Text("See more/less view"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpansionPage()));
                },
                child: Text("Animated Expansion"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimeLinePage()));
                },
                child: Text("Timeline"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RowColPage()));
                },
                child: Text("Row and Column"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimationPage()));
                },
                child: Text("Animation"),
              ),
              BFButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormFieldsPage()));
                },
                child: Text("Form fields"),
              ),
            ],
          ),
        ));
  }
}
