import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';

class NoteContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double plainTextSize;
        Breakpoints.isMobile(constraints)
            ? plainTextSize = 20
            : plainTextSize = 16;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Title",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: plainTextSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Title",
                      hintStyle: TextStyle(
                        fontSize: plainTextSize,
                      ),
                    ),
                    enableSuggestions: true,
                    style: TextStyle(
                      fontSize: plainTextSize,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Note",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: plainTextSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Note",
                      hintStyle: TextStyle(
                        fontSize: plainTextSize,
                      ),
                    ),
                    enableSuggestions: true,
                    style: TextStyle(
                      fontSize: plainTextSize,
                    ),
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
