import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';

class CardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double plainTextSize;
        Breakpoints.isMobile(constraints)
            ? plainTextSize = 20
            : plainTextSize = 16;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36)),
                shadowColor: Theme.of(context).primaryColor,
                child: Container(
                  padding: EdgeInsets.all(
                      Breakpoints.isMobile(constraints) ? 8 : 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: Breakpoints.isMobile(constraints) ? 3 : 9,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Card Number",
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
                          SizedBox(
                            width: Breakpoints.isMobile(constraints) ? 8 : 32,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "CVV",
                                hintStyle: TextStyle(
                                  fontSize: plainTextSize,
                                ),
                              ),
                              enableSuggestions: true,
                              style: TextStyle(
                                fontSize: plainTextSize,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Validity ",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: plainTextSize,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "MM",
                                hintStyle: TextStyle(
                                  fontSize: plainTextSize,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              enableSuggestions: true,
                              style: TextStyle(
                                fontSize: plainTextSize,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "YY",
                                hintStyle: TextStyle(
                                  fontSize: plainTextSize,
                                  letterSpacing: 2.0,
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
                              "Name",
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
                                hintText: "Name",
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
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
