import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class SeeMoreLessPage extends StatefulWidget {
  const SeeMoreLessPage({super.key});

  @override
  State<SeeMoreLessPage> createState() => _SeeMoreLessPageState();
}

class _SeeMoreLessPageState extends State<SeeMoreLessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
              BFSeeMoreText(
                content: "A short sentence",
                labelSeeLess: "See less",
                labelSeeMore: "See more",
              ),
              BFSeeMoreText(
                content: "this is a long sentence that I think its total characters exceeds 50 characters",
                labelSeeLess: "See less",
                labelSeeMore: "See more",
              ),
              BFSeeMoreText(
                content: "this is a long sentence that I think its total characters exceeds 50 characters",
                labelSeeLess: "See less",
                labelSeeMore: "See more",
              ),
              BFSeeMoreText(
                content: "this is a very long sentence that I think its total characters exceeds 100 characters, or I must write more to get that.",
                labelSeeLess: "See less",
                labelSeeMore: "See more",
                minLength: 100,
                contentStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.lightBlue,
                ),
                moreLessStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
