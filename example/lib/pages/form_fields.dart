import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class FormFieldsPage extends StatefulWidget {
  const FormFieldsPage({super.key});

  @override
  State<FormFieldsPage> createState() => _FormFieldsPageState();
}

class _FormFieldsPageState extends State<FormFieldsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BFColumn(
            spacing: 20,
            children: [
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
              BFInputTextField(
                label: "abc",
                required: true,
                name: 'abc',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
