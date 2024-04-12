import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class RowColPage extends StatefulWidget {
  const RowColPage({super.key});

  @override
  State<RowColPage> createState() => _RowColPageState();
}

class _RowColPageState extends State<RowColPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
              BFColumn(
                withDefaultDivider: true,
                spacing: 20,
                children: [
                  Text('abc'),
                  Text('abc'),
                  Text('abc'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      Text('abc'),
                    ],
                  )
                ],
              ),
              BFRow(
                withDefaultDivider: true,
                children: [
                  Container(
                    height: 30,
                    child: Text('abc'),
                  ),
                  Text('abc'),
                  Text('abc'),
                  Text('abc'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      Text('abc'),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
