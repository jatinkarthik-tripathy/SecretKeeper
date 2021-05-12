import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum types { password, notes, cards, account }

class AddSecret extends StatefulWidget {
  @override
  _AddSecretState createState() => _AddSecretState();
}

class _AddSecretState extends State<AddSecret> {
  types selectedType = types.password;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double headingTextSize = 24;
      double plainTextSize = 12;
      return AlertDialog(
        title: Text(
          "Add a Secret",
          style: TextStyle(
            fontSize: headingTextSize,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).accentColor,
        content: Container(
          width: constraints.maxWidth * 0.5,
          height: constraints.maxHeight * 0.6,
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: plainTextSize,
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
                fontSize: plainTextSize,
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
    });
  }
}
