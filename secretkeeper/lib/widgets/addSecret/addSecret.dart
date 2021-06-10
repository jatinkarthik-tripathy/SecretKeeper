import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secretkeeper/models/breakpoints.dart';
import 'package:secretkeeper/widgets/addSecret/cardContainer.dart';
import 'package:secretkeeper/widgets/addSecret/noteContainer.dart';
import 'package:secretkeeper/widgets/addSecret/passwordContainer.dart';

enum types { password, notes, cards, account }

class AddSecret extends StatefulWidget {
  @override
  _AddSecretState createState() => _AddSecretState();
}

class _AddSecretState extends State<AddSecret> {
  types selectedType = types.password;
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double plainTextSize;
      double headingTextSize;
      Breakpoints.isMobile(constraints)
          ? plainTextSize = 20
          : plainTextSize = 16;
      Breakpoints.isDesktop(constraints)
          ? headingTextSize = 32
          : headingTextSize = 24;
      return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Breakpoints.isMobile(constraints)
                ? Text(
                    "Add a Secret",
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
            TabBar(
              labelColor: Theme.of(context).backgroundColor,
              unselectedLabelColor: Theme.of(context).primaryColor,
              enableFeedback: true,
              indicatorPadding: EdgeInsets.all(0),
              // isScrollable: true,
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
                fontSize: plainTextSize + 2,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: plainTextSize - 2,
              ),
              tabs: Breakpoints.isMobile(constraints)
                  ? [
                      Tab(
                        icon: Icon(Icons.security),
                      ),
                      Tab(
                        icon: Icon(Icons.note),
                      ),
                      Tab(
                        icon: Icon(Icons.credit_card_rounded),
                      ),
                      // Tab(
                      //   icon: Icon(Icons.account_balance_rounded),
                      // ),
                    ]
                  : [
                      Tab(
                        text: "Password",
                      ),
                      Tab(
                        text: "Note",
                      ),
                      Tab(
                        text: "Card",
                      ),
                      // Tab(
                      //   text: "Accounts",
                      // ),
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
                  ),
                  padding: EdgeInsets.all(constraints.maxWidth * 0.01),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: PasswordContainer(
                          titleController: titleController,
                        ),
                      ),
                      Divider(
                        thickness: 4,
                        color: Theme.of(context).primaryColor,
                      ),
                      Expanded(
                        flex: 1,
                        child: encrypt(
                          constraints,
                          plainTextSize,
                          titleController,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 4,
                    ),
                  ),
                  padding: EdgeInsets.all(constraints.maxWidth * 0.01),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: NoteContainer(),
                      ),
                      Divider(
                        thickness: 4,
                        color: Theme.of(context).primaryColor,
                      ),
                      Expanded(
                        flex: 1,
                        child: encrypt(
                          constraints,
                          plainTextSize,
                          titleController,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 4,
                    ),
                  ),
                  padding: EdgeInsets.all(constraints.maxWidth * 0.01),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CardContainer(),
                      ),
                      Divider(
                        thickness: 4,
                        color: Theme.of(context).primaryColor,
                      ),
                      Expanded(
                        flex: 1,
                        child: encrypt(
                          constraints,
                          plainTextSize,
                          titleController,
                        ),
                      )
                    ],
                  ),
                ),
                // accountContainer(constraints, plainTextSize, headingTextSize),
              ]),
            )
          ],
        ),
      );
    });
  }

  Widget encrypt(
    BoxConstraints constraints,
    double plainTextSize,
    TextEditingController titleController,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Master Key",
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
                  hintText: "Master Key",
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                "Encrypt",
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
        )
      ],
    );
  }

  Widget accountContainer(
    BoxConstraints constraints,
    double plainTextSize,
    double headingTextSize,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 4,
        ),
        color: Colors.deepPurple,
      ),
    );
  }
}
