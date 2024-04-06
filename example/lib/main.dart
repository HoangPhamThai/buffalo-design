import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:buffalo_design_example/page.dart';
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
  late final BFAnimatedExpansionController expansionController;
  @override
  void initState() {
    super.initState();
    expansionController = BFAnimatedExpansionController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BFButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageScreen()));
                    },
                    child: Text("Navigate to responsive layout"),
                  ),
                  BFButton(
                    onPressed: () {
                      BFDialog.loading(context: context);
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.of(context).pop();
                      });
                    },
                    needBorder: true,
                    strokeOnly: false,
                    borderWidth: 3,
                    borderColor: Colors.blue,
                    contentColor: Colors.blue,
                    isLoading: true,
                    child: Text("Run "),
                  ),
                  BFDivider(
                    child: Text('Title'),
                    orientation: Position.right,
                  ),
                  BFSeeMoreText(content: "this is a long content that I think its total characters exceeds 50 characters", labelSeeLess: "less", labelSeeMore: "more"),
                  BFDateRangeInput(
                    fromDateLabel: "Tu ngay",
                    toDateLabel: "Den ngay",
                    // strokeOnly: true,
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    strokeColor: Colors.grey.withOpacity(0.2),
                    endDate: DateTime.now().add(
                      const Duration(days: 90),
                    ),
                  ),
                  BFChip.success(
                    label: "In A Long Progress",
                  ),
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
                  BFAnimatedExpansion(
                    controller: expansionController,
                    child: Container(
                      child: Text("hahahaha"),
                    ),
                  ),
                  BFButton(
                    child: Text("Show"),
                    onPressed: () {
                      print(expansionController.isExpand);
                      expansionController.isExpand ? expansionController.collapse() : expansionController.expand();
                    },
                  ),
                  BFTimeLine(
                    currentPosition: 3,
                    items: [
                      TimeLineEntity(description: "20-02-2034 20-02-2034", title: 'Create booking booking'),
                      TimeLineEntity(description: "20-02-2034", title: 'Create booking for someone'),
                      TimeLineEntity(
                          title: 'Create booking',
                          customDescription: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.grey,
                            child: const Text('20-02-2034 20-02-2034'),
                          )),
                      TimeLineEntity(description: "20-02-2034", title: 'Create booking'),
                      TimeLineEntity(description: "20-02-2034", title: 'Create booking'),
                      TimeLineEntity(description: "20-02-2034", title: 'Create booking'),
                    ],
                    displayMode: DisplayMode.opposite,
                    lineLength: 50,
                    direction: Axis.vertical,
                  ),
                  BFBounceAnimation(
                    child: BFZoomAnimation(
                      status: WidgetStatus.enable,
                      zoomFactor: 2,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Bounce',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BFInputTextField(
                    label: "abc",
                    required: true,
                  ),
                  BFColumn(withDefaultDivider: true, spacing: 20, children: [
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
                  ]),
                  BFRow(withDefaultDivider: true, children: [
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
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}
