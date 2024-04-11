import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({super.key});

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
