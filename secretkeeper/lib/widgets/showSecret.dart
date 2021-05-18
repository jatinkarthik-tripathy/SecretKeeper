import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';

class ShowSecret extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double plainTextSize;
        double headingTextSize;
        Breakpoints.isMobile(constraints)
            ? plainTextSize = 20
            : plainTextSize = 16;
        Breakpoints.isMobile(constraints)
            ? headingTextSize = 24
            : headingTextSize = 32;
        return Column(
          children: [
            Breakpoints.isMobile(constraints)
                ? Text(
                    "Your Secret",
                    style: TextStyle(
                      fontSize: headingTextSize,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
            SizedBox(
              height: 24,
            ),
          ],
        );
      },
    );
  }
}
