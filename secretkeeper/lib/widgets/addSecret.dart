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
      double headingTextSize = 36;
      double plainTextSize = 20;
      return SimpleDialog(
        title: Text(
          "Add a Secret",
          style: TextStyle(
            fontSize: headingTextSize,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        children: [
          Container(
            width: constraints.maxWidth * 0.5,
            height: constraints.maxHeight * 0.6,
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.01,
            ),
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Theme.of(context).backgroundColor,
                    unselectedLabelColor: Theme.of(context).primaryColor,
                    enableFeedback: true,
                    indicatorPadding: EdgeInsets.all(0),
                    overlayColor:
                        MaterialStateProperty.all<Color?>(Colors.transparent),
                    indicator: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36.0),
                        topRight: Radius.circular(36.0),
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontSize: plainTextSize + 4,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: plainTextSize - 4,
                    ),
                    tabs: [
                      Tab(
                        text: "Password",
                      ),
                      Tab(
                        text: "Note",
                      ),
                      Tab(
                        text: "Card",
                      ),
                      Tab(
                        text: "Bank Account",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 4,
                          ),
                          color: Colors.amber,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 4,
                          ),
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 4,
                          ),
                          color: Colors.cyan,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 4,
                          ),
                          color: Colors.deepPurple,
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
          // TextButton(
          //   child: Text(
          //     'Cancel',
          //     style: TextStyle(
          //       fontSize: plainTextSize,
          //       color: Theme.of(context).primaryColor,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          // SizedBox(
          //   width: 32,
          // ),
          // TextButton(
          //   child: Text(
          //     'Add Entry',
          //     style: TextStyle(
          //       fontSize: plainTextSize,
          //       color: Theme.of(context).primaryColor,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      );
    });
  }
}
