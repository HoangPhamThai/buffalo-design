import 'package:buffalo_design/buffalo_design.dart';
import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
              BFButton(child: Text("Normal button")),
              BFButton(strokeOnly: true, child: Text("Button with white background")),
              BFButton(status: WidgetStatus.disable, child: Text("Disabled button")),
              BFButton(isLoading: true, child: Text("Button with loading indicator")),
              BFButton(isLoading: true, strokeOnly: true, child: Text("Stroke Button with loading indicator")),
              BFButton(
                child: Text("Custom button"),
                contentColor: Colors.yellow,
                borderRadius: 20,
                backgroundColor: Colors.blueAccent,
                borderColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
