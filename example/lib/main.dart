import 'package:buffalo_design/core/base_widgets/base_widget.dart';
import 'package:buffalo_design_example/pages/avatar.dart';
import 'package:buffalo_design_example/pages/button.dart';
import 'package:buffalo_design_example/pages/responsive.dart';
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
                  BFDialog.loading(context: context);
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.of(context).pop();
                  });
                },
                strokeOnly: false,
                borderWidth: 3,
                borderColor: Colors.blue,
                contentColor: Colors.blue,
                isLoading: true,
                child: Text("Run "),
              ),
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
              BFDateRangeInput(
                fromDateLabel: "Tu ngay",
                toDateLabel: "Den ngay",
                // strokeOnly: true,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                backgroundColor: Colors.grey.withOpacity(0.2),
                endDate: DateTime.now().add(
                  const Duration(days: 90),
                ),
              ),
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
                direction: Axis.horizontal,
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
        ));
  }
}
