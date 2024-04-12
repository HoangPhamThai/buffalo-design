import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class SeeMoreLessViewPage extends StatefulWidget {
  const SeeMoreLessViewPage({super.key});

  @override
  State<SeeMoreLessViewPage> createState() => _SeeMoreLessViewPageState();
}

class _SeeMoreLessViewPageState extends State<SeeMoreLessViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
              BFSeeMoreView(
                initHeight: 200,
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: 100,
                      width: 200,
                      child: Text("1"),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 100,
                      width: 200,
                      child: Text("2"),
                    ),
                    Container(
                      color: Colors.green,
                      height: 100,
                      width: 200,
                      child: Text("3"),
                    ),
                  ],
                ),
                seeMoreLabel: "More",
                seeLessLabel: "Less",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
