import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class FormFieldsPage extends StatefulWidget {
  const FormFieldsPage({super.key});

  @override
  State<FormFieldsPage> createState() => _FormFieldsPageState();
}

class _FormFieldsPageState extends State<FormFieldsPage> {
  late final List<KeyValue> data;

  late final BFFormHandler formHandler;

  @override
  void initState() {
    super.initState();

    data = [
      KeyValue(key: "orange", value: "Orange"),
      KeyValue(key: "apple", value: "Apple"),
      KeyValue(key: "banana", value: "Banana"),
      KeyValue(key: "mango", value: "Mango"),
      KeyValue(key: "kiwi", value: "Kiwi"),
      KeyValue(key: "melon", value: "Melon"),
    ];

    formHandler = BFFormHandler();

    formHandler.add<TextEditingController>("full_name", TextEditingController());
    formHandler.add<KeyValue?>("choice", null);
  }

  @override
  void dispose() {
    formHandler.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BFAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formHandler.key,
            child: BFColumn(
              spacing: 20,
              children: [
                BFInputTextField(
                  controller: formHandler.get<TextEditingController>("full_name"),
                  label: "Full name",
                  isRequired: true,
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
                BFDropdownButtonField<KeyValue>(
                  items: data
                      .map((e) => DropdownMenuItem<KeyValue>(
                            value: e,
                            child: Text(
                              e.value,
                            ),
                          ))
                      .toList(),
                  onChanged: (item) {
                    formHandler.set("choice", item);
                  },
                  isRequired: true,
                  value: formHandler.get<KeyValue?>("choice"),
                  label: "Option",
                ),
                BFButton(
                    onPressed: () {
                      if (formHandler.key.currentState!.validate()) {
                        print(formHandler.getAll());
                      }
                    },
                    child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KeyValue {
  String key;
  String value;
  KeyValue({required this.key, required this.value});
}
