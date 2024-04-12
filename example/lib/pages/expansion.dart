import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class ExpansionPage extends StatefulWidget {
  const ExpansionPage({super.key});

  @override
  State<ExpansionPage> createState() => _ExpansionPageState();
}

class _ExpansionPageState extends State<ExpansionPage> {
  late final BFAnimatedExpansionController expansionController;
  @override
  void initState() {
    super.initState();
    expansionController = BFAnimatedExpansionController();
  }

  @override
  void dispose() {
    expansionController.getNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
              BFAnimatedExpansion(
                controller: expansionController,
                child: Container(
                  child: Text("A hidden message"),
                ),
              ),
              BFButton(
                child: Text("Show"),
                onPressed: () {
                  print(expansionController.isExpand);
                  expansionController.isExpand ? expansionController.collapse() : expansionController.expand();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
