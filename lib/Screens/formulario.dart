import 'package:flutter/material.dart';

class CheckboxState {
  final String title;
  bool value;

  CheckboxState({
    required this.title,
    this.value = false,
  });
}

class CheckboxContainer extends StatefulWidget {
  final List<CheckboxState> checkboxes;

  CheckboxContainer({required this.checkboxes});

  @override
  _CheckboxContainerState createState() => _CheckboxContainerState();
}

class _CheckboxContainerState extends State<CheckboxContainer> {
  CheckboxState? selectedCheckbox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: widget.checkboxes.map((checkboxState) {
          return CheckboxListTile(
            title: Text(checkboxState.title),
            value: checkboxState.value,
            onChanged: (value) {
              setState(() {
                checkboxState.value = value ?? false;
                if (value ?? false) {
                  selectedCheckbox = checkboxState;
                } else {
                  selectedCheckbox = null;
                }
              });
            },
          );
        }).toList(),
      ),
    ));
  }

  void showSelectedCheckbox() {
    if (selectedCheckbox != null) {
      print('Checkbox seleccionado: ${selectedCheckbox!.title}');
    }
  }
}
