import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';

class PasswordContainer extends StatelessWidget {
  final TextEditingController titleController;

  const PasswordContainer({Key? key, required this.titleController})
      : super(key: key);
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
                  flex: Breakpoints.isMobile(constraints) ? 2 : 4,
                  child: TextField(
                    controller: titleController,
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
                      color: Theme.of(context).primaryColor,
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
                    "Username",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: plainTextSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: Breakpoints.isMobile(constraints) ? 2 : 4,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Username",
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
                    "Password",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: plainTextSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: Breakpoints.isMobile(constraints) ? 2 : 4,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
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
          ],
        );
      },
    );
  }
}
