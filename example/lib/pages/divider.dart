import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class DividerPage extends StatefulWidget {
  const DividerPage({super.key});

  @override
  State<DividerPage> createState() => _DividerPageState();
}

class _DividerPageState extends State<DividerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
              BFDivider(),
              BFDivider(
                child: Text('Label with default spacing of 50 to the left'),
                orientation: Position.left,
              ),
              BFDivider(
                child: Text('Label with the spacing of 100 to the left'),
                orientation: Position.left,
                spaceToBorder: 100,
              ),
              BFDivider(
                child: Text('Middle'),
                orientation: Position.middle,
              ),
              BFDivider(
                child: Text('Right'),
                orientation: Position.right,
              ),
              BFDivider(
                child: Padding(padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10), child: Text('Left with green lines and padding')),
                orientation: Position.left,
                color: Colors.green,
              ),
              BFDivider(
                child: Text('Middle with green line and some indent'),
                orientation: Position.middle,
                color: Colors.green,
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
