import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class ChipPage extends StatefulWidget {
  const ChipPage({super.key});

  @override
  State<ChipPage> createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
              BFRow(children: [
                BFChip.success(
                  label: "Success",
                ),
                BFChip.warning(
                  label: "Warning",
                ),
                BFChip.disable(
                  label: "Disable",
                ),
                BFChip(
                  label: "Custom",
                  labelStyle: TextStyle(color: Colors.blue),
                  defaultPrefixColor: Colors.orange,
                  backgroundColor: Colors.yellow,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
