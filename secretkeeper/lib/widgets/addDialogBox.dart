import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum types { password, notes, cards, account }

class AddDialogBox extends StatefulWidget {
  final double plainTextSize;
  final double headingTextSize;
  final BoxConstraints constraints;

  const AddDialogBox({
    @required this.constraints,
    @required this.plainTextSize,
    @required this.headingTextSize,
  });
  @override
  _AddDialogBoxState createState() => _AddDialogBoxState();
}

class _AddDialogBoxState extends State<AddDialogBox> {
  types selectedType = types.password;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add a Secret",
        style: TextStyle(
          fontSize: widget.headingTextSize,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Container(
        width: widget.constraints.maxWidth * 0.5,
        height: widget.constraints.maxHeight * 0.6,
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: widget.plainTextSize,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          width: 32,
        ),
        TextButton(
          child: Text(
            'Add Entry',
            style: TextStyle(
              fontSize: widget.plainTextSize,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
